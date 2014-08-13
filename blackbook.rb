class BlackBook
  @@contacts = []
  @contact_id = 0

  def self.contact(contact_id)
    @@contacts[contact_id - 1]
  end

  def self.add(contact)
    @@contacts << contact
  end

  def self.length
    @@contacts.length
  end

  def self.modify_contact(contact_id, attribute, modified_value)
    case attribute
      when 1
        contact(contact_id).first_name = modified_value
      when 2
        contact(contact_id).last_name = modified_value
      when 3
        contact(contact_id).email = modified_value
      when 4
        contact(contact_id).notes = modified_value
    end
  end

  def self.search(choice, search)
    case choice
      when 1 
        @@contacts.each {|contact| contact.display if contact.first_name.downcase == search.downcase}
      when 2
        @@contacts.each {|contact| contact.display if contact.last_name.downcase == search.downcase}
      when 3
        @@contacts.each {|contact| contact.display if contact.email.downcase == search.downcase}
      when 4 
        @@contacts.each {|contact| contact.display if contact.notes.downcase == search.downcase}
    end
  end

  def self.display_all_contacts
    @@contacts.each {|contact| contact.display}
  end

  def self.display_particular_contact(contact_id)
    @@contacts[contact_id]
  end

  def self.delete_contact(contact_id)
    @@contacts.delete(contact(contact_id))
    adjust_contact_ids
  end

  def self.adjust_contact_ids
    @@contacts.each {|contact| contact.contact_id = (@@contacts.index(contacts) + 1)}
  end
end