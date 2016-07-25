# Borrow from 80percent
def get_remote(src, dest = nil)
  dest ||= src
  repo = 'https://raw.githubusercontent.com/hbin/rails-boilerplate/master/'
  remote_file = repo + src
  remove_file dest
  get(remote_file, dest)
end

get_remote 'ruby-version', '.ruby-version'
get_remote 'Gemfile'

# Stop spring first of all to prevent hangs
# FYI: https://github.com/rails/spring/issues/265
after_bundle do
  get_remote 'config/spring.rb'
  run 'spring stop'
end

after_bundle do
  say 'Setup kaminari and simple_form'
  generate 'kaminari:config'
  generate 'simple_form:install', '--bootstrap'
end

after_bundle do
  say 'Setup Rack::Cors'
  get_remote 'config/initializers/cors.rb'
end

after_bundle do
  say 'Setup Capistrano'
  get_remote 'config/deploy.rb'
  get_remote 'config/deploy/production.rb'
  get_remote 'config/deploy/templates/nginx.conf.erb'
  get_remote 'lib/capistrano/passenger/nginx.rake'
end

after_bundle do
  say 'Setup New Relic'
  get_remote 'config/newrelic.yml'
end

after_bundle do
  say 'Initialize git'
  get_remote 'gitignore', '.gitignore'
  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end

after_bundle do
  say 'Dotenv'
  get_remote 'env.example', '.env.example'
  run 'cp .env.example .env'
  say 'Please add your application configuration to your .env file in the root \
of your project'
end

after_bundle do
  say 'Create database'
  rake 'db:create'
end

after_bundle do
  say <<-EOF
===============================================================================

    You have initialized #{app_name} by rails-boilerplate successfully!

===============================================================================
EOF
end
