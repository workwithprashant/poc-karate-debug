@demo
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def randomNumber = random_number(2)

  Scenario Outline: create a user and then get it by id
#    * def response = call read('classpath:examples/library.feature@getusers')
    * karate.log('Iteration = ', <iteration>)
    * karate.log('randomNumber = ', randomNumber)
    * karate.log('Unique UUID = ', uuid)
    Examples:
      |iteration  |
      | 1         |
      | 2         |