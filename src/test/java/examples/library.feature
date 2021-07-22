@ignore
Feature: sample karate test library
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

    @getKittenIds
    Scenario:
      * karate.log("masterList = ", masterList)
      * def allKittens = $masterList[*].id
      * karate.log("allKittens ", allKittens)