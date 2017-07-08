namespace :user do
  desc "enable user"
  task :enable_user => :environment do
    begin
      users = User.all
      User.transaction do
        users.each do |user|
          user.update_column(:active ,1)
        end
      end
      puts "保存数据成功"
    rescue
      puts "保存数据失败"
    end
  end
end

# rake user:enable_user