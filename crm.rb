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
    puts "[3] Delete a contact"
    puts "[4] Display contacts"
    puts "[5] Display an attribute"
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
    when 3 then delete_crm_contact
    when 4 then display_crm_contact
    when 5 then display_attribute
    when 6
      puts "\nExiting..."
      return
    else
      puts "\nInvalid option, please try again"
      sleep(1)
      puts "\e[H\e[2J"
      options_menu
    end
  end

  def add_new_crm_contact
    puts "\e[H\e[2J"
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

    puts "\e[H\e[2J"

    options_menu
  end

  def modify_crm_contact
    puts "\e[H\e[2J"
    puts ""
  end

  def delete_crm_contact
    puts "\e[H\e[2J"
    puts "Enter the name of the contact to be deleted: "

  end

  def display_crm_contact
    puts "\e[H\e[2J"
    puts "Options:"
    puts "'Display All' - Shows all contacts"
    puts "'Display Contact' - Displays a particular contact"
    display_option = gets.chomp.downcase
    call_display_menu_option(display_selected_option)
  end

  def call_display_menu_option(display_selected_option)
    case display_selected_option
      when "display all" then display_all_contacts
      when "display_contact" then display_contact_sub_menu
      else
        puts "Invalid option, please try again."
        sleep(1)
        puts "\e[H\e[2J"
        display_crm_contact
    end
  end

  def display_attribute
    puts "\e[H\e[2J"
  end
end

CRM.run("Jamil's CRM")