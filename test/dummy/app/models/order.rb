class Order < ApplicationRecord
  include AegisSupport::SecureNumber

  has_secure_number :order_no
end
