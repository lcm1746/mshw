Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end
    resources :comments
    
  end
  
  root 'posts#index'
  
  get '/aa/', to: 'posts#aa'
  get '/about', to: 'pages#about'
  get '/pages/japan' => 'pages#japan'
  get '/pages/taiwan' => 'pages#taiwan'
  get '/pages/country' => 'pages#country'
  get '/public/404' => 'public#404'
end
