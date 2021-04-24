# frozen_string_literal: true

Rails.application.routes.draw do
  resources :restaurants, only: %i[index show new create] do
    # get "/restaurants/1/reviews/new", to: "reviews#new"
    resources :reviews, only: %i[new create]
  end
end
