Feature: Buying goods
  Background:
    Given the cookies popup is closed


  Scenario Outline: Buying goods as a guest
    When the user opens one of the featured categories
    And the user adds to their bag the first product from the list
    And the user bag contains the chosen item and user proceeds to checkout
    And the user continues the checkout as a guest
    And the guest_user inputs their delivery details and chooses a delivery option
    And the user pays with <payment_type>
    #Sadly Stripe test cards don't work in prod
    #Don't want to buy items for a proof of concept so skipping these steps
    #And Order summary screen is shown with the chosen items
    #And user accepts the order
    #Then succesfull checkout screen is shown
    Examples:
      | payment_type |
      | credit_card  |
      | paypal       |
      | gift_card    |

  Scenario Outline: Buying goods as a registered user with saved address
    And registered_user is logged in
    And the users bag is empty
    When the user opens one of the featured categories
    And the user adds to their bag the first product from the list
    And the user bag contains the chosen item and user proceeds to checkout
    And delivery information is already filled in with registered_user details
    And the registered_user confirms their address and chooses a delivery option
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
      #| saved_credit_card |
