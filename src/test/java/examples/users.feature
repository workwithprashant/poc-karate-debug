@demo
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def randomTag = random_tag()

  Scenario: create a user and then get it by id
    * def usersKittens = $masterList[*].id
    * karate.log("users Kittens = ", usersKittens)
    * def res = call read('classpath:examples/library.feature@getKittenIds')
    * karate.log('user response = ', res)
    * karate.log('Random Tag = ', randomTag)