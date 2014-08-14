class BlackBook
  def initialize
    @contacts = []
    @contact_id = 0
  end

  def add_contact(contact)
    contact.id = @contact_id
    @contacts << contact
    @contact_id += 1
    return contact.id
  end

  def edit_contact(id, replacement)
    contact_index = @contacts.index(find_contact(id))

    if !contact_index
      puts "ID Not Found"
    else
      @contacts[contact_index] = replacement
    end
  end

  def find_contact(id)
    @contacts.find {|contact| @contact_id == id}
  end

  def delete_contact(id)
    contact_index = @contacts.index(find_contact(id))

    if !contact_index
      puts "ID Not Found"
    else
      @contacts[contact_index].delete
    end
  end

  def display_all_contacts
    @contacts.each do |contact|
      puts "Name: #{contact.first_name} #{contact.last_name}"
      puts "Email: #{contact.email}"
      puts "Notes: #{contact.notes}"
    end
  end

  def display_contact(id)
    contact_index = @contacts.index(find_contact(id))

    if !contact_index
      puts "ID Not Found"
    else
      puts "#{@contacts[contact_index].first_name} #{@contacts[contact_index].last_name}"
      puts "#{@contacts[contact_index].email}"
      puts "#{@contacts[contact_index].notes}"
    end
  end

  def display_attribute(property, id)
    contact_index = @contacts.index(find_contact(id))

    if !contact_index
      puts "ID Not Found"
    else
      case property
      when 1 then puts "#{@contacts[contact_index].first_name}"
      when 2 then puts "#{@contacts[contact_index].last_name}"
      when 3 then puts "#{@contacts[contact_index].email}"
      when 4 then puts "#{@contacts[contact_index].notes}"
      end 
    end 
  end
end








#   @@contacts = []
#   @contact_id = 0

#   def self.contact(contact_id)
#     @@contacts[contact_id - 1]
#   end

#   def self.add(contact)
#     @@contacts << contact
#   end

#   def self.length
#     @@contacts.length
#   end

#   def self.modify_contact(contact_id, attribute, modified_value)
#     case attribute
#       when 1 then contact(contact_id).first_name = modified_value
#       when 2 then contact(contact_id).last_name = modified_value
#       when 3 then contact(contact_id).email = modified_value
#       when 4 then contact(contact_id).notes = modified_value
#     end
#   end

#   def self.search(choice, search)
#     case choice
#       when 1 
#         @@contacts.each {|contact| contact.display if contact.first_name.downcase == search.downcase}
#       when 2
#         @@contacts.each {|contact| contact.display if contact.last_name.downcase == search.downcase}
#       when 3
#         @@contacts.each {|contact| contact.display if contact.email.downcase == search.downcase}
#       when 4 
#         @@contacts.each {|contact| contact.display if contact.notes.downcase == search.downcase}
#     end
#   end

#   def self.display_all_contacts
#     @@contacts.each {|contact| contact.display}
#   end

#   def self.display_particular_contact(contact_id)
#     @@contacts[contact_id]
#   end

#   def self.delete_contact(contact_id)
#     @@contacts.delete(contact(contact_id))
#     adjust_contact_ids
#   end

#   def self.adjust_contact_ids
#     @@contacts.each {|contact| contact.contact_id = (@@contacts.index(contacts) + 1)}
#   end
# end