class CreateSalesInvoice
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end
  def jurnal_choose
    sales_feature = @driver.find_element(:id, 'sales-li')
    sales_feature.click

    @wait.until do
      @driver.find_element(:id, 'text-headOpeninvoices')
    end

    if @driver.find_element(:id, 'text-headOpeninvoices').text == "Open invoices"
      puts "Page has successfully entered."
    end

    @wait.until do
      @driver.find_element(:id, 'sales_invoice_tab').displayed?
    end

    create_sales_button = @driver.find_element(:id, 'create_new_sales-trigger')
    @driver.action.click(create_sales_button).perform

    @wait.until do
      @driver.find_element(:id, 'create_new_sales-list').enabled?
    end

    sales_invoice_button = @driver.find_element(:xpath, "(//div[normalize-space()='Sales Invoice'])[1]")
    sales_invoice_button.click
    sleep(3)

    if @driver.find_element(:id, 'sales-header').text == " Create Sales Invoice "
      puts "Successfully access 'Create Sales' Invoice."
    end
  end

  def billing_req
    #Click dropdown's the Customer if already have one
    customer_dropdown = @driver.find_element(:id, 'select_contact')
    customer_dropdown.click

    @wait.until do
      @driver.find_element(:class, 'multiselect__element')
    end

    #Choose the Customer if already have one or more
    customer_select = @driver.find_element(:class, 'multiselect__element')
    if customer_select.displayed?
      @driver.action.click(customer_select).perform
      @driver.find_element(:xpath, "//span[contains(.,'Hikaru')]").click
    end
    sleep(2)

    #Fill Billing Address etc
    billing_address = @driver.find_element(:id, 'billing_address')
    billing_address.send_keys("Jalan Indonesia Blok 1945.")

    #Transaction Date
    tr_date = @driver.find_element(:id, 'transaction_date')
    tr_date.click

    @wait.until do
      @driver.find_element(:xpath, "//div[@class='mx-calendar mx-calendar-panel-date']")
    end

    #Input the Date here
    tr_date_input = "2022-11-01"
    @driver.find_element(:xpath, "//td[@title='#{tr_date_input.to_s}']").click

    #Due Date
    due_date = @driver.find_element(:id, 'due_date')
    due_date.click

    @wait.until do
      @driver.find_element(:xpath, "//table[@class='mx-table mx-table-date']")
    end

    #Input the Date here
    due_date_input = "2022-12-02"
    @driver.find_element(:xpath, "//td[@title='#{due_date_input.to_s}']").click
    sleep(3)

    #Select the Product here
    product_select = @driver.find_element(:id, 'select_product_1')
    product_select.click

    @wait.until do
      @driver.find_element(:xpath, "//li[@class='multiselect__element']//span[@class='multiselect__option']")
    end

    #Click product Test 1
    @driver.find_element(:xpath, "//span[contains(.,'Test 1')]").click

    #Fill the Message
    message_input = @driver.find_element(:id, 'message')
    message_input.send_keys("This is a test messages.")

    #Fill the Memo
    memo_input = @driver.find_element(:id, 'memo')
    memo_input.send_keys("This is a test Memo.")


  end

  def billing_req_empty
    #Select Contact to add new customer
    customer_dropdown = @driver.find_element(:id, 'select_contact')
    customer_dropdown.click

    @wait.until do
      @driver.find_element(:class, "multiselect__content-wrapper")
    end

    # add_customer = @driver.find_element(:xpath, "//span[contains(text(),'+ Add new')]")
    add_customer_2 = @driver.find_element(:xpath, "//button[contains(text(),'+ Add new')]")
    add_customer_2.click

    @wait.until do
      @driver.find_element(:id, 'display_name')
    end

    #Fill the Display Name
    new_name_cust = @driver.find_element(:id, 'display_name')
    @random_character = ('a'..'z').to_a.shuffle.join
    new_name_cust.send_keys("#{@random_character}")

    # #Fill the Email Customer
    # new_email_cust = @driver.find_element(:id, 'c_email')
    # new_email_cust.send_keys("#{@random_character}@gmail.com")

    #Fill the Telephone Numbers
    new_telephone_cust = @driver.find_element(:id, 'telephone')
    random_number = ('0'..'9').to_a.shuffle.join
    new_telephone_cust.send_keys("08" + "#{random_number}")

    #Fill the Billing Address
    new_billing_address_cust = @driver.find_element(:xpath, "(//textarea[@id='billing_address'])[2]")
    new_billing_address_cust.send_keys("#{@random_character}" + " Street.")

    #Save the new customer
    save_new_cust = @driver.find_element(:xpath, "//button[contains(.,' Save ')]")
    save_new_cust.click

    @wait.until do
      customer_dropdown
    end

    #Select the date
    #Click the date here
    transc_date = @driver.find_element(:xpath, "//div[@id='transaction_date']//input")
    transc_date.click

    @wait.until do
      @driver.find_element(:xpath, "//table[@class='mx-table mx-table-date']")
    end

    #Input the Date here
    tr_date_input = "2022-12-01"
    tr_date_fill = @driver.find_element(:xpath, "//td[@title='#{tr_date_input.to_s}']")
    tr_date_fill.click

    #Due Date
    due_date = @driver.find_element(:id, 'due_date')
    due_date.click

    @wait.until do
      @driver.find_element(:xpath, "//table[@class='mx-table mx-table-date']")
    end

    #Input the Date here
    due_date_input = "2023-01-01"
    due_date_fill = @driver.find_element(:xpath, "//td[@title='#{due_date_input.to_s}']")
    due_date_fill.click

    @driver.find_element(:id, 'sales_table_list').click
  end
  def product_req_empty
    #Make new Product
    #Select the Product Dropdown
    product_select = @driver.find_element(:id, 'select_product_1')
    product_select.click

    @wait.until do
      @driver.find_element(:class, "multiselect__element")
    end

    #Add new Product
    add_new_product = @driver.find_element(:xpath, "//*[@id='select_product_1']/div/div/div[2]/ul/span/button")
    add_new_product.click

    @wait.until do
      @driver.find_element(:id, 'name')
    end

    #Add Name
    add_product_name = @driver.find_element(:id, 'name')
    add_product_name.send_keys("#{@random_character}")

    #Add Unit
    add_product_unit = @driver.find_element(:xpath, "//div[@placeholder='Select unit']//div[@class='multiselect__tags']")
    add_product_unit.click

    @wait.until do
      @driver.find_element(:xpath, "//span[contains(.,'Pcs')]")
    end

    @driver.find_element(:xpath, "//span[contains(.,'Pcs')]").click

    #Add Buy Unit Price
    add_product_buy_unit_price = @driver.find_element(:id, 'buy_price_per_unit')
    add_product_buy_unit_price.send_keys("10000")

    #Add PPN/Tax
    add_product_buy_tax = @driver.find_element(:id, 'buy_tax')
    add_product_buy_tax.click

    @wait.until do
      @driver.find_element(:xpath, "//span[contains(text(),'PPN')]")
    end

    @driver.find_element(:xpath, "//span[contains(text(),'PPN')]").click

    #Save the new product
    save_new_product = @driver.find_element(:xpath, "//button[contains(.,'Save')]")
    save_new_product.click

    @wait.until do
      @driver.find_element(:id, 'select_product_2')
    end

    #First Product Description
    description_product = @driver.find_element(:id, 'row_0_1')
    description_product.send_keys("Description of #{@random_character}.")

    #First Product Quantities
    quantities_product = @driver.find_element(:class, 'css-1vo9uw0')
    quantities_product.send_keys("1")

    #First Product Unit Price
    unit_price_product = @driver.find_element(:id, 'row_0_4')
    unit_price_product.send_keys("10000")

    #First Product Tax
    tax_product = @driver.find_element(:id, 'tax-line1')
    tax_product.click
    @wait.until do
      @driver.find_element(:xpath, "//span[contains(.,'PPN')]")
    end
    @driver.find_element(:xpath, "//span[contains(.,'PPN')]").click

    #Make message
    message_test = @driver.find_element(:id, 'message')
    message_test.send_keys("This is the #{@random_character} Messages.")

    #Make memo
    memo_test = @driver.find_element(:id, 'memo')
    memo_test.send_keys("This is the #{@random_character} Memo.")

    #Save the Invoice
    create_invoice = @driver.find_element(:id, 'create')
    create_invoice.click

    @wait.until do
      @driver.find_element(:id, 'customer_name')
    end
  end

  def validate_invoice
    #Validation
    if @driver.find_element(:id, 'customer_name').text == @random_character
      puts "The Invoice has been created and validated identically."
    else
      puts @driver.find_element(:id, 'customer_name').text
      puts @random_character
      raise "The Invoice isn't the same as just created."
    end

  end


end