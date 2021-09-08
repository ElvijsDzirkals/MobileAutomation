class Screens

  def main_screen
    @main_screen ||= MainScreen.new
  end

  def product_screen
    @product_screen ||= ProductScreen.new
  end

  def checkout_screen
    @checkout_screen ||= CheckoutScreen.new
  end

end