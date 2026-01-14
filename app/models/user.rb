class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :founded_round_tables, class_name: "RoundTable",
           foreign_key: "founder_id", dependent: :destroy


  has_many :round_table_memberships, foreign_key: "member_id", dependent: :destroy
  has_many :joined_round_tables, through: :round_table_memberships
end
