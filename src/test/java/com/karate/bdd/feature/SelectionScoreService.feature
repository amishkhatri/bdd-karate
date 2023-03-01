Feature: Test Selection Service for different flows

    Background:
        * url baseURL
        * header Content-Type = 'application/json'
        * def inputPayload = read('../data/sels/sels-data-' + env + '.yml')

    Scenario: To test for the selectProgram endpoint

        Given path '/v2/selectProgram'
        And request inputPayload.InputRequest.selectProgramPayload
        When method post
        Then status 200
        * print response

    Scenario: To test for the selectFinalProgram endpoint

        Given path '/v2/selectFinalProgram'
        And request inputPayload.InputRequest.selectFinalProgramPayload
        When method post
        Then status 200
        * print response

    Scenario: To test for the selectFinalProgramPayloadWithDownstreamCall endpoint

        Given path '/v2/selectFinalProgram'
        And request inputPayload.InputRequest.selectFinalProgramPayloadWithDownstreamCall
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