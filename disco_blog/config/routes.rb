DiscoBlog::Application.routes.draw do
  resources :posts

  get 'event_stream' => 'event_source#stream'
end
