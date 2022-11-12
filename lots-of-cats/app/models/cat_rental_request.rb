# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :bigint           not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "action_view"

class CatRentalRequest < ApplicationRecord
    ActionView::Helpers::DateHelper

    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED']}
    validate :does_not_overlap_approved_request

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat

    def overlapping_requests
        CatRentalRequest
            .where.not(id: self.id)
            .where(cat_id: cat_id)
            .where.not('start_date = end_date OR start_date > end_date OR end_date < start_date')
    end

    def overlapping_approved_requests
        overlapping_requests.where("status = 'APPROVED'")
    end

    def does_not_overlap_approved_request
        overlapping_approved_requests.exists?
    end
end
