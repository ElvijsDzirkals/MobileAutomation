When(/^the user opens one of the featured categories$/) do
  @screens.main_screen.close_cookies_window
  @screens.main_screen.open_first_featured_item
end

And(/^the user adds to their bag the first product from the list$/) do
  @screens.product_screen.choose_first_product
  @screens.product_screen.add_to_bag
end

And(/^the user views their bag and proceeds to checkout$/) do
  @screens.main_screen.open_cart
  @screens.checkout_screen.cart_continue_securely
end

And(/^the user continues the checkout as a guest$/) do
  @screens.checkout_screen.checkout_as_guest
end

And(/^the user inputs their delivery details and chooses a delivery option$/) do
  @screens.checkout_screen.insert_delivery_info
  @screens.checkout_screen.choose_delivery_option
end

And(/^the user pays with (.*)$/) do |payment_type|
  case payment_type
  when "credit_card" then @screens.checkout_screen.pay_with_card
  when "paypal" then @screens.checkout_screen.pay_with_paypal
  when "gift_card" then @screens.checkout_screen.pay_with_gift_card
  end
end

Given(/^the user is logged in$/) do
  pending
end