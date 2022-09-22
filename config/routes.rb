Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      get 'throne_rooms/closest_five', to: 'throne_rooms#closest_five'
      get 'throne_rooms/top_five_by_review', to: 'throne_rooms#top_five_by_review'
      resources :throne_rooms do
        resources :reviews
      end
    end
  end
end
