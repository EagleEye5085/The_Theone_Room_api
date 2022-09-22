Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'throne_rooms/closest_five', to: 'throne_rooms#closest_five'
      get 'throne_rooms/top_five_by_review', to: 'throne_rooms#top_five_by_review'
      get '/throne_rooms/:id/reviews/recent', to: 'reviews#recent'
      resources :throne_rooms do
        resources :reviews
      end
    end
  end
end
