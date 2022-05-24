@demo
Feature: someKey-123: Todo: Notice how it complains about spaces in the feature file

#  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def randomNumber = random_number(2)
#    todo: function name is expected syntax error three line below this
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

#  Todo: I would like to be able to tell at a glance what vars this scenario expects as an input, and what vars it creates
# Some kinf of auto generated  docstring, something like this:
#  Inputs: randomNumber
#           uuid
#  Creates vars: myVar

  Scenario Outline: <testKey> - create a user and then get it by id
#    * def response = call read('classpath:examples/library.feature@getusers')
    * karate.log('Iteration = ', <iteration>)
    * karate.log('randomNumber = ', randomNumber)
    * karate.log('Unique UUID = ', uuid)
    * sleep(70)
    * def myVar = 'foo'
    Examples:
      | testKey |iteration  |
      |"someKey-890"| 1         |
#      |"someKey-891"| 2         |

#  todo: ctrl-click works with karate.call but not with call read
  Scenario: someKey-567: navigation doesn't work with call read
    * def res = karate.call('classpath:src/test/java/examples/library.feature@getusers')
    * def res = call read('classpath:src/test/java/examples/library.feature@getusers')

