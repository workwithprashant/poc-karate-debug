import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import java.util.Arrays;

public class TestRunner {
    @Test
    public void testParallel() {
        Results results = Runner
                .path("classpath:")
                .tags(Arrays.asList("demo"))
                .timeoutMinutes(1)
                .parallel(1);
    }
}
