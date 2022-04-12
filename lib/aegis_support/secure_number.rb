
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
          # generate random number of 20 characters long
          maximum_number = 99999_99999_99999_99999
          secure_number = SecureRandom.random_number(maximum_number).to_s.rjust(20, "0")

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
