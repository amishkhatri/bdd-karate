Feature: Test Policy Report Search Service for different flows

    Background:
        * url baseURL
        * def req = read('../data/prss/prss-data-' + env + '.yml')

    Scenario: To test for the ping endpoint

        Given path '/ping'
        When method get
        Then status 200
        * match response == 'pong'
        * print response

    Scenario: To test for the getMode endpoint

        Given path '/getMode'
        When method get
        Then status 200
        * match response == 'mode=Test'
        * print response

    Scenario: To test for the searchByInsuredName endpoint

        Given path '/searchByInsuredName'
        And param req = req.InputRequest.insuredName
        When method get
        Then status 200
        * print response

    Scenario: To test for the searchByPolicyId endpoint

        Given path '/searchByPolicyId'
        And param req = req.InputRequest.policyId
        When method get
        Then status 200
        * print response

    Scenario: To test for the agencyEftSearch endpoint

        Given path '/agencyEftSearch'
        And param req = req.InputRequest.agencyCodes
        When method get
        Then status 200
        * print response

    Scenario: To test for the dailyActivitiesSearch endpoint

        Given path '/dailyActivitiesSearch'
        And param req = req.InputRequest.dailyActivitiesInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the paymentSearch endpoint

        Given path '/paymentSearch'
        And param req = req.InputRequest.paymentSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the renewalSearch endpoint

        Given path '/renewalSearch'
        And param req = req.InputRequest.renewalSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the inforcedPolicyReportSearch endpoint

        Given path '/inforcedPolicyReportSearch'
        And param req = req.InputRequest.inforcedPolicyReportSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the expiredPolicyReportSearch endpoint

        Given path '/expiredPolicyReportSearch'
        And param req = req.InputRequest.expiredPolicyReportSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the cancelPendingPolicyReportSearch endpoint

        Given path '/cancelPendingPolicyReportSearch'
        And param req = req.InputRequest.cancelPendingPolicyReportSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the allPoliciesReportSearch endpoint

        Given path '/allPoliciesReportSearch'
        And param req = req.InputRequest.allPoliciesReportSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the invoicedRenewalsReportSearch endpoint

        Given path '/invoicedRenewalsReportSearch'
        And param req = req.InputRequest.invoicedRenewalsReportSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the suspenseMemoSearch endpoint

        Given path '/suspenseMemoSearch'
        And param req = req.InputRequest.suspenseMemoSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the policyReportSearch endpoint

        Given path '/policyReportSearch'
        And param req = req.InputRequest.policyReportSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the applicationUploadSearch endpoint

        Given path '/applicationUploadSearch'
        And param req = req.InputRequest.applicationUploadSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the pifSearch endpoint

        Given path '/pifSearch'
        And param req = req.InputRequest.pifSearchInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the policyReportSearchCount endpoint

        Given path '/policyReportSearchCount'
        And param req = req.InputRequest.policyReportSearchCountInput
        When method get
        Then status 200
        * print response

    Scenario: To test for the health endpoint

        Given path '/actuator/health'
        When method get
        Then status 200
        * print response

    Scenario: To test for the prometheus endpoint

        Given path 'actuator/prometheus'
        When method get
        Then status 200
        * print response

    Scenario: To test for the liveness endpoint

        Given path 'actuator/health/liveness'
        When method get
        Then status 200
        * match response contains {"status": "UP"}
        * print response

    Scenario: To test for the readiness endpoint

        Given path 'actuator/health/readiness'
        When method get
        Then status 200
        * match response contains {"status": "UP"}
        * print response