@ignore
Feature: sample karate test library
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

Background:
  * def KEY_background_library = 'VALUE_background_library'

  @getLibraryData
  Scenario: Call library data
    * def libraryData = call read('classpath:examples/library.feature@libraryData')


  @libraryData
  Scenario: Get library data
    * def libraryData = "VALUE_libraryData"
