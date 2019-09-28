Rails.application.routes.draw do
  root 'welcome#home'

  get '/auth/facebook/callback', to: 'sessions#fbauth'
  # get '/auth/google/callback', to: 'sessions#googleauth'
  # get '/auth/failure', to: redirect(‘/’)

  post '/logout' => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
