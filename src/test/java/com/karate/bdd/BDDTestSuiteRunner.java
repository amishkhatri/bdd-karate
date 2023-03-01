package com.karate.bdd;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@KarateOptions(tags= {"~@ignore"})
public class BDDTestSuiteRunner {

    @Test
    public void testParallel() {
        Results results = Runner.builder().outputCucumberJson(true).path("classpath:com/karate/bdd").parallel(5);
        generateReport(results.getReportDir());
        Assertions.assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    private void generateReport(String karateOutputPath)
    {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file-> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "occupation-service");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
