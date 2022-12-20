require 'yaml'
class LoginJurnal

  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def navigate_jurnal
    @driver.get 'https://www.jurnal.id/id/'
    # @driver.get 'http://sandbox.jurnal.id/users/login'
    @driver.manage.timeouts.implicit_wait = 10
  end

  def exec_jurnal(usr, pwd)
    btn_login = @driver.find_element(:id, 'btn_login')
    btn_login.click

    @wait.until do
      @driver.find_element(:xpath, "//label[contains(.,'Email')]")
    end

    email_fields = @driver.find_element(:id, 'user_email')
    email_fields.send_keys(usr)
    password_fields = @driver.find_element(:id, 'user_password')
    password_fields.send_keys(pwd)
    sleep(5)

  end

  def exec_jurnal_with_record(record)
    # btn_login = @driver.find_element(:id, 'btn_login')
    # btn_login.click

    @wait.until do
      @driver.find_element(:xpath, "//label[contains(.,'Email')]")
    end

    data_record = YAML.load(File.read('C:\Users\Smartlink Hastian\RubymineProjects\JurnalIDProject\features\data\record_jurnal.yaml'))
    username_value = data_record["#{record}"]['username']
    password_value = data_record["#{record}"]['password']

    email_fields = @driver.find_element(:id, 'user_email')
    email_fields.send_keys(username_value)
    password_fields = @driver.find_element(:id, 'user_password')
    password_fields.send_keys(password_value)

    @driver.find_element(:id, 'new-signin-button').click

    @wait.until do
      @driver.find_element(:class, 'user-name-label')
    end

  end

  def login_verification
    if @driver.title == "Dashboard | Jurnal"
      puts "Test passed - Title Jurnal found."
    else
      @driver.save_screenshot('failed_jurnal_login.png', full_page: false)
      puts "Test failed."
    end
  end

end
