# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  name        :string           not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "action_view"
class Cat < ApplicationRecord
    ActionView::Helpers::DateHelper
    CAT_COLORS = ["brown", "orange", "silver", "black"]
    validates :name, :color, :sex, :birth_date, presence: true
    validates :color, inclusion: { in: CAT_COLORS}
    validates :sex, inclusion: {in: ["F", "M"], message: "Not a valid sex, please enter in a uppercase, 1 letter sex"}
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date.present? && birth_date.to_date > Date.today
            errors.add("birthday cannot be in the future")
        end
    end

    def age 
        Date.today.year - birth_date.to_date.year
    end

    has_many :rental_requests,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,
        dependent: :destroy
end
