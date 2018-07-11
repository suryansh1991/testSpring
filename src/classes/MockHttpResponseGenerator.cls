@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock{

    global HTTPResponse respond(HTTPRequest req) {
    	
        System.assertEquals('https://postman-echo.com/get?foo1=bar1&foo2=bar2', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"testValue":"test"}');
        res.setStatusCode(200);
        return res;
    }
}