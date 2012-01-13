require 'waz-queues'

account_name = "raceariofrio"
access_key = "GDyrT8XE/AaVZuX1XJ08eIHoOCU0pEGeJR/hts5EIvI4xawd7FR9SRVnmtM6qk0y77E6jlONgn4GC/Wm29abIg=="

WAZ::Storage::Base.establish_connection! :account_name => account_name, :access_key => access_key

# Queue.ensure is syntactic sugar for (1) does queue exist? (2) if not, create queue
puts "making sure queue exists" and queue = WAZ::Queues::Queue.ensure('my-demo-queue')
puts "querying size of queue: " + queue.size.to_s

puts "putting message into queue" and queue.enqueue! "hey this is my message"
puts "querying size of queue: " + queue.size.to_s

puts "pulling message from queue: " + (message = queue.lock).message_text
puts "querying size of queue: "  + queue.size.to_s

puts "deleting message from queue" and message.destroy!
puts "querying size of queue: "  + queue.size.to_s
