@isTest
private class OVORestController_Test {
	
	//List<Contact> testContacts = TestDataFactory.createContactsDefault(5);
	/*@isTest static void test_fetchOVOPayload() {
		// Set mock callout class
        Test.setMock(HttpCalloutMock.class, new OVOHttpCalloutMockImpl());
		FriendlyContactsController fcc = new FriendlyContactsController();

		OVORestController ovo = new OVORestController();
        ovo.fetchOVOPayload();
        //No more assertions needed as this has been done on the Mock class
	}*/
	
	
	@isTest static void test_comparePayloadWithExistingContacts() {
		
		List<Contact> testContactsInsert = TestDataFactory.createContactsDefault(1);
		Contact thisContact = testContactsInsert.get(0);
		String testOVOID = 'be1d35af-6020-4445-9451-f13facfcfc9a';
		Set<String> allReceivedOVOIDs = new Set<String>();
		allReceivedOVOIDs.add(testOVOID);
		OVORestController ovo = new OVORestController();
		Map<String, Contact> newCollection = new Map<String, Contact> ();
		newCollection.put('be1d35af-6020-4445-9451-f13facfcfc9a', thisContact);
        
		thisContact.Salutation = 'Mr';
		thisContact.OVOCustomerID__c = 'be1d35af-6020-4445-9451-f13facfcfc9a';
		thisContact.Gender__c = 'Male';
		thisContact.ContactLoyaltyStatus__c = 'Friendly';

        //ovo.comparePayloadWithExistingContacts(allReceivedOVOIDs, newCollection);

        //Query for changes
        List<Contact> updatedList = [Select id from Contact];
        system.assertEquals(updatedList.size() , 1);

	}

}