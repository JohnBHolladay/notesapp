Rails.application.routes.draw do
  
  resources :notepads do
    resources :notes
  end
  match 'notepads/:url' => 'notepads#show', :via => [:get], :as => :notepad_with_url
  match 'notepads/:notepad_id/notes/:id' => 'notepads#show', :via => [:post], :as => :notepad_with_url_update_note
  
  root 'notepads#new'
end
