Rails.application.routes.draw do
  get 'config/index'

  root 'home#index',  via: [:get, :post]

  get '/readfile' => 'home#read_log_file'
  get '/updatelacnicfile' => 'home#update_lacnic_file'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
