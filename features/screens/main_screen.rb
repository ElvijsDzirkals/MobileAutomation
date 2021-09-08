class MainScreen

  def initialize
    @mobile_hamburger_menu = Elements.new(:css,'#trigger')
    @featured_items = Elements.new(:css , '.row.swiper-wrapper > .swiper-slide')
    @cart_button = Elements.new(:css, '#aBagLink')
    @sign_in_button = Elements.new(:css, ".mob-login")
    @category_entries = Elements.new(:css , "[id^=mob-]")
    @cookies_close_button = Elements.new(:css, "#cookieContentContainer > [type=button]")
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

end