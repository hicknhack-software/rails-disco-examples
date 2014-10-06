Rails.application.routes.draw do
  resources :messages

  get 'event_source/:projection/:event' => 'event_source#projected', as: 'event_source'
end
