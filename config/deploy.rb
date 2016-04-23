# Change these
server '82.146.45.108', roles: [:web, :app, :db], primary: true

set :repo_url,        'git@github.com:pohodnya/transport.git'
set :application,     'transport'
set :user,            'deploy'
set :puma_threads,    [4, 16]
set :puma_workers,    0


# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'transport'
set :repo_url, 'git@github.com:pohodnya/transport.git'
set :sidekiq_pid, File.join(shared_path, 'pids', 'sidekiq.pid')


if File.exist?("./config/deploy_id_rsa")
  puts "file exist"
  set :ssh_options, keys: ["./config/deploy_id_rsa"]
else
  set :password, ask('Server password:', nil, echo: false)
end
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'pids',  'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')


after 'deploy:publishing', 'deploy:restart'
before 'deploy:assets:precompile', 'bower:install'
before 'deploy:assets:precompile', 'npm:install'
after 'deploy:assets:precompile', 'deploy:cleanup_assets'
after 'deploy:assets:precompile', 'ember:copy_assets'

namespace :bower do
  desc 'Install bower components'
  task :install do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "cd #{release_path}/frontend && bower install"
    end
  end
end

namespace :npm do
  desc 'Install npm components'
  task :install do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "cd #{release_path}/frontend && /usr/bin/npm prune && /usr/bin/npm install"
    end
  end
end

namespace :deploy do
  after :restart, :db_migrate do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        with rails_env: "#{fetch(:stage)}" do
          execute :rake, 'db:migrate'
        end
      end
    end
  end
end