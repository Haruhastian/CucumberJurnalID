Given(/^User open the website in the browser$/) do
  navigate = LoginJurnal.new(@driver, @wait)
  navigate.navigate_jurnal
end

When(/^User login with credentials (.*) and (.*)$/) do |usr,pwd|
  login = LoginJurnal.new(@driver, @wait)
  login.exec_jurnal(usr, pwd)
end

When(/^User login with credentials using (.*)$/) do |record|
  login_record = LoginJurnal.new(@driver, @wait)
  login_record.exec_jurnal_with_record(record)
end

Then(/^User succeeded login into the website$/) do
  verification = LoginJurnal.new(@driver, @wait)
  verification.login_verification
end