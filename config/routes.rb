Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/throne_rooms/closest_five', to: 'throne_rooms#closest_five'
      get '/throne_rooms/:id/reviews/recent', to: 'reviews#recent'
      get '/throne_rooms/:id/reviews/review_averages', to: 'throne_rooms#review_averages'
      get '/throne_rooms/:id/reviews/overall_averages', to: 'throne_rooms#overall_averages'
      resources :throne_rooms do
        resources :reviews
      end
    end
  end
end
