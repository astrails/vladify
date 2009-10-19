namespace :remote do
  namespace :gettext do
    remote_task :mo do
      run rake("gettext:mo")
    end
  end
end
