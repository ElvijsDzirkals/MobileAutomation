class ProductScreen

  def initialize
    @product_list = Elements.new(:css, "#navlist > li")
    @product_price = Elements.new(:css, "#lblSellingPrice")
    @product_brand = Elements.new(:css, "#lblProductBrand")
    @product_name = Elements.new(:css, "#lblProductName")
    @available_sizes = Elements.new(:xpath, '//li[@id="liItem" and not(contains(@title, "is out of stock"))]')
    @add_to_bag_btn = Elements.new(:css, '#aAddToBag')
  end

  def choose_first_product
    @product_list.get_multiple_elements[0].click
  end

  def get_product_name
    @product_name.get_text
  end

  def get_product_brand
    @product_brand.get_text
  end

  def get_product_price
    @product_price.get_text
  end

  def add_to_bag
    @available_sizes.get_multiple_elements[0].click
    @add_to_bag_btn.click
  end

end