
module AegisSupport
  module SecureNumber
    extend ActiveSupport::Concern

    module ClassMethods
      def has_secure_number(attribute)
        require "securerandom"

        define_method("regenerate_#{attribute}"){ update! attribute => self.class.generate_secure_number(attribute) }
        before_create{ self.send("#{attribute}=", self.class.generate_secure_number(attribute)) }
      end

      def generate_secure_number(attribute)
        10.times do |i|
          # use "4.gigabytes ** 2" just want to generate a random number that maximum length is 20
          secure_number = SecureRandom.random_number(4.gigabytes ** 2).to_s.rjust(20, "0")

          if exists?(attribute => secure_number)
            raise "Couldn't generate a unique number in 10 attempts!" if i == 9
          else
            break secure_number
          end
        end
      end
    end
  end
end
