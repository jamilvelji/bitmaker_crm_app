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
    puts "--- Welcome to the CRM #{@name} ---\n"
  end

  def print_options_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Search for a contact"
    puts "[4] Display all contacts"
    puts "[5] Delete a contact"
    puts "[6] Exit"
    print "\nEnter a number: "
  end

  def options_menu
    print_options_menu
    user_selected_option = gets.chomp.to_i
    call_main_menu_option(user_selected_option)
  end

  def call_main_menu_option(user_selected_option)
    case user_selected_option
    when 1 then add_new_crm_contact
    when 2 then modify_crm_contact
    when 3 then search_crm_contact
    when 4 then display_crm_contacts
    when 5 then delete_crm_contact
    when 6
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

    @blackbook.add_contact(Contact.new(first_name, last_name, email, notes))

    puts "\nContact has been added."
    sleep(2)

    reset

    options_menu
  end

  def modify_crm_contact
    reset
    puts "Please enter the ID of the contact you would like to modify:"
    id = select_contact_id(selected_id)
    display_contact(id)
    puts "What attribute would you like to modify?"
    attribute = attribute_select
    puts "What would you like to change this to?"
    modified_value = gets.chomp
    BlackBook.modify_contact(id, attribute, modified_value)
    puts "\n Contact modified.\n"
    sleep(2)

    reset

    options_menu
  end

  def search_crm_contact
    puts "Which attribute would you like to search by?"
    choice = attribute_select
    puts "What are you searching for?"
    search = gets.chomp
    BlackBook.search(choice, search)
    menu_return
  end

  def display_contact(id)
    BlackBook.display_particular_contact(id)
  end

  def display_crm_contacts
    BlackBook.display_all_contacts
    menu_return
  end

  def delete_crm_contact
    puts "Please enter the ID of the contact you would like to delete?"
    id = select_contact_id(selected_id)
    BlackBook.delete_contact(id)
    puts "Contact has been deleted."
    sleep(2)

    reset

    options_menu
  end

  def display_contacts
    BlackBook.display_all_contacts
  end

  def select_contact_id(message)
    display_contacts
    puts "#{message}"
    id = gets.to_i
    if BlackBook.contact(id).nil?
      while contact(id).nil?
        reset
        puts "That isn't a contact, please try again."
        display_contacts
        id = gets.to_i
      end
    end
    return id
  end

  def attribute_select
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Note"
    print "Please enter a number: "
    choice = gets.to_i
    if choice <= 4
      choice
    else
      puts "Invalid option, please try again"
      gets
      reset
      attribute_select
    end
  end

  def menu_return
    puts "Press any key to return to the main menu"
    gets
    options_menu
  end

  def reset
    puts "\e[H\e[2J"
  end

  def exit
    reset
    puts "Are you sure you want to exit? (y/n)"
    response = gets.chomp.downcase
    response == "y" ? return : options_menu
  end

  def nil_check(result)
    if result.nil?
      puts "I can't find that."
    else
      result
    end
  end

end

CRM.run("Jamil's CRM")