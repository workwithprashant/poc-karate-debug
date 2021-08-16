import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import java.util.Arrays;
import java.util.Collections;
import org.junit.jupiter.api.Test;

public class TestRunner {
    @Test
    public void testParallel() {
        Results results = Runner
                .path("classpath:")
                .tags(Arrays.asList("demo3", "demo2"))
                .parallel(2);
    }
}
