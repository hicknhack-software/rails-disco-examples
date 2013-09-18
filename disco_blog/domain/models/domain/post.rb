module Domain
  class Post < ActiveRecord::Base
    self.table_name = 'posts'

    def self.any_with_title(id, title)
      Post.where(title: title).where.not(id: id).any?
    end
  end
end