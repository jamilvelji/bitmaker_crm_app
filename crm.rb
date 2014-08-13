class CRM
  attr_reader :name

  def initialize(name)
    @name = name
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
      options_menu
    end
  end

  def add_new_crm_contact(first_name, last_name, email, notes)
    print "First Name: "
    @first_name = gets.chomp

    print "Last_name: "
    @last_name = gets.chomp


  end

end

crm = CRM.new("Jamil's CRM")
crm.options_menu