# transaction_date = @driver.find_element(:xpath, "//table[@class='mx-table mx-table-date']")
# column_date = transaction_date.find_elements(:tag_name, "td")
# select_day = 1

# #Loop the Transaction Date
# column_date.each { |day|
#   puts day.text
#   if day.text == "#{select_day}"
#     @driver.find_element(:xpath, "//td[@title='2022-11-01']").click
#   end
# }

# #Fill the product quantity
# product_quantity = @driver.find_element(:xpath, "(//input[@id='product_stock_036710046'])[1]")
# product_quantity.send_keys("1")
#
# #Fill the Unit Price Sales
# product_unit_price_sales = @driver.find_element(:id, 'row_0_4')
# product_unit_price_sales.send_keys("10000")
# sleep(5)

# @random_character = ('a'..'z').to_a.shuffle.join
# print @random_character
