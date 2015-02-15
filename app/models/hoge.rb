class Hoge < ActiveRecord::Base

  validates :email, presence: true

  def alll
    return self.where('coffee > 1', 1)
  end
end
