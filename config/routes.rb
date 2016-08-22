Rails.application.routes.draw do

  get '/cars', to: 'car_locations#closest_cars'

end
