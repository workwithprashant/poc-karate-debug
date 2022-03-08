@demo
Feature: sample karate test script

  Background:
    * def randomNumber = random_number(2)
    * def sleep =
      """
      function(seconds){
        for(i = 0; i <= seconds; i++)
        {
          java.lang.Thread.sleep(1*1000);
          karate.log(i);
        }
      }
      """

  Scenario Outline: create a user and then get it by id
    * karate.log('Iteration = ', <iteration>)
    * karate.log('randomNumber = ', randomNumber)
    * sleep(70)
    * def var = 'foo'
    * karate.log('Unique UUID = ', uuid)
    Examples:
      | iteration |
      | 1         |