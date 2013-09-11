module BlogDomain
  class Post < ActiveRecord::Base
    self.table_name = 'blog_posts'

    def self.any_with_title(id, title)
      Post.where(title: title).where.not(id: id).any?
    end

    def self.unique_id
      (Post.maximum(:id) || 0) + 1
    end
  end
end