Myapp::Application.routes.draw do
  match '/rate' => 'rater#create', :as => 'rate'

 	resources :faqs
  resources :blogs
  resources :tags
  resources :courses do
       
         member do
           get 'course_payment'
          end
      end
  match 'courses/confirm_course_payment',:to=>'courses#confirm_course_payment'
  match "/download_pdf(.:format)" => "courses#index_pdf", :method => :get, :as=>:index_pdf
  resources :topics
  resources :tutorials
  resources :groups
  resources :under_constructions
  resources :o_classes
 
	authenticated :user do
		root :to => 'screens#home'
	end
	root :to => 'screens#home'
	match '/about', :to => 'screens#about'
	match '/privacy', :to => 'screens#privacy'
	match '/terms', :to => 'screens#terms'

  match '/contact', :to => 'screens#contact'
  #match '/faq', :to => 'screens#faq'
  match '/construction', :to => 'screens#construction'  
  match '/manage_courses', :to => 'courses#manage_courses'  
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users
  match '/auth/:provider/callback' => 'authentication#create'
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'
end