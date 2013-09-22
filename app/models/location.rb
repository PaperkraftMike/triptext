class Location < ActiveRecord::Base
  validates :zip_code, presence: true, format: { with: /\A\d{5}(-\d{4})?\z/, message: "Only valid US Zip Codes allowed" }
  validates :street, presence: true, length: { in: 1..200, too_long: "Address must be less than 200 letters.", too_short: "Address must be at least 1 letter." }
end