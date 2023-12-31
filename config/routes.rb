Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    
  }
  root 'public/homes#top'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  
  ########## M:public
  scope module: :public do
    get 'about' => 'homes#about', as: 'about'
    get 'about_japanese' => 'homes#about_japanese', as: 'about_japanese'
    get 'users/:id/my_page' => 'users#show', as: 'user'
    get 'users/information_edit/:id' => 'users#edit', as: 'users_information_edit'
    patch 'users/information/:id' => 'users#update', as: 'users_information'
    get 'users/check' => 'users#check', as: 'users_check'
    # M:Index of bookmarked problems by other users
    get 'users/:id/bookmarked' => 'users#bookmarked', as: 'bookmarked_problems'
    # M:Index of the problems the user bookmarked
    get 'users/:id/bookmark' => 'users#bookmark', as: 'bookmark_problems'
    
    # M:only for visibly easy, bookmark index is nested under "users"
    get "search" => "posts#search"
    get 'users/:user_id/events' => 'users#events', as: 'user_events'
    delete 'users/:id' => 'users#destroy', as: 'users_destroy'
    
    resources :users, only: [ ] do
      get :events
      # resources :events, only: [:index], controller: :user_events
    end
    resources :contacts, only: [:new, :create]
    resources :problems do
      resources :problem_comments, only: [:create, :update, :destroy]
      # get :bookmarks, on: :collection
      # M:to see users who bookmarked the problem?
      resource :bookmarks, only: %i[create destroy]
      # M:bookmarks will not have individual routing (id) by using "collection"
      # resources :bookmarks, only: [:create]
      # M:delete "bookmarks" => "bookmarks#destroy"←commented out because it has problems id, only bookmarks id is needed for destroy
    end
    # delete 'problems/bookmarks/:id' => "bookmarks#destroy"
    # M:visibly easy if "bookmarks destroy" is nested under problems + only bookmarks id is needed
    resources :problem_tags, only: [:index, :create, :edit, :update, :destroy]
    resources :events do
      get :join
      delete :destroy_user
    end
    resources :notices, only:[:show]
  end
  
  ########## M:admin
  namespace :admin do
    get '/' => 'users#index', as: 'root'
    
    resources :users, only: [:show, :edit, :update]
    resources :problems, only: [:index, :show, :destroy] do
      resources :problem_comments, only: [:destroy]
    end
    resources :events, only: [:index, :show, :destroy]
    resources :problem_tags, only:[:index, :destroy]
    resources :notices, only:[:new, :create, :index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
