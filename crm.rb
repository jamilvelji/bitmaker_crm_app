class CRM
  attr_reader :name

  def initialize(name)
    @name = name
    @blackbook = BlackBook.new
  end

  def print_options_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    print "\nEnter a number: "
  end

  def options_menu
    puts "--- Welcome to the CRM #{@name} ---\n"
    print_options_menu
    user_selected_option = gets.chomp.to_i
    call_option(user_selected_option)
  end

  def call_option(user_selected_option)
    case user_selected_option
    when 1 then add_new_crm_contact
    when 2 then modify_crm_contact
    when 3 then delete_crm_contact
    when 4 then display_crm_contacts
    when 5 then display_attribute
    when 6
      puts "Exiting..."
      return
    else
      puts "Invalid option, please try again"
      sleep(1)
      puts "\e[H\e[2J"
      options_menu
    end
  end

  def add_new_crm_contact
    puts "Please enter the new contact's information below\n"
    print "First Name: "
    first_name = gets.chomp

    print "Last Name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(Contact.new(first_name, last_name, email, notes))
    
    puts "Contact has been added."
    sleep(2)

    puts "\e[H\e[2J"

    options_menu
  end

  def modift_crm_contact

  end

  def delete_crm_contact

  end

  def display_crm_contacts

  end

  def display_attribute
    
  end

end

class Contact
  def initialize(first_name, last_name, email, notes)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end
end

class BlackBook
  def initialize
    @contact_id = 10000
    @contacts = []
  end
end

crm = CRM.new("Jamil's CRM")
crm.options_menu