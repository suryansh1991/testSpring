@isTest
private class HttpBasicCalloutTest {

    static testMethod void testCallout() {

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        HttpResponse res = HttpBasicCallout.doHttpCallout();
        
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = res.getBody();
        String expectedValue = '{"testValue":"test"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
        
    }
}