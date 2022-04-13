class Order < ApplicationRecord
  include AegisSupport::SecureNumber

  has_secure_number :order_no
  has_secure_number :order_no_with_prefix, prefix: "PN_"
  has_secure_number :order_no_with_suffix, suffix: "_SN"
  has_secure_number :order_no_with_specific_length, length: 16
end
