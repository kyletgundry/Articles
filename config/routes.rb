Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/articles" => "articles#index"
      post "/articles" => "articles#create"
      get "/articles/:id" => "articles#show"
      patch "/articles/:id" =>  "articles#update"
      delete "/articles/:id" => "articles#destroy"
    end
  end

  namespace :v2 do
    get "/articles" => "articles#index"
    post "/articles" => "articles#create"
    get "/articles/:id" => "articles#show"
    patch "/articles/:id" =>  "articles#update"
    delete "/articles/:id" => "articles#destroy"
  end

  get "/" => "articles#index"
  
end
