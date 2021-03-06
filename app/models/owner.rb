class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Owner < ActiveRecord::Base
  # TODO: add validations
  validates :first_name, presence: true, uniqueness: false, length: {maximum: 255}
  validates :last_name, presence: true, uniqueness: false, length: {maximum: 255}
  validates :email, presence: true, uniqueness: true, length: {maximum: 255}, email: true
  
  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
  end

end
