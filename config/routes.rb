Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/blog', to: redirect('https://test-redirection-fev.herokuapp.com/blog/', status: 301)
  # get '/blog', to: redirect('https://test-redirection-fev.herokuapp.com/blog')
  # get '/blog', to: redirect('http://blog.mihivai-blog.com/'), as: 'blog'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
