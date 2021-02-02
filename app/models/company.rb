class Company < ApplicationRecord
  validates :subdomain, presence: true
end
