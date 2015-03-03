Rails.application.routes.draw do
  devise_for :users

  # name_of_controller#action_on_controller
  root 'application#home'

  get '/better_things' => 'application#things', as: 'things'

  resources :boards do
    # resources :posts, shallow:
  end

  # get  '/new_board' => 'boards#new', as: 'new_board'
  # post '/boards' => 'boards#create', as: 'boards'
  # get  '/boards' => 'boards#index'
  # get  '/boards/:id' => 'boards#show', as: 'board'
  # get  '/boards/:id/edit' => 'boards#edit', as: 'edit_board'
  # patch '/boards/:id' => 'boards#update'

  get '/boards/:board_id/new_post' => 'posts#new', as: 'new_post'
  post '/boards/:board_id/posts' => 'posts#create', as: 'posts'
  # get '/posts/:id' ?
  get '/boards/:board_id/posts/:id' => 'posts#show', as: 'post'
end
