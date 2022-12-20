Feature: Login into Jurnal.id website

#  @scenario_one
#  Scenario Outline: Verifying that user can login into the Jurnal.id
#    Given User open the website in the browser
#    When User login with credentials <username> and <password>
#    Then User succeeded login into the website
#
#    Examples:
#      |username|password|
#      |hzbchh@gmail.com|@zacques17|

  @scenario_two
    Scenario Outline: Verifying that user can login into the Jurnal.id
    Given User open the website in the browser
    When User login with credentials using <record>
    Then User succeeded login into the website

      Examples:
        |record|
        |record1|