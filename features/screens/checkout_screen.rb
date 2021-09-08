class CheckoutScreen

  def initialize
    @top_continue_securely_button = Elements.new(:css, "#divContinueSecurelyTop")
    @item_total_prices = Elements.new(:css, ".itemtotalprice > .money")
    @total_price = Elements.new(:css, "#TotalRow")
    @cart_continue_button = Elements.new(:css, "#divContinueSecurelyTop")
    @continue_securely_button = Elements.new(:css , 'input[type=submit][value="Continue Securely"]')
    @name_field = Elements.new(:css , "#NewAddressSelection_Address_FirstName")
    @surname_field = Elements.new(:css , "#NewAddressSelection_Address_Surname")
    @address_field = Elements.new(:css , "#NewAddressSelection_Address_Line1")
    @manual_address_button = Elements.new(:css , "#SaveAddressForm  .manuallyAddAddress")
    @town_field = Elements.new(:css, "#NewAddressSelection_Address_Town")
    @county_field = Elements.new(:css, "#NewAddressSelection_Address_RegionName")
    @postcode_field = Elements.new(:css, "#NewAddressSelection_Address_Postcode")
    @phone_field = Elements.new(:css, "#TelephoneNumber")
    @order_total = Elements.new(:css , '#TotalValue')
    @shipping_price = Elements.new(:css , "#BasketSummaryShippingValue")
    @delivery_item_subtotal = Elements.new(:css , '#SubtotalRow')
    @add_new_card_button = Elements.new(:css, '.CardsIcons.PaymentMethodSelectionLink')
    @pay_with_paypal_button = Elements.new(:xpath, '//*[@class="PayImage PayPalPay"]/..')
    @gift_card_button = Elements.new(:xpath, '//*[@class="PayImage GiftCardPay"]/..')
    @card_number_field = Elements.new(:css, "[class=InputContainer] > input[name=cardnumber]")
    @expiry_date_field = Elements.new(:css , "[name=exp-date]")
    @cvc_field = Elements.new(:css , "[name=cvc]")
    @stripe_card_icon = Elements.new(:css, "#stripeCardBrand")
    @login_email = Elements.new(:css, "#Login_EmailAddress")
    @login_password = Elements.new(:css , "#Login_Password")
    @login_button = Elements.new(:css, "#LoginButton")
    @guest_email = Elements.new(:css, "#Guest_EmailAddress")
    @guest_continue = Elements.new(:css, "a[class=dnnPrimaryAction]")
    @delivery_price = Elements.new(:css , "#BasketSummaryShippingValue")
    @apply_card_button = Elements.new(:css, "#FindGiftCardButton")
    @paypal_email_field = Elements.new(:css , "#email")
    @paypal_password_field = Elements.new(:css , "#password")
    @paypal_login_button = Elements.new(:css, "#btnLogin")
    @paypal_next_button = Elements.new(:css, "#btnNext")
    @gift_card_code_field = Elements.new(:css, "#CardNumberInput")
    @gift_card_pin_field = Elements.new(:css, "#SecurityCodeInput")
    @submit_gift_card_button = Elements.new(:css , "#FindGiftCardButton")
  end

  def cart_continue_securely
    @cart_continue_button.click
  end

  def checkout_as_guest
    @guest_email.type("Testing#{rand(999999)}@gmail.com")
    @guest_continue.click
  end

  def insert_delivery_info
    @name_field.type("Tester")
    @surname_field.type("Testinger")
    @manual_address_button.click
    @address_field.type("Skanstes iela 50")
    @town_field.type("Riga")
    @county_field.type("Vidzeme")
    @postcode_field.type("LV-1013")
    @phone_field.type("9091001")
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

end