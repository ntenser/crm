require './contact.rb'

class CRM

  def main_menu
   print_main_menu
   user_selected = gets.to_i
   call_option(user_selected)
  end

  def print_main_menu
   puts '[1] Add a new contact'
   puts '[2] Modify an existing contact'
   puts '[3] Delete a contact'
   puts '[4] Display all the contacts'
   puts '[5] Search by attribute'
   puts '[6] Exit'
   puts 'Enter a number: '
  end

  def call_option
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
  end

  def add_new_contact
   print 'Enter First Name: '
   first_name = gets.chomp

   print 'Enter Last Name: '
   last_name = gets.chomp

   print 'Enter Email Address: '
   email = gets.chomp

   print 'Enter a Note: '
   note = gets.chomp

   Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "Enter id of the contact you want to modify"
    id = gets.chomp.to_i
    puts "Enter the attribute you would like to modify"
    attribute = gets.chomp
    puts "Enter modification"
    value = gets.chomp
    puts "Contact updated"
  end

  def delete_contact
    pop_contact = Contact.find(id)
    puts "Enter id of the contact you want to delete"
    id = gets.chomp.to_i
    pop_contact.delete
    puts "Contact deleted"
  end

  def display_all_contacts
     Contact.all
   end

  def search_by_attribute
    puts "Enter the attribute you want to search"
    attribute = gets.chomp
    puts "Enter the value of contact "
    value = get.chomp
    Contact.find_by(attribute, value)
  end
end
