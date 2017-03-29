class Product < ApplicationRecord

  def sales
    self.product.where.not(:buyer_id => nil)
  end

  def available
    self.product.where(:buyer_id => nil)
end
end
