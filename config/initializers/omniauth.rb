Rails.application.config.middleware.use OmniAuth::Builder do
 if Rails.env.production?
   provider :facebook, '151537311672530', 'ed4a4725a9ff31f3ead5d201ddcb7476'
   provider :linkedin, 'gl1h6zyltlem', "wIfucZImlYGqFO3r"
   provider :google_oauth2, '928801233183-dg701idms6tr6907bk6m2i8boishu4io.apps.googleusercontent.com', 'n61XG48z1DMc6kGiY6zCuiUM'
   
 elsif Rails.env.development?
   provider :facebook, '586163688080266', '093ab151dc5385a434b0e03815ac851f'
   provider :linkedin, '31azcdigi8tt', "OKd1hmuJoNOg9J2g"
   provider :google_oauth2, '928801233183', '-nMQ0dEfcaBITxzwYHZPQ3v-'
 end
 
end