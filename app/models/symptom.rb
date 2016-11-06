class Symptom < ActiveRecord::Base
  belongs_to :user

  validates :symptom_name, presence: true
end
