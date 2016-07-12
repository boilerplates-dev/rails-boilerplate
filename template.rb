# Borrow from 80percent
def get_remote(src, dest = nil)
  dest ||= src
  repo = 'https://raw.githubusercontent.com/hbin/rails-boilerplate/master/'
  remote_file = repo + src
  remove_file dest
  get(remote_file, dest)
end

get_remote 'Gemfile'
get_remote 'env.example', '.env.example'

after_bundle do
  generate 'kaminari:config'
  generate 'simple_form:install', '--bootstrap'
end

after_bundle do
  say 'Create home page'
  generate(:controller, 'home index')
  route "root to: 'home#index'"
end

after_bundle do

  say 'Init git'
  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"

  say 'Create database'
  rake 'db:create'

  say 'Build successfully!'
end
