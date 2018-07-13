Rails.application.routes.draw do
  
  devise_for :users
  resources :patients

  root 'patients#index'

  resources :conversations do
    resources :messages, module: :conversations, only: [:index, :create, :destroy]
    resources :recurring_messages, controller: 'conversations/recurring_messages'
  end

  # Twilio Webhook for Inbound Message
  post 'conversations/messages/reply', to: 'conversations/messages#reply'


end
