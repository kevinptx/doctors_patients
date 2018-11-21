class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments

  def full_name
    "#{first_name} #{last_name}"
  end
end
