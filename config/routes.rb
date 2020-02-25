Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/blog', to: redirect('https://test-redirection-fev.herokuapp.com/blog/'), as: 'blog'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '(*path)', to: 'application#blog', constraints: { subdomain: 'blog' }
end
