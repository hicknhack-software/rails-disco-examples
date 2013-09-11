module Blog
  module PostValidations
    extend ActiveSupport::Concern
    include ActiveEvent::Validations

    validation_target :'Blog::PostCreate'
    validation_target :'Blog::PostUpdate'

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
end
