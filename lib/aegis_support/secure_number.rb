module AegisSupport
  module SecureNumber
    extend ActiveSupport::Concern

    module ClassMethods
      DEFAULT_MAXIMUM_NUMBER_LENGTH = 20

      def has_secure_number(attribute, **options)
        require "securerandom"

        define_method("regenerate_#{attribute}") { update! attribute => self.class.generate_secure_number(attribute, **options) }
        before_create { self.send("#{attribute}=", self.class.generate_secure_number(attribute, **options)) }
      end

      def generate_secure_number(attribute, **options)
        options.symbolize_keys!

        10.times do |i|
          secure_number = options[:prefix].to_s + random_string(options[:length]) + options[:suffix].to_s

          if exists?(attribute => secure_number)
            raise "Couldn't generate a unique number in 10 attempts!" if i == 9
          else
            break secure_number
          end
        end
      end

      private

      def random_string(length)
        length = length.present? ? Integer(length) : DEFAULT_MAXIMUM_NUMBER_LENGTH
        maximum_number = ("9" * length).to_i

        SecureRandom.random_number(maximum_number)
                    .to_s
                    .rjust(length, "0")
      end
    end
  end
end
