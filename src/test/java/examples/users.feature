@demo
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def randomTag = random_tag()
    * def pageUrl = 'https://www.worldometers.info/world-population/population-by-country/'

  Scenario: go to a web page and get some text
    Given driver pageUrl
    * driver.maximize()
    * call read('classpath:examples/library.feature@scrapeThePage')