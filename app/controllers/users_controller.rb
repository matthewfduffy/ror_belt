class UsersController < ApplicationController
  def show
    @user = current_user
    @product = Product.where("seller_id =?" , @user.id)
    @unsold = @product.where(["status = ?", "available"])
    @sold = @product.where(["status = ?", "sold"])
    @buyer = Product.where("buyer_id =?", @user.id)
    
  end
end
