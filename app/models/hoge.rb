class Hoge < ActiveRecord::Base

  validates :email, presence: true
  scope :alll, -> (x) { where('coffee > ?', x) }
end
