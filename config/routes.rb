Phony::Application.routes.draw do
  root "messages#index"

  resources "messages", only: [:index, :new, :create]

  post "/twilio/new_message" => "twilio#new_message"
end
