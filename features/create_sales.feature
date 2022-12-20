Feature: Create a sales invoice from Jurnal.ID

  Scenario Outline: Verifying that the user can make one sales invoice
    Given User succeeded login into the website with <record> and choose the Sales feature
    When User fill the required Billing and Product requirements
    Then User has successfully made one invoice

    Examples:
    |record|
    |record1|


