# encoding: utf-8
module SellsHelper
	def show_price_type price_type
    if price_type == 1
    	'за '
    elsif price_type == 2
    	'всего'
    end
  end
end
