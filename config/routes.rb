Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
<<<<<<< HEAD
      get '/throne_rooms/closest_five', to: 'throne_rooms#closest_five'
      get '/throne_rooms/last_five', to: 'throne_rooms#last_five'
=======
      get 'throne_rooms/closest_five', to: 'throne_rooms#closest_five'
      get 'throne_rooms/top_five_by_review', to: 'throne_rooms#top_five_by_review'
>>>>>>> d40c4f099d93dbd5fad890d52282c2988329b7ed
      get '/throne_rooms/:id/reviews/recent', to: 'reviews#recent'
      resources :throne_rooms do
        resources :reviews
      end
    end
  end
end
