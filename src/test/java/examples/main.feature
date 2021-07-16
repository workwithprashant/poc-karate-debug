@demo
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def KEY_background_main = 'VALUE_background_main'

  @expected
  Scenario: Variable overwrite example
  * def response = 'A'
  * def resp1 = '1'
  * karate.log('FIRST EXPECTED RESPONSE = ', response)

  * def response = 'B'
  * def resp2 = '2'
  * karate.log('SECOND EXPECTED RESPONSE = ', response)

  * def response = 'C'
  * def resp3 = '3'
  * karate.log('FINAL EXPECTED RESPONSE = ', response)


  @unexpected
  Scenario: Not over-writing nested variable
    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp1 = response.randomTag
    * karate.log('FIRST RESPONSE SIZE = ', out.length)

    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp2 = response.randomTag
    * karate.log('SECOND RESPONSE SIZE = ', out.length)

    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp3 = response.randomTag
    * karate.log('THIRD RESPONSE SIZE = ', out.length)
    * karate.log('UNEXPECTED RESPONSE = ', response)


  @workaround-half-1
  Scenario: Not over-writing nested variable
    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp1 = response.randomTag
    * karate.log('FIRST RESPONSE SIZE = ', out.length)

    * def response = null
    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp2 = response.randomTag
    * karate.log('SECOND RESPONSE SIZE = ', out.length)

    * def response = null
    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp3 = response.randomTag
    * karate.log('THIRD RESPONSE SIZE = ', out.length)

    * def response = null
    * karate.log('EXPECTED RESPONSE = ', response)

    @workaround-half-2
  Scenario: Not over-writing nested variable
    * string out = call read('classpath:examples/library.feature@getLibraryData')
    * karate.log('FIRST RESPONSE SIZE = ', out.length)

    * def out = null
    * string out = call read('classpath:examples/library.feature@getLibraryData')
    * karate.log('SECOND RESPONSE SIZE = ', out.length)

    * string out = null
    * string out = call read('classpath:examples/library.feature@getLibraryData')
    * karate.log('THIRD RESPONSE SIZE = ', out.length)

    * string out = null
    * karate.log('EXPECTED RESPONSE = ', out)