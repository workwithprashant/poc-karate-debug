@ignore
Feature: sample karate test library
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  @getusers
  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200