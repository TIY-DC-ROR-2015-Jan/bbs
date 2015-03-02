Rails.application.routes.draw do
  # name_of_controller#action_on_controller
  root 'application#home'

  get '/better_things' => 'application#things', as: 'things'

  get '/new_board' => 'boards#new', as: 'new_board'
  post '/boards' => 'boards#create', as: 'boards'
  get '/boards/:id' => 'boards#show', as: 'board'
end
