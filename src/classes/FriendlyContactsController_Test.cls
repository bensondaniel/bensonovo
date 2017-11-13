@isTest
private class FriendlyContactsController_Test {
	
	List<Contact> testContacts = TestDataFactory.createContactsDefault(5);
	@isTest static void test_FriendlyContactsController() {
		// Set mock callout class
        Test.setMock(HttpCalloutMock.class, new OVOHttpCalloutMockImpl());
		FriendlyContactsController fcc = new FriendlyContactsController();
		System.assertEquals(fcc.contacts.size(), 4);
	}
	
	@isTest static void test_saveme() {
		// Set mock callout class
        Test.setMock(HttpCalloutMock.class, new OVOHttpCalloutMockImpl());
		FriendlyContactsController fcc = new FriendlyContactsController();
		fcc.contacts[0].FirstName = 'UpdatedName';
		fcc.saveme();
		System.assertEquals(fcc.contacts[0].FirstName, 'UpdatedName');
	}
	
}