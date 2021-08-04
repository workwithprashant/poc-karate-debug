@ignore
Feature: sample karate test library
#  for help, see: https://github.com/intuit/karate/wiki/IDE-Support
  Background:
    * def webUtil = callonce read('classpath:examples/webui_js_functions.feature')

    @getKittenIds
    Scenario:
      * karate.log("masterList = ", masterList)
      * def allKittens = $masterList[*].id
      * karate.log("allKittens ", allKittens)

      @scrapeThePage
      Scenario:
        * def column_locator = ".sorting"
        * def row_locator = ".odd"
      * def pageText = webUtil.convertGridToJSON2(driver, column_locator, row_locator)
        * karate.log("pageText",pageText)