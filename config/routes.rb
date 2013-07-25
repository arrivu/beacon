Myapp::Application.routes.draw do



  

  get "privacypolicies/new"

  get "privacypolicies/show"

  get "privacypolicies/edit"

  get "privacypolicy/new"

  get "privacypolicy/show"

  get "privacypolicy/edit"

  get "partners/new"




match '/' => 'blogs#show', :constraints => {:subdomains => /.+/}
resources :footerlinks
  resources :accounts


  get "partners/show"



 
  match 'teaching_staffs/new',:to=>'teaching_staffs#new'  
  resources :course_pricings
  resources :teaching_staffs
  resources :tax_rates
  match '/rate' => 'rater#create', :as => 'rate'

  resources :coupons do
    collection do
      get 'test'
      get 'apply'
      get 'redeem'
    end
  end
  resources :sliders
  resources :account_settings
  resources :contacts
  resources :faqs
  resources :blogs
  resources :tags
  resources :courses 
  resources :testimonials
  resources :partners
  match 'payments/course_payment_gateway',:to=>'payments#course_payment_gateway'
  match 'payments/course_payment',:to=>'payments#course_payment'
  match 'payments/follow_course',:to=>'payments#follow_course'
  match 'payments/confirm_course_payment',:to=>'payments#confirm_course_payment'
  match "/download_pdf(.:format)" => "payments#invoice_pdf", :method => :get, :as=>:invoice_pdf
 
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
  match '/knowledge_partners', :to => 'screens#knowledge_partners'
  match '/user_reviews', :to => 'screens#user_reviews'

  #match '/contact', :to => 'screens#contact'
  #match '/faq', :to => 'screens#faq'
  match '/construction', :to => 'screens#construction'  
  match '/manage_courses', :to => 'courses#manage_courses'
  match '/upcomming_courses', :to => 'courses#upcomming_courses' 
  match '/popular_courses', :to => 'courses#popular_courses'  
  match '/datewise_courses', :to => 'courses#datewise_courses'
  match '/subscribed_courses', :to => 'courses#subscribed_courses'
  match '/course_status_search', :to => 'courses#course_status_search'
  match '/completed_courses', :to => 'courses#completed_courses'

  match '/updatecompleted_details', :to => 'courses#updatecompleted_details'
  match '/conclude_course', :to =>'courses#conclude_course'
  match '/concluded_course_update', :to=> 'courses#concluded_course_update'
  match '/concluded_courses', :to=> 'courses#concluded_courses'
  match '/edit_concluded_course', :to=> 'courses#edit_concluded_course'
  match '/update_un_concluded_course', :to=> 'courses#update_un_concluded_course'
  match '/interested_users', :to=> 'users#interested_users'

  devise_for :users, :controllers => {:registrations => "registrations",:sessions => "sessions"}

  devise_scope :user do
    match '/user_image', :to => 'registrations#user_image' 
  end
  
  resources :users
  match '/auth/:provider/callback' => 'authentication#create'
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'
  match '/my_courses', :to => 'courses#my_courses'  
  match '/show_image/:id', :to => 'courses#show_image' 
  match '/background_image/:id', :to => 'courses#background_image' 
  
#  match '*a', :to => 'home#routing_error'

  devise_scope :user do
    match '/sign_out', :to => 'sessions#destroy'
  end
end
