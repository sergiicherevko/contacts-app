require "unirest"

system "clear"

puts "Welcome to Recipe app! Choose an option:"
puts "[1] See all recipes"
puts "[2] See one recipe"
puts "[3] Create a recipe"
puts "[4] Update a recipe"
puts "[5] Delete a recipe"

user_input = gets.chomp.to_i

if 
  user_input == 1
  response = Unirest.get("http://localhost:3000/v1/contacts")
  body = response.body
  puts JSON.pretty_generate(body)
elsif 
  user_input == 2
  puts "Enter contact id "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts/#{contact_id}")
  body = response.body
  puts JSON.pretty_generate(body)
elsif 
  user_input == 3 
  params = {}
  print "First Name: "
  params["first_name"] = gets.chomp
  print "Last Name: "
  params["last_name"] = gets.chomp
  print "Mid Name: "
  params["mid_name"] = gets.chomp
  print "Number: "
  params["number"] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/contacts", parameters: params)
  body = response.body

  if body["errors"]
    puts "Uh oh! Something went wrong..."
    p body["errors"]
  else
    body = response.body
    puts JSON.pretty_generate(body)
  end
elsif 
  user_input == 4 
  params = {}
  print "Print ID: "
  params["id"] = gets.chomp
  print "First Name: "
  params["first_name"] = gets.chomp
  print "Last Name: "
  params["last_name"] = gets.chomp
  print "Number: "
  params["number"] = gets.chomp
  print "Mid Name: "
  params["mid_name"] = gets.chomp
  params.delete_if { |_key, value| value.empty? } 
  response = Unirest.patch("http://localhost:3000/v1/contacts/#{contact_id}", parameters: params)
  body = response.body
  if body["errors"]
    puts "Uh oh! Something went wrong..."
    p body["errors"]
  else
    body = response.body
    puts JSON.pretty_generate(body)
  end
elsif 
  user_input == 5

  print "Enter the contact ID: "
  contact_id = gets.chomp

  response = Unirest.delete("http://localhost:3000/v1/contacts/#{contact_id}")
  body = response.body

  puts JSON.pretty_generate(body)
end