require "./contact"

class AddressBook
  attr_reader :contacts
  
  def initialize
    @contacts = []
  end
  
  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    puts "Name search results (#{search})"
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      contact.print_emails
      puts "\n"
    end
  end
  
  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new

parent = Contact.new
parent.first_name = "Mama"
parent.last_name = "Odie"
parent.add_email("mamaodie@internet.com")
parent.add_phone_number("Home", "123-456-7890")
parent.add_phone_number("Work", "456-789-0123")
parent.add_address("Home", "123 Main St.", "", "Saint Louis", "MO", "12345")

babysitter = Contact.new
babysitter.first_name = "Mary"
babysitter.last_name = "Poppins"
babysitter.add_email("marypoppins@internet.com")
babysitter.add_phone_number("Home", "222-222-2222")
babysitter.add_address("Home", "222 Two Lane", "", "St. Louis", "MO", "12345")

address_book.contacts.push(parent)
address_book.contacts.push(babysittter)

#address_book.print_contact_list

address_book.find_by_name("e")