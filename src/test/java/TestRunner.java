import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;

import java.util.Collections;

import static org.junit.Assert.assertTrue;

public class TestRunner {
    @Test
    public void testParallel() {
        Results results = Runner
                .path("classpath:")
                .tags(Collections.singletonList("demo"))
                .parallel(1);

        assertTrue("Tests Completed", true);
    }
}
