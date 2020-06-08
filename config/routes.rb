Rails.application.routes.draw do

  devise_for :users
  root 'home#top'
  get 'home/about'

  resources :books do
  	resources :book_comments, only: [:create,:destroy]
  	resource :favorites, only: [:create, :destroy]
  end

   # ================ここをネスト(入れ子)した形に変更
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  #=====================================

end

