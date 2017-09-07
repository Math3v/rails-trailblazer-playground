require "reform"
require "reform/form/dry"

module Comment::Contract
  class Create < Reform::Form
    include Dry
    
    property :body
    property :thing

    validation do
      configure do
        config.messages_file = 'config/error_messages.yml'

        def thing_exists?(thing)
          thing && thing.id
        end
      end

      required(:body).filled(min_size?: 10)
      required(:thing).filled(:thing_exists?)
    end
  end
end
