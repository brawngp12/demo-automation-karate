package runner;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Tag;

/**
 * Main test runner for Karate feature files.
 *
 * Run all tests:        mvn test
 * Run by tag:           mvn test -Dkarate.options="--tags @smoke"
 * Run by environment:   mvn test -Dkarate.env=staging
 */
@Tag("all")
public class TestRunner {

    /**
     * Runs all feature files found under src/test/resources/features.
     */
    @Karate.Test
    Karate runAll() {
        return Karate.run("classpath:features")
                .relativeTo(getClass());
    }

    /**
     * Runs only features tagged with @smoke.
     */
    @Karate.Test
    Karate runSmoke() {
        return Karate.run("classpath:features/backend")
                .tags("@smoke")
                .relativeTo(getClass());
    }

    /**
     * Runs only features tagged with @regression.
     */
    @Karate.Test
    Karate runRegression() {
        return Karate.run("classpath:features/frontend")
                .tags("@regression")
                .relativeTo(getClass());
    }

    /**
     * Runs all UI/frontend feature files (tagged @ui).
     * Requires ChromeDriver installed and matching Chrome version.
     *
     * Run: mvn test -Dtest=TestRunner#runUI
     */
    @Karate.Test
    Karate runUI() {
        return Karate.run("classpath:features/frontend")
                .tags("@ui")
                .relativeTo(getClass());
    }

}
