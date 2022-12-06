class Elgibilitylist < ApplicationRecord
    has_many :entrys
    accepts_nested_attributes_for :entrys
end
