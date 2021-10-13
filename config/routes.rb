Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/first_product", controller: "products", action:"first_product"

  get "/coffeetable", controller:"products", action:"second_product"



end
