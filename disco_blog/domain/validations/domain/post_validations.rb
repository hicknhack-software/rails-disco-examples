module Domain
  module PostValidations
    extend ActiveSupport::Concern
    include ActiveEvent::Validations

    validation_target :'PostCreateCommand'
    validation_target :'PostUpdateCommand'

    included do
      validates :title, {
          unique_title: true
      }
    end

    class UniqueTitleValidator < ActiveModel::EachValidator

      def validate_each(record, attr_name, value)
        record.errors.add(attr_name, :taken) if Post.any_with_title(record.id, value)
      end
    end
  end
end
