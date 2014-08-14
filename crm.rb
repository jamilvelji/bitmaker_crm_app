require_relative 'contact'
require_relative 'blackbook'

class CRM
  attr_reader :name

  def self.run(name)
    crm = new(name)
    crm.options_menu
  end

  def initialize(name)
    @name = name
    @blackbook = BlackBook.new
    puts "\n\n--- Welcome to your CRM #{@name} ---\n\n"
  end

  def print_options_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Display all the contacts"
    puts "[4] Delete a contact"
    puts "[5] Display a contact"
    puts "[6] Display an attribute"
    puts "[7] Exit"
    print "\nEnter a number: "
  end

  def options_menu
    print_options_menu
    user_selected_option = gets.chomp.to_i
    call_main_menu_option(user_selected_option)
    reset
  end

  def call_main_menu_option(user_selected_option)
    case user_selected_option
    when 1 then add_new_crm_contact
    when 2 then modify_crm_contact
    when 3 then display_crm_contacts
    when 4 then delete_crm_contact
    when 5 then display_contact
    when 6 then display_attribute
    when 7
      puts "\nExiting..."
      sleep(1)
      exit
    else
      puts "\nInvalid option, please try again"
      sleep(1)
      reset
      options_menu
    end
  end

  def add_new_crm_contact
    reset
    puts "Please enter the new contact's information below\n\n"
    
    print "First Name: "
    first_name = gets.chomp
    until first_name.empty? == false
      print "First Name: "
      first_name = gets.chomp
    end

    print "Last Name: "
    last_name = gets.chomp
    until last_name.empty? == false
      print "Last Name: "
      last_name = gets.chomp 
    end

    print "Email: "
    email = gets.chomp
    until email.empty? == false
      print "Email: "
      email = gets.chomp
    end

    print "Notes: "
    notes = gets.chomp
    until notes.empty? == false
      print "Notes: "
      notes = gets.chomp
    end

    new_contact = @blackbook.add_contact(Contact.new(first_name, last_name, email, notes))

    puts "\nContact has been added."
    sleep(2)

    reset

    options_menu
  end

  def modify_crm_contact
    reset
    puts "Please enter the ID of the contact you would like to modify:"
    contact_id = gets.chomp.to_i
    linespacer
    puts "What is the new first name?"
    new_first_name = gets.chomp
    linespacer
    puts "What is the new last name?"
    new_last_name = gets.chomp
    linespacer
    puts "What is the new email?"
    new_email = gets.chomp
    linespacer
    puts "What are the new notes?"
    new_notes = gets.chomp

    replacement_contact = Contact.new(new_first_name, new_last_name, new_email, new_notes)
    @blackbook.edit_contact(contact_id, replacement_contact)

    puts "\nContact modified.\n"
    sleep(2)

    reset

    options_menu
  end

  def delete_crm_contact
    reset
    puts "Please enter the ID of the contact you would like to delete?"
    contact_id = gets.chomp.to_i

    @blackbook.delete_contact(contact_id)
    puts "Contact has been deleted."
    sleep(2)

    reset

    options_menu
  end

  def display_contact
    reset
    linespacer
    puts "What is the contact ID of the contact would you like to see?"
    contact_id = gets.chomp.to_i

    @blackbook.display_contact(contact_id)
    menu_return
  end

  def display_attribute
    reset
    puts "What is the ID of the contact who's attribute you like to display?\n\n"
    contact_id = gets.chomp.to_i
    puts "What attribute would you like to display?"
    puts "[1] for first name"
    puts "[2] for last name"
    puts "[3] for email"
    puts "[4] for note"
    linespacer
    property = gets.chomp.to_i
    linespacer
    @blackbook.display_attribute(property, contact_id)
    menu_return
    reset
  end

  def display_crm_contacts
    reset
    @blackbook.display_all_contacts
    menu_return
  end

  def menu_return
    puts "\nPress enter to return to the main menu\n"
    gets
    options_menu
  end

  def reset
    puts "\e[H\e[2J"
  end

  def linespacer
    puts ""
  end

  def exit
    reset
    puts "Are you sure you want to exit? (y/n)"
    response = gets.chomp.downcase
    response == "y" ? return : options_menu
  end

end

CRM.run("Jamil")
