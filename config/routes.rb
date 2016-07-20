Rails.application.routes.draw do
  root 'home#index',  via: [:get, :post]

  get '/readfile' => 'home#readfile'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
