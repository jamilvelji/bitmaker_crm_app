class BlackBook
  def initialize
    @contact_id = 1
    @contacts = []
  end

  def add_contact(contact)
    @contacts << contact
    contact.id = @contact_id
    @contact_id += 1
  end

  #def find(contact)
  #def delete(contact)
  #def modify(contact)
end