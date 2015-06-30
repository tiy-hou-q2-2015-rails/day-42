class Api::ProductsController < ApplicationController

  before_action do
    # @app = ApiApps.find_by key: request.headers['x-api-key']
    # if @app && @app.valid?
    # else
    #   render status: 401
    # end
    if request.headers['x-api-key'] != "61b9ec53"
      render json: {auth: "failed"}, status: 401
    end
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new params.require(:product).permit(:name, :price, :photo)
    @product.permalink = @product.name.parameterize
    if @product.save
      render :show, status: 201
    else
      render json: @product.errors, status: 422
    end
  end
end
