class RoundTable < ApplicationRecord
  belongs_to :founder, class_name: "User"
end
