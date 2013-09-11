module Blog
  class Post < ActiveRecord::Base
    self.table_name = 'blog_posts'
  end
end