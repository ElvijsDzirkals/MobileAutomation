When(/^the user opens one of the featured categories$/) do
  @screens.main_screen.open_first_featured_item
end

And(/^the user adds to their bag the first product from the list$/) do
  @screens.product_screen.choose_first_product
  @product_name = @screens.product_screen.get_product_name
  @product_brand = @screens.product_screen.get_product_brand
  @product_price = @screens.product_screen.get_product_price
  @screens.product_screen.add_to_bag
end

And(/^the user views their bag and proceeds to checkout$/) do
  @screens.main_screen.open_cart
  @screens.checkout_screen.cart_continue_securely
end

And(/^the user continues the checkout as a guest$/) do
  @screens.checkout_screen.checkout_as_guest
end

And(/^the (.*) inputs their delivery details and chooses a delivery option$/) do |user|
  @screens.checkout_screen.insert_delivery_info(user)
  @screens.checkout_screen.choose_delivery_option
end

And(/^the user pays with (.*)$/) do |payment_type|
  case payment_type
  when "credit_card" then
    @screens.checkout_screen.pay_with_card
  when "paypal" then
    @screens.checkout_screen.pay_with_paypal
  when "gift_card" then
    @screens.checkout_screen.pay_with_gift_card
  else
    raise "Cannot find payment method: #{payment_type}"
  end
end

Given(/^(.*) is logged in$/) do |user|
  @screens.main_screen.open_hamburger_menu
  @screens.main_screen.click_sign_in
  @screens.checkout_screen.login(user)
end

And(/^the user bag contains the chosen item and user proceeds to checkout$/) do
  @screens.main_screen.open_cart
  @screens.checkout_screen.validate_product_price(@product_price)
  @screens.checkout_screen.validate_product_description(@product_name, @product_brand)
  @screens.main_screen.validate_item_count(1)
  @screens.checkout_screen.cart_continue_securely
end

And(/^the users bag is empty$/) do
  @screens.main_screen.open_cart
  @screens.checkout_screen.remove_all_items(@screens.main_screen.get_item_count)
  @screens.main_screen.validate_item_count(0)
  @screens.main_screen.go_to_home_screen
end

And(/^delivery information is already filled in with (.*) details$/) do |user|
  @screens.checkout_screen.validate_added_delivery_data(user)
end

And(/^the (.*) confirms their address and chooses a delivery option$/) do |user|
  @screens.checkout_screen.insert_phone_number(user)
  @screens.checkout_screen.choose_delivery_option
end

Given(/^the cookies popup is closed$/) do
  @screens.main_screen.close_cookies_window
end