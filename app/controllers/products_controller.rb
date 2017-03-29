class ProductsController < ApplicationController
  def index
    @products = Product.where(["status = ?", "available"])
  end

  def show
  end

  def create
    @user = current_user
    @product = Product.new(product_params)
    if @product.valid?
      @product.seller = current_user.first_name + current_user.last_name
      @product.seller_id = @user.id
      @product.status = "available"
      @product.save
      flash[:notice] = "Saved Successfully!"
    else
      flash[:errors] = @product.errors.full_messages
    end
    redirect_to users_path
  end

  def update
    @user = current_user
    @product = Product.find(params[:product_id])
    @product.status = "sold"
    @product.buyer = current_user.first_name + current_user.last_name
    @product.buyer_id = @user.id
    @product.save
    redirect_to :users
  end

  def del
    @product = Product.find(params[:id])
    @product.status = " none "
    @product.save

    redirect to users_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :amount)
    end
end
