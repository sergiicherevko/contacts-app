class V1::ContactsController < ApplicationController
  def first_contact
    contact = Contact.first 
    render json: {
      first_name: contact.first_name,
      last_name: contact.last_name,
      number: contact.number
    }
  end

  def second_contact
    contact = Contact.second
    render json: {
      first_name: contact.first_name,
      last_name: contact.last_name,
      number: contact.number
    }
  end
end
