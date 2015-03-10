module Domain
  module PostValidations
    extend ActiveSupport::Concern
    include ActiveEvent::Validations

    validation_target :'CreatePostCommand'
    validation_target :'UpdatePostCommand'

    included do
      validate :unique_title
    end

    def unique_title
      post_titles = Domain::PostTitle.where title: title
      errors.add(:title, 'Unique title required!') if post_titles.any?
    end
  end
end
