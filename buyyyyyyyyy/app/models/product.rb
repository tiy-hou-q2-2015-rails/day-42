class Product < ActiveRecord::Base

  include Payola::Sellable

  validates :price, :photo, :name, :permalink, presence: true
  validates :permalink, uniqueness: true
  validates :price, numericality: { only_integer: true, greater_than: 100 }

  def redirect_path(sale)
    "/thanks"
  end
end
