Rails.application.routes.draw do
  root :to => 'static_pages#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  devise_scope :user do
    post "/users/add_nickname" => "registrations#add_nickname"
  end  
  resources :topics do
    collection do
      get :get_newest
      get :get_hot
    end
  end
  resources :articles do
    collection do
      get :by_topic_id
    end
  end

  resources :article_comments do
    collection do
      get :by_article_id
    end
  end

  resources :article_likes
  
  # Manual routes for counts controller 
  post "/add_topic_browse_times" => "counts#add_topic_browse_times"
  post "/add_topic_article_amounts" => "counts#add_topic_article_amounts"
  post "/add_article_likes" => "counts#add_article_likes"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
