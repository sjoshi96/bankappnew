Rails.application.routes.draw do
	resources :banks
	resources :branches
	resources :accounts
	resources :cards
	resources :loans
	resources :users
	resources :transactions
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
