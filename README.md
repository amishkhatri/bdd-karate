mvn commands -

mvn test -PrunBDD -Dtest=BDDTestSuiteRunner -Dkarate.baseURL=<<URL>> -Dkarate.environment=i0 "-Dkarate.options=classpath:com/karate/bdd/feature/PolicyReportSearchService.feature"

mvn test -PrunBDD -Dtest=BDDTestSuiteRunner -Dkarate.baseURL=<<URL>> -Dkarate.environment=i0 "-Dkarate.options=classpath:com/karate/bdd/feature/CreditReportService.feature"
