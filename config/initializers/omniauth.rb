Rails.application.config.middleware.use OmniAuth::Builder do
 if Rails.env.production?
   provider :facebook, '153576101469926', '302358063a941b9e0d9c8ec9cb77b6ad'
   provider :linkedin, 'z1zu2sg48rvp', "8kpRB8V5EBsiXcbx"
   provider :google_oauth2, '928801233183-phpisd2fada5c2d5n5heosha9h8jisla.apps.googleusercontent.com', 'D6mLnz02jOX6kpT-cbo9p2MM'
   
 elsif Rails.env.development?
   provider :facebook, '586163688080266', '093ab151dc5385a434b0e03815ac851f'
   provider :linkedin, '31azcdigi8tt', "OKd1hmuJoNOg9J2g"
   provider :google_oauth2, '928801233183', '-nMQ0dEfcaBITxzwYHZPQ3v-'
 end
 
end