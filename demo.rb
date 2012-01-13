require 'waz-queues'

WAZ::Storage::Base.establish_connection! \
	:account_name => ENV['AZURE_STORAGE_ACCOUNT_NAME'],
	:access_key => ENV['AZURE_STORAGE_ACCESS_KEY']

# Queue.ensure is syntactic sugar for (1) does queue exist? (2) if not, create queue
puts "making sure queue exists"
queue = WAZ::Queues::Queue.ensure('my-demo-queue')
puts "querying size of queue: " + queue.size.to_s

puts "putting message into queue" and queue.enqueue! "hey this is my message"
puts "querying size of queue: " + queue.size.to_s

puts "pulling message from queue: " + (message = queue.lock).message_text
puts "querying size of queue: "  + queue.size.to_s

puts "deleting message from queue" and message.destroy!
puts "querying size of queue: "  + queue.size.to_s
