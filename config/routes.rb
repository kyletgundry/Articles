Rails.application.routes.draw do
  get "/articles" => "articles#index"
  post "/articles" => "articles#create"
  get "/articles/:id" => "articles#show"
  patch "/articles/:id" =>  "articles#update"
  delete "/articles/:id" => "articles#destroy"
end
