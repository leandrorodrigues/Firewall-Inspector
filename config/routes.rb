Rails.application.routes.draw do

  namespace "config" do
    resources :negative_tests do
      member do
        get 'toggle'
      end
    end
    resources :positive_tests do
      member do
        get 'toggle'
      end
    end
    root "config#index"
  end

  root 'home#index',  via: [:get, :post]

  get '/readfile' => 'home#read_log_file'
  get '/updatelacnicfile' => 'home#update_lacnic_file'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
