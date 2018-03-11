require "unirest"

system "clear"

contact = Unirest.get("http://localhost:3000/v1/sergii_contacts2")
hash = contact.body

puts JSON.pretty_generate(hash)


#respond_contact = Unirest.get("http://localhost:3000/sergii_contacts")