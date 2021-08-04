@ignore
  Feature:
    Background:

      * def convertGridToJSON2 =
        """
        function(driver, columnLocator, cellLocator) {
            var allCells = driver.scriptAll(cellLocator,'_.innerText');
            var columnData = driver.scriptAll(columnLocator, "_.innerText");
            var table = createJson(columnData, allCells);
            karate.log("convertGridToJSON2 result", table);
            return table
        }
        """

      Scenario: