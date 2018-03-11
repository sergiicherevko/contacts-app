Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    get "/sergii_contacts1" => "contacts#first_contact"
    get "/sergii_contacts2" => "contacts#second_contact"  
  end
end
