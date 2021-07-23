Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/yes', as: 'rails_admin'
  get 'home/index'

  resources :medicine_intake_logs
  resources :doctor_notifications
  resources :in_patients
  resources :prescriptions
  resources :medicines
  resources :doctor_appointments
  resources :doctors do
    get 'login', :on => :collection
    post 'signin', :on => :collection
    get 'logout', :on => :collection
  end
  devise_for :users, controllers: {
    registrations: "users/registrations",
    # Add this
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root :to => 'home#index'
end
