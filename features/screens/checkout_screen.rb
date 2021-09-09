class CheckoutScreen

  def initialize
    @item_total_prices = Elements.new(:css, ".itemtotalprice > .money")
    @total_price = Elements.new(:css, "#TotalRow")
    @cart_continue_button = Elements.new(:css, "#divContinueSecurelyTop")
    @continue_securely_button = Elements.new(:css, 'input[type=submit][value="Continue Securely"]')
    @name_field = Elements.new(:css, "#NewAddressSelection_Address_FirstName")
    @surname_field = Elements.new(:css, "#NewAddressSelection_Address_Surname")
    @address_field = Elements.new(:css, "#NewAddressSelection_Address_Line1")
    @manual_address_button = Elements.new(:css, "#SaveAddressForm  .manuallyAddAddress")
    @town_field = Elements.new(:css, "#NewAddressSelection_Address_Town")
    @county_field = Elements.new(:css, "#NewAddressSelection_Address_RegionName")
    @postcode_field = Elements.new(:css, "#NewAddressSelection_Address_Postcode")
    @phone_field = Elements.new(:css, "#TelephoneNumber")
    @order_total = Elements.new(:css, '#TotalValue')
    @shipping_price = Elements.new(:css, "#BasketSummaryShippingValue")
    @add_new_card_button = Elements.new(:css, '.CardsIcons.PaymentMethodSelectionLink')
    @pay_with_paypal_button = Elements.new(:xpath, '//*[@class="PayImage PayPalPay"]/..')
    @gift_card_button = Elements.new(:xpath, '//*[@class="PayImage GiftCardPay"]/..')
    @card_number_field = Elements.new(:css, "[class=InputContainer] > input[name=cardnumber]")
    @expiry_date_field = Elements.new(:css, "[name=exp-date]")
    @login_email = Elements.new(:css, "#Login_EmailAddress")
    @login_password = Elements.new(:css, "#Login_Password")
    @login_button = Elements.new(:css, "#LoginButton")
    @guest_email = Elements.new(:css, "#Guest_EmailAddress")
    @guest_continue = Elements.new(:css, "a[class=dnnPrimaryAction]")
    @delivery_price = Elements.new(:css, "#BasketSummaryShippingValue")
    @bag_product_description = Elements.new(:css, "#dhypProductLink")
    @bag_product_price = Elements.new(:css, "[class*=productLine] .itemprice .money")
    @bag_remove_item_buttons = Elements.new(:css, ".s-basket-remove-button")
    @empty_bag_container = Elements.new(:css, ".AspNet-GridView-Empty")
    @delivery_address_elements = Elements.new(:css, "#CurrentAddress span")
  end

  def cart_continue_securely
    @cart_continue_button.click
  end

  def checkout_as_guest
    @guest_email.type("Testing#{rand(999999)}@gmail.com")
    @guest_continue.click
  end

  def insert_delivery_info(user)
    user_data = TestData::USERS[user]
    @name_field.type(user_data["first_name"])
    @surname_field.type(user_data["last_name"])
    @manual_address_button.click
    @address_field.type(user_data["address"])
    @town_field.type(user_data["town"])
    @county_field.type(user_data["county"])
    @postcode_field.type(user_data["postcode"])
    @phone_field.type(user_data["phone_number"])
    @continue_securely_button.click
  end

  def get_delivery_price
    @delivery_price.get_text
  end

  def choose_delivery_option
    @continue_securely_button.click
  end

  def pay_with_card
    @add_new_card_button.click
  end

  def pay_with_paypal
    @pay_with_paypal_button.click
  end

  def pay_with_gift_card
    @gift_card_button.click
  end

  def validate_product_price(price)
    raise "PRODUCT PRICE IS DIFFERENT THAN IN THE PRODUCT SCREEN!!!!\n " +
            "Actual: #{@bag_product_price.get_text} Expected: #{price}" unless price == @bag_product_price.get_text
  end

  def validate_product_description(brand, name)
    #Strings sometimes change capitalization inbetween product/checkout screens, downcasing to prevent random fails
    expected = "#{name} #{brand}".downcase
    raise "PRODUCT DESCRIPTION IS DIFFERENT THAN IN THE PRODUCT SCREEN!!!! \n " +
            "Actual: #{@bag_product_description.get_text} Expected: #{expected}" unless expected == @bag_product_description.get_text.downcase
  end

  def login(user)
    user_data = TestData::USERS[user]
    @login_email.type(user_data["email"])
    @login_password.type(user_data["password"])
    @login_button.click
  end

  def remove_all_items(count)
    count.times do
      @bag_remove_item_buttons.get_multiple_elements[0].click
    end
    @empty_bag_container.visible?
  end

  def validate_added_delivery_data(user)
    user_data = TestData::USERS[user]
    expected = "#{user_data["first_name"]}#{user_data["last_name"]}#{user_data["address"]}#{user_data["town"]}#{user_data["postcode"]}"
    actual = "#{@name_field.get_value}#{@surname_field.get_value}#{@address_field.get_value}#{@town_field.get_value}#{@postcode_field.get_value}"
    raise "Delivery data is not the same!!! \n" +
            "Expected: #{expected}\n" +
            "Actual: #{actual}" unless actual == expected
  end

  def insert_phone_number(user)
    user_data = TestData::USERS[user]
    @phone_field.type(user_data["phone_number"])
    @continue_securely_button.click
  end
end