Spree::LineItem.class_eval do
	def price(price)
		self.price = price
  end
end
