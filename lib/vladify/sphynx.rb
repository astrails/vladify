namespace :remote do
  namespace :sphynx do
    remote_task :rebuild, :roles => :app do
      run rake("ultrasphinx:configure ultrasphinx:index")
      run rake("ultrasphinx:daemon:stop") rescue nil
      run rake("ultrasphinx:daemon:start")
    end
  end
end
