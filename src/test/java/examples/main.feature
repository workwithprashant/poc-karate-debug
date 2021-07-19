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
    * def resp1 = response.libraryData
    * karate.log('resp1 = ', resp1)
    * karate.log('FIRST RESPONSE SIZE = ', out.length)

    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp2 = response.libraryData
    * karate.log('resp2 = ', resp2)
    * karate.log('SECOND RESPONSE SIZE = ', out.length)

    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp3 = response.libraryData
    * karate.log('resp3 = ', resp3)
    * karate.log('THIRD RESPONSE SIZE = ', out.length)
#    * karate.log('UNEXPECTED RESPONSE = ', response)

  @unexpected2
  Scenario: Not over-writing nested variable
    * call read('classpath:examples/library.feature@getLibraryData')
    * def s1 = response[0].website
    * call read('classpath:examples/library.feature@getLibraryData')
    * call read('classpath:examples/library.feature@getLibraryData')
    * karate.log('UNEXPECTED RESPONSE = ', response)

  @unexpected3
  Scenario: Not over-writing nested variable
    * def data = {}
    * data.response = karate.call('classpath:examples/library.feature@getLibraryData')
    * string out = data.response
#    * karate.log('FIRST RESPONSE = ', data.response)
    * karate.log('FIRST RESPONSE SIZE = ', out.length)
#    * def out = null

    * data.response = karate.call('classpath:examples/library.feature@getLibraryData')
    * string out = data.response
#    * karate.log('SECOND RESPONSE = ', data.response)
    * karate.log('SECOND RESPONSE SIZE = ', out.length)
#    * def out = null

    * data.response = karate.call('classpath:examples/library.feature@getLibraryData')
    * string out = data.response
    * karate.log('THIRD RESPONSE SIZE = ', out.length)
#    * karate.log('UNEXPECTED RESPONSE = ', data.response)

  @workaround-half-1
  Scenario: Not over-writing nested variable
    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp1 = response.libraryData
    * karate.log('FIRST RESPONSE SIZE = ', out.length)

    * def response = null
    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp2 = response.libraryData
    * karate.log('SECOND RESPONSE SIZE = ', out.length)

    * def response = null
    * def response = call read('classpath:examples/library.feature@getLibraryData')
    * string out = response
    * def resp3 = response.libraryData
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