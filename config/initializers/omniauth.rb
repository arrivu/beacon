Rails.application.config.middleware.use OmniAuth::Builder do

  # provider :facebook, "#{Settings.omniauth.facebook_key}", "#{Settings.omniauth.facebook_secret}"
  # provider :linkedin, "#{Settings.omniauth.linkedin_key}", "#{Settings.omniauth.linkedin_secret}"
  # provider :google_oauth2, "#{Settings.omniauth.google_oauth2_key}", "#{Settings.omniauth.google_oauth2_secret}"

  if Rails.env.production?
    provider :facebook, '631186620244012', '48339c2352a9579bcc7dc5ee215b1a7f'
    provider :linkedin, 'z1zu2sg48rvp', "8kpRB8V5EBsiXcbx"
    provider :google_oauth2, '928801233183-phpisd2fada5c2d5n5heosha9h8jisla.apps.googleusercontent.com', 'D6mLnz02jOX6kpT-cbo9p2MM'
    #provider :google_oauth2, '928801233183', '-nMQ0dEfcaBITxzwYHZPQ3v-'
  elsif Rails.env.development?
    provider :facebook, '553752584663567', '06f0e8213795d3896e809b8d8eda9332'
    provider :linkedin, '31azcdigi8tt', "OKd1hmuJoNOg9J2g"
    provider :google_oauth2, '928801233183', '-nMQ0dEfcaBITxzwYHZPQ3v-'
  elsif Rails.env.staging?
    provider :facebook, '512117358852772', 'f4525c34c46f03fa82698ba7497b8137'
    provider :linkedin, '0hwyrty0bou0', "yUWZjK8mGidVFy5M"
    provider :google_oauth2, '1024217888502-17r77af1993bpn2g8vuqgi1i7pvq9j1s.apps.googleusercontent.com', 'f-6_TcWjSwIsjQmHsjTNdddO'
  end

end