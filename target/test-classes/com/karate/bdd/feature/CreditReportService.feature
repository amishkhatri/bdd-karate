Feature: Test Credit Report Service for different flows

    Background:
        * url baseURL
        * def rfi = read('../data/crs/crs-data-' + env + '.yml')

    Scenario: To test for the ping endpoint

        Given path '/ping'
        When method get
        Then status 200
        * print response

    Scenario: To test for the orderReport endpoint

        Given path '/orderReport'
        And param clientId = rfi.InputRequest.clientId
        And param transId = rfi.InputRequest.transId
        And param rfi = rfi.InputRequest.payload
        When method post
        Then status 200
        * print response

    Scenario: To test for the orderReport-v2 endpoint

        Given path '/v2/orderReport'
        And param clientId = rfi.InputRequest.clientId
        And param transId = rfi.InputRequest.transId
        And param rfi = rfi.InputRequest.payload
        When method post
        Then status 200
        * print response

    Scenario: To test for the processRequestRfi endpoint

        Given path '/creditReportRS/processRequestRfi'
        And param clientId = rfi.InputRequest.clientId
        And param transId = rfi.InputRequest.transId
        And param rfi = rfi.InputRequest.payload
        When method post
        Then status 200
        * print response

    Scenario: To test for the processRequestRfi endpoint with no Gender

        Given path '/creditReportRS/processRequestRfi'
        And param clientId = rfi.InputRequest.clientId
        And param transId = rfi.InputRequest.transId
        And param rfi = rfi.InputRequest.payloadWithoutGender
        When method post
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