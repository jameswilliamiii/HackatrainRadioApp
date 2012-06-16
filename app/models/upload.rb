class Upload < ActiveRecord::Base
  attr_accessible :dislike, :like, :name, :user_id
  
  belongs_to :user
  
  def increase_like
    self.like = self.like + 1
  end
  
  def decrease_like
    self.like = self.like - 1
    x = self.like
    if x <= 3
      self.destroy
    end
  end
  
end
