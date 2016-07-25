role :app, %w(deploy@sample.com)
role :web, %w(deploy@sample.com)
role :db,  %w(deploy@sample.com)

set :stage, :production
set :branch, 'master'

set :nginx_server_name, 'sample.com assets.sample-cdn.com'
