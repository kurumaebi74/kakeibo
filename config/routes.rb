Rails.application.routes.draw do
  get '/' => "home#index"
  get '/past' => "home#past"
  get '/setting' => "home#setting"
  get '/:id/edit' => "home#edit"
  post '/addcategory' => "home#addcategory"
  post '/:id/update' => "home#update"
  post '/:id/category_destroy' => "home#category_destroy"
  get 'post/new' => "post#new"
  get 'post/:id/edit' => "post#edit"
  post '/post/create' => "post#create"
  post 'post/:id/update' => "post#update"
  post '/post/:id/destroy' => "post#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
