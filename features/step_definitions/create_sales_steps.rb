Given(/^User succeeded login into the website with (.*) and choose the Sales feature$/) do |record|
  navigate = LoginJurnal.new(@driver, @wait)
  navigate.navigate_jurnal
  login_record = LoginJurnal.new(@driver, @wait)
  login_record.exec_jurnal_with_record(record)
  verification = LoginJurnal.new(@driver, @wait)
  verification.login_verification
  enter_sales = CreateSalesInvoice.new(@driver, @wait)
  enter_sales.jurnal_choose
end

When(/^User fill the required Billing and Product requirements$/) do
  # filling_requirements = CreateSalesInvoice.new(@driver, @wait)
  # filling_requirements.billing_req

  empty_fill = CreateSalesInvoice.new(@driver, @wait)
  empty_fill.billing_req_empty
  empty_fill.product_req_empty
end


Then(/^User has successfully made one invoice$/) do
  validate = CreateSalesInvoice.new(@driver, @wait)
  validate.validate_invoice

end