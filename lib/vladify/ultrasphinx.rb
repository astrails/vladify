namespace :remote do
  namespace :sphinx do
    %w/start restart stop conf index/.each do |op|
      desc "#{op} sphinx"
      remote_task op.to_sym, :roles => :app do
        run rake("us:#{op}")
      end
    end
    task :config => "remote:sphinx:conf"

    remote_task :rebuild, :roles => :app do
      run rake("us:stop") rescue nil
      run rake("us:index")
      run rake("us:start")
    end
  end
end
$config_tasks  << "remote:sphinx:config"
$restart_tasks << "remote:sphinx:rebuild"