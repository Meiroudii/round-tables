class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :founded_round_tables, class_name: "RoundTable",
           foreign_key: "founder_id", dependent: :destroy
end
