Myapp::Application.routes.draw do

  resources :course_pricings

  
  resources :tax_rates


  match '/rate' => 'rater#create', :as => 'rate'

  resources :coupons do
    collection do
      get 'test'
      get 'apply'
      get 'redeem'
    end
  end
  resources :contacts

  resources :faqs
  resources :blogs
  resources :tags
  resources :courses 

  match 'payments/course_payment_gateway',:to=>'payments#course_payment_gateway'
  match 'payments/course_payment',:to=>'payments#course_payment'
  match 'payments/confirm_course_payment',:to=>'payments#confirm_course_payment'
  match "/download_pdf(.:format)" => "invoices#invoice_pdf", :method => :get, :as=>:invoice_pdf
  match '/show_image', :to => 'payments#show_image'
  resources :topics
  resources :tutorials
  resources :groups
  resources :under_constructions
  resources :o_classes
  resources :course_previews
  authenticated :user do
    root :to => 'screens#home'
  end
  root :to => 'screens#home'
  match '/about', :to => 'screens#about'
  match '/privacy', :to => 'screens#privacy'
  match '/terms', :to => 'screens#terms'

  #match '/contact', :to => 'screens#contact'
  #match '/faq', :to => 'screens#faq'
  match '/construction', :to => 'screens#construction'  
  match '/manage_courses', :to => 'courses#manage_courses'
  match '/upcomming_courses', :to => 'courses#upcomming_courses' 
  match '/popular_courses', :to => 'courses#popular_courses'  
  match '/datewise_courses', :to => 'courses#datewise_courses'
  match '/subscribed_courses', :to => 'courses#subscribed_courses'
  match '/show_image', :to => 'courses#show_image' 
  match '/show_image', :to => 'topics#show_image' 
  match '/show_image', :to => 'screens#show_image' 


  devise_for :users, :controllers => {:registrations => "registrations",:sessions => "sessions"}

  devise_scope :user do
    match '/user_image', :to => 'registrations#user_image' 
  end
  
  resources :users
  match '/auth/:provider/callback' => 'authentication#create'
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'

  match '/my_courses', :to => 'courses#my_courses'  

end

