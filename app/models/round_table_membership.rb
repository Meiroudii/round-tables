class RoundTableMembership < ApplicationRecord
  belongs_to :member, class_name: "User"
  belongs_to :membership_round_table, class_name: "RoundTable"
end
