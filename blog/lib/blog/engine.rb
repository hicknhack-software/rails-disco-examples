module Blog
  class Engine < ::Rails::Engine
    isolate_namespace Blog
  end
end
