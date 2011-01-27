ln_shared << ".bundle"

namespace :bundle do
  desc "install bundled gems"
  task :install do
    run "bundle install --without test"
  end
end

namespace :remote do
  namespace :bundle do
    desc "remote bundle install"
    remote_task :install, :roles => :app do
      run "cd #{current_release} && bundle install --without test"
    end

  end
end

Rake::Task["vlad:update_symlinks"].prerequisites << "remote:bundle:install"
