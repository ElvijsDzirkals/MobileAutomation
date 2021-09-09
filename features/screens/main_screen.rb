class MainScreen

  def initialize
    @mobile_hamburger_menu = Elements.new(:css, '#trigger')
    @featured_items = Elements.new(:css, '.row.swiper-wrapper > .swiper-slide')
    @cart_button = Elements.new(:css, '#aBagLink')
    @sign_in_button = Elements.new(:css, ".mob-login")
    @cookies_close_button = Elements.new(:css, "#cookieContentContainer > [type=button]")
    @logo_button = Elements.new(:css, "#mobSearchContainer ~ [class*=LogoWrap]")
    @cart_item_count = Elements.new(:css , "#bagQuantity")
  end

  def open_hamburger_menu
    @mobile_hamburger_menu.click
  end

  def click_sign_in
    @sign_in_button.click
  end

  def close_cookies_window
    @cookies_close_button.click
  end

  def open_first_featured_item
    @featured_items.get_multiple_elements[0].click
  end

  def open_cart
    @cart_button.click
  end

  def go_to_home_screen
    @logo_button.click
  end

  def get_item_count
    @cart_item_count.get_text.to_i
  end

  def validate_item_count(count)
    actual = @cart_item_count.get_text.to_i
    unless @cart_item_count.get_text.to_i == count
      raise "Cart icon displays wrong item count in the bag: \n" +
              "Expected: #{count} \n " +
              "Actual: #{actual}"
    end
  end

end