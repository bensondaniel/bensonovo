@isTest
global class OVOHttpCalloutMockImpl implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://sheltered-depths-66346.herokuapp.com/customers', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"customers":[{"id":"be1d35af-6020-4445-9451-f13facfcfc9a","firstName":"David","lastName":"Bond","gender":"Male","title":"Mr"},{"id":"35dcc4b1-2659-4497-abc7-dac94ec66812","firstName":"Chris","lastName":"Waldron","gender":"Male","title":"Mr"},{"id":"c340adc6-af7c-43c5-b2e1-5c4a79aec873","firstName":"Chris","lastName":"Reed","gender":"Male","title":"Mr"},{"id":"452e644a-8b21-4cfb-9683-f363be7aef6f","firstName":"Tanya","lastName":"Rusakova","gender":"Female","title":"Mrs"}]}');
        res.setStatusCode(200);
        return res;
    }
}
