namespace :messages do

task :check_messages => :environment do
  Message.send_messages
end

end

