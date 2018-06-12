# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#

class CatRentalRequest < ApplicationRecord

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.where(cat_id: self.cat_id)
      .where.not(id: self.id)
      .where.not("start_date > :end_date OR end_date < :start_date", start_date: start_date, end_date: end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    !overlapping_approved_requests.exists?
  end

  # def valid?
  #   does_not_overlap_approved_request
  # end

end
