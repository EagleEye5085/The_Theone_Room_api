Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      get 'throne_rooms/closest_five', to: 'throne_rooms#closest_five'
      get 'reviews/recent', to: 'reviews#recent'
      get 'throne_rooms/reviews/review_averages', to: 'throne_rooms#review_averages'
      resources :reviews
      resources :throne_rooms
    end
  end
end
