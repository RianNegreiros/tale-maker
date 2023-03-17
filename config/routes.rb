Rails.application.routes.draw do
  root "home#index"
  get "result" => "home#result"
end
