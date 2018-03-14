Rails.application.routes.draw do
  namespace :v1 do
    get "/contacts" => "contacts#index"
    get "/contacts/:id" => "contacts#show"
    post "/contacts" => "contacts#create"
    patch "/contacts" => "contacts#update"
    delete "/contacts/:id" => "contacts#destroy"
  end
end

