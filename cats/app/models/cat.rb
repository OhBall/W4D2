# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birth_date, presence: true
  validates :color, presence: true
  validates :name, presence: true
  validates :sex, presence: true
  validates :description, presence: true

  has_many :cat_rental_requests,
    dependent: :destroy

  def age
    (Date.today - self.birth_date)/365
  end
end
