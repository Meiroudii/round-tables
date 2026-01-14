class RoundTable < ApplicationRecord
  belongs_to :founder, class_name: "User"

  has_many :round_table_memberships, foreign_key: "joined_round_table_id", dependent: :destroy
  has_many :members, through: :round_table_membership, source: :member
end
