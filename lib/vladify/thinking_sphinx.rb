namespace :remote do
  namespace :sphinx do
    %w/index start restart stop rebuild config/.each do |op|
      desc "#{op} sphinx"
      remote_task op.to_sym, :roles => :app do
        run rake("ts:#{op}")
      end
    end
  end
end
$config_tasks << "remote:sphinx:config"
$restart_tasks   << "remote:sphinx:rebuild"