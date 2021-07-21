function fn() {
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);
  return karate.callSingle('classpath:examples/generic_functions.feature');
}