HackatrainRadioApp::Application.routes.draw do
  
  root :to => 'songs#index'
  
  get    "songs" => 'songs#index'
  post   "songs" => 'songs#upload'
  delete "songs" => 'songs#delete'

end
