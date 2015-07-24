Rails.application.routes.draw do

root 'welcome#index'

  resources :courses do
    resources :course_units
    resources :teachings, only: [:create, :destroy]
    resources :studyings, only: [:create, :destroy]
    resources :invitations, only: [:create, :destroy]
  end

  resources :users, except: [:edit, :update] do
    get :edit, on: :collection
    patch :update, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :course_resources do
    resources :submissions
  end

 resources :contact

 resources :kinds

 resources :course_units do
   resources :course_resources
 end

 resources :password_requests, only: [:new, :create]

 get "password/reset" => "password_requests#reset"

 resources :scores, only: [:create, :update]

end
