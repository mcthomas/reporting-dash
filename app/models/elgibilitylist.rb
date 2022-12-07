class Elgibilitylist < ApplicationRecord
    has_many :entries, :dependent => :destroy
    accepts_nested_attributes_for :entries, reject_if: :all_blank
end
