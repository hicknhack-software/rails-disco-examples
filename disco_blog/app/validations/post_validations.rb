module PostValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'CreatePostCommand'
  validation_target :'UpdatePostCommand'

  included do
    validates :title, {
        presence: true,
        length: 3..100,
    }
    validates :text, {
        presence: true
    }
  end
end