@ignore
Feature: sample karate test library
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
#    * url 'https://jsonplaceholder.typicode.com'
#    * url 'https://api.instantwebtools.net'
    * url 'https://reqres.in'
    * def randomNumber = random_number(1)

  @getusers
  Scenario: get all users and then get the first user by id
    Given path 'api', 'users'
    * param delay = 1
    When method get
    Then status 200
    Then karate.log('Random Number = ', randomNumber)