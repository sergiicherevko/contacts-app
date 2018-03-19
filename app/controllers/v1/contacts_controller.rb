class V1::ContactsController < ApplicationController
  def index
    contacts = Contact.all 
    search_terms = params[:q]

    if search_terms
      contacts = contacts.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{search_terms}%", "%#{search_terms}%") 
    end
    render json: contacts.as_json
  end

  def show
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    render json: contact.as_json
  end

  def create
    contact = Contact.new(
        first_name: params["first_name"], 
        last_name: params["last_name"],
        mid_name: params["mid_name"], 
        number: params["number"])
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    contact = Contact.find_by(id: params[:id])
    contact.first_name = params[:first_name] || contact.first_name
    contact.last_name = params[:last_name] || contact.last_name
    contact.mid_name = params[:mid_name] || contact.mid_name
    contact.number = params[:number] || contact.number
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    contact.delete

    render json: ["Contact with ID ##{contact_id} was deleted."]
  end
end
