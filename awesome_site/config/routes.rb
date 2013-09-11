Blog::Application.routes.draw do
  get "test/show"
  mount Blog::Engine => '/blog'
end
