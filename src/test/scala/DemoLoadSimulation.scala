package simulations
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

class DemoLoadSimulation extends Simulation {
  val usersRamp = 2;
  val runDuration = 2;
  val rampDuration = 2;
  val protocol = karateProtocol("/*" -> Nil)
  val getUsers = scenario("Get Users").during(runDuration) {
    exec(karateFeature("classpath:examples/users.feature"))
  }

  setUp(
    getUsers.inject(rampUsers(usersRamp).during(rampDuration)).protocols(protocol)
  ).assertions(
    global.failedRequests.percent.is(0),
    global.successfulRequests.percent.gt(90)
  )
}
