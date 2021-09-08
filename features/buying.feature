Feature: Buying goods

  Scenario Outline: Buying goods as a guest
    When the user opens one of the featured categories
    And the user adds to their bag the first product from the list
    And the user views their bag and proceeds to checkout
    And the user continues the checkout as a guest
    And the user inputs their delivery details and chooses a delivery option
    And the user pays with <payment_type>
    #Sadly Stripe test cards don't work in prod
    #Don't want to buy items for a proof of concept so skipping these steps
    #And Order summary screen is shown
    #And user accepts the order
    #Then succesfull checkout screen is shown
    Examples:
      | payment_type |
      | credit_card  |
      | paypal       |
      | gift_card    |

#  Scenario Outline: Buying goods as a registered user
#    When the user opens one of the featured categories
#    And the user adds to their bag the first product from the list
#    And the user views their bag and proceeds to checkout
#    And the user logs into their account
#    And the user confirms their address and chooses a delivery option
#    And the user pays with <payment_type>
    #Sadly Stripe test cards don't work in prod
    #Don't want to buy items for a proof of concept so skipping these steps
    #And Order summary screen is shown
    #And user accepts the order
    #Then succesfull checkout screen is shown
#    Examples:
#      | payment_type      |
#      | credit_card       |
#      | paypal            |
#      | gift_card         |
      #| saved_credit_card |
