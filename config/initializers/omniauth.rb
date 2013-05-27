Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, "#{Settings.omniauth.facebook_key}", "#{Settings.omniauth.facebook_secret}"
  provider :linkedin, "#{Settings.omniauth.linkedin_key}", "#{Settings.omniauth.linkedin_secret}"
  provider :google_oauth2, "#{Settings.omniauth.google_oauth2_key}", "#{Settings.omniauth.google_oauth2_secret}"

  if Rails.env.production?
    provider :facebook, '153576101469926', '302358063a941b9e0d9c8ec9cb77b6ad'
    provider :linkedin, 'z1zu2sg48rvp', "8kpRB8V5EBsiXcbx"
    provider :google_oauth2, '928801233183-phpisd2fada5c2d5n5heosha9h8jisla.apps.googleusercontent.com', 'D6mLnz02jOX6kpT-cbo9p2MM'
  elsif Rails.env.development?
    provider :facebook, '586163688080266', '093ab151dc5385a434b0e03815ac851f'
    provider :linkedin, '31azcdigi8tt', "OKd1hmuJoNOg9J2g"
    provider :google_oauth2, '928801233183', '-nMQ0dEfcaBITxzwYHZPQ3v-'
  elsif Rails.env.staging?
    provider :facebook, '512117358852772', 'f4525c34c46f03fa82698ba7497b8137'
    provider :linkedin, '0hwyrty0bou0', "yUWZjK8mGidVFy5M"
    provider :google_oauth2, '1024217888502-17r77af1993bpn2g8vuqgi1i7pvq9j1s.apps.googleusercontent.com', 'f-6_TcWjSwIsjQmHsjTNdddO'
  end
end
