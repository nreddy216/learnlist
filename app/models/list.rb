class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  #sets the order to the most recent at the top
  default_scope -> {order(created_at: :desc)}

  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 80}
end
