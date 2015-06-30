require 'securerandom'

class ReceiptMailer < ApplicationMailer

  def purchase(sale)
    @sale = sale
    @product = sale.product

    mail to: @sale.email
  end
end
