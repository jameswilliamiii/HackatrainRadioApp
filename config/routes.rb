HackatrainRadioApp::Application.routes.draw do
  
  get    "sessions/new",     :as => :new_session
  post   "sessions/create",  :as => :create_session
  delete "sessions/destroy", :as => :end_session

  match "songs/upload", :as => :upload  
  match "songs/delete", :as => :delete
  
  get "songs", :controller => "songs", :action => 'hell_yeah', :as => :hell_yeah
  get "songs", :controller => "songs", :action => 'totally_bunk', :as => :totally_bunk

  root :to => "songs#index"
  
  resources :users

end
