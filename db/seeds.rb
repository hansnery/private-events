first_names = []
last_names = []
users = []
locations = []
events = [ "Party", "Birthday", "Soirée", "Movie Night", "Pizza Night", "Pajama Party", "Rally", "Concert", "Conference", "Workshop", "Seminar", "Show", "Panel", "Get Together", "Class", "Zoom Meeting", "Expo", "Award", "Festival" ]
File.open(File.join(File.dirname(__FILE__), 'names.txt'), "r").each_line do |line|
  first_names << line.chomp
end
File.open(File.join(File.dirname(__FILE__), 'last_names.txt'), "r").each_line do |line|
  last_names << line.downcase.capitalize.chomp
end
File.open(File.join(File.dirname(__FILE__), 'cities.txt'), "r").each_line do |line|
  locations << line.chomp
end
20.times do
  first_name = first_names.sample
  last_name = last_names.sample
  email = "#{first_name.chomp.downcase}@#{first_name.chomp.downcase}.com"
  user = User.create!(email: email, first_name: first_name, last_name: last_name, admin: false, password: "#{first_name.chomp.downcase}123" )
  user.save!
  users << user
end
20.times do
  future_date = DateTime.new(DateTime.now.year + rand(1), DateTime.now.month  + rand(3), DateTime.now.day  + rand(14))
  host = users.sample
  event_type = events.sample
  event = "#{host.first_name.chomp}'s #{event_type}"
  event = Event.create!(name: event, location: locations.sample, user_id: host.id, private: false, desc: "Please, attend my #{event_type}!", date: future_date)
  event.save!
end
