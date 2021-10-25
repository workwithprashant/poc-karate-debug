import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.google.common.base.Functions;

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.intuit.karate.core.FeatureResult;
import com.intuit.karate.core.ScenarioResult;
import com.intuit.karate.core.Tag;
import com.intuit.karate.report.Report;
import org.junit.jupiter.api.Test;

public class TestRunner {
    public static final String TEST_ID_PATTERN = "^([a-zA-Z]+-[0-9]+)(.*:).*";

    @Test
    public void testParallel() {
        Results results = Runner
                .path("classpath:")
                .tags(Arrays.asList("demo"))
                .dryRun(true)
                .parallel(2);

        Stream<FeatureResult> allFeatureResults = results.getFeatureResults();
        Iterator<FeatureResult> iterator = allFeatureResults.iterator();
        HashMap<String, LinkedHashMap<Integer, String>> allFeatures = new HashMap<>();
        while (iterator.hasNext()) {
            LinkedHashMap<Integer, String> insertMap = new LinkedHashMap<>();
            FeatureResult frCurrent = iterator.next();
            String frLoc = frCurrent.getDisplayName();
            List<Tag> frTagsList = frCurrent.getFeature().getTags();
            List<String> frTags = (frTagsList == null || frTagsList.isEmpty()) ? Collections.emptyList() : frTagsList.stream().map(Functions.toStringFunction()).collect(Collectors.toList());
            String frName = frCurrent.getFeature().getName();
            String featureId = "";
            if (frName.matches(TEST_ID_PATTERN)) {
                featureId = frName.replaceAll(TEST_ID_PATTERN, "$1");
                if (frTags.contains(featureId)){
                    System.out.printf("Feature tag already exist = %s", featureId);
                } else {
                    insertMap.put(frCurrent.getFeature().getLine()-1, String.format("@%s", featureId));
                    System.out.printf("Feature tag does not exist = %s", featureId);
                }
            }
            for (ScenarioResult srCurrent : frCurrent.getScenarioResults()) {
                String scnName = srCurrent.getScenario().getName();
                String testCaseId = "";
                List<Tag> scnTagsList = srCurrent.getScenario().getTags();
                List<String> scnTags = (scnTagsList == null || scnTagsList.isEmpty()) ? Collections.emptyList() : scnTagsList.stream().map(Functions.toStringFunction()).collect(Collectors.toList());
                if (scnName.matches(TEST_ID_PATTERN)) {
                    testCaseId = scnName.replaceAll(TEST_ID_PATTERN, "$1");
                    if (scnTags.contains(testCaseId)){
                        System.out.printf("Scenario tag already exist = %s", testCaseId);
                    } else {
                        insertMap.put(srCurrent.getScenario().getLine()-1, String.format("@%s", testCaseId));
                        System.out.printf("Scenario tag does not exist = %s", testCaseId);
                    }
                }
            }

            allFeatures.put(frLoc, insertMap);
        }
    }
}
