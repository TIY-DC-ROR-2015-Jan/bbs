Rails.application.routes.draw do
  # name_of_controller#action_on_controller
  root 'application#home'

  get '/better_things' => 'application#things', as: 'things'
end
