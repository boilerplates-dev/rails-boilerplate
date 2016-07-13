namespace :load do
  set :passenger_ruby, -> { '/usr/bin/ruby' }
  set :nginx_config_name, -> { "#{fetch(:application)}_#{fetch(:stage)}" }
  set :nginx_sites_available_path, -> { '/etc/nginx/sites-available' }
  set :nginx_sites_enabled_path, -> { '/etc/nginx/sites-enabled' }
  set :nginx_server_name, -> { "localhost #{fetch(:application)}.local" }
end

namespace :passenger do
  def passenger_ruby
    bin_ruby = fetch(:passenger_ruby)
    capture("ls -d #{bin_ruby}")
  end

  namespace :nginx do
    desc 'Setup Nginx configuration'
    task :setup do
      on roles(fetch(:passenger_roles)), in: fetch(:passenger_restart_runner), wait: fetch(:passenger_restart_wait), limit: fetch(:passenger_restart_limit) do
        erb = File.read('config/deploy/templates/nginx.conf.erb')
        upload! StringIO.new(ERB.new(erb).result(binding)), "/tmp/nginx_#{fetch(:nginx_config_name)}"
        sudo :mv, "/tmp/nginx_#{fetch(:nginx_config_name)} #{fetch(:nginx_sites_available_path)}/#{fetch(:nginx_config_name)}"
        sudo :ln, '-fs', "#{fetch(:nginx_sites_available_path)}/#{fetch(:nginx_config_name)} #{fetch(:nginx_sites_enabled_path)}/#{fetch(:nginx_config_name)}"
      end
    end
  end
end
