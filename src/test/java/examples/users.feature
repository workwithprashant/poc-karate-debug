@demo
Feature: ABCD-001:sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def randomNumber = random_number(2)

  @demo1
  Scenario: ABCD-002:Sample test 1
  * print randomNumber

  @demo2
  Scenario: ABCD-003: Sample test 2
    * print randomNumber


  @demo3
  Scenario: ABCD-004 :Sample test 3
    * print randomNumber

  @demo4
  Scenario: ABCD-004 Sample test 4
    * print randomNumber










#    * print response[0]
#    * def user =
#      """
#      {
#        "name": "Test User",
#        "username": "testuser",
#        "email": "test@user.com",
#        "address": {
#          "street": "Has No Name",
#          "suite": "Apt. 123",
#          "city": "Electri",
#          "zipcode": "54321-6789"
#        }
#      }
#      """
#
#    Given url 'https://jsonplaceholder.typicode.com/users'
#    And request user
#    When method post
#    Then status 201
#    Then karate.log('Random Number = ', randomNumber)