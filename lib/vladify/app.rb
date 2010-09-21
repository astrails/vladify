namespace :remote do
  namespace :app do
    desc "start the app with first request"
    remote_task :request do
      run "curl http://#{domain.split(/@/).last}/"
    end
  end
end

namespace :deploy do
  task :restart => "remote:app:request"
end
