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
end
