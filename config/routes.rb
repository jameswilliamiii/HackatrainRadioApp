HackatrainRadioApp::Application.routes.draw do
  
  match "songs/upload", :as => :upload  
  match "songs/delete", :as => :delete  

  root :to => "songs#index"

end
