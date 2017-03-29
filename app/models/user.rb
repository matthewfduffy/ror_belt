class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def sales
    self.product.where.not(:buyer_id => nil)
  end

  def available
    self.product.where(:buyer_id => nil)
  end
end
