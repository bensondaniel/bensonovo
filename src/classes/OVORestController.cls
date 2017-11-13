public with sharing class OVORestController {

	public Object fetchOVOPayload() {

		String friendsJson;

		HttpRequest req = new HttpRequest();
	   	Http http = new Http();
	   	// set the method
	   	req.setMethod('GET');
	   	// generate the url for the request
	   	String url = 'https://sheltered-depths-66346.herokuapp.com/customers';
	   	// add the endpoint to the request
	   	req.setEndpoint(url);
	   	// create the response object
	   	HTTPResponse resp = http.send(req);

	   	

	   	friendsJson = resp.getBody();

	   	//Cast the response to a Custom Type for Easy and Meaningful Parsing
	   	Map<String, Object> cObjMap = (Map<String, Object>) JSON.deserializeUntyped(resp.getBody());

	   	List<Object> cObjList = (List<Object>)cObjMap.get('customers');
	   	Set<String> allReceivedOVOIDs = new Set<String>();

	   	List<Contact> contactstoInsert = new List<Contact>();
	   	Map<String, Contact> newCollection = new Map<String, Contact>();
	   	for(Object currentRecord : cObjList){
	   		Map<String,Object> currentFriend = new Map<String,Object>();
	   		currentFriend = (Map<String,Object>)currentRecord;
	   		Contact newContact = new Contact();
	   		newContact.Salutation = (String)currentFriend.get('title');
	   		newContact.OVOCustomerID__c = (String)currentFriend.get('id');
	   		newContact.FirstName = (String)currentFriend.get('firstName');
	   		newContact.LastName = (String)currentFriend.get('lastName');
	   		newContact.Gender__c = (String)currentFriend.get('gender');
			newContact.ContactLoyaltyStatus__c = 'Friendly';
			newCollection.put(newContact.OVOCustomerID__c,newContact);
            allReceivedOVOIDs.add(newContact.OVOCustomerID__c );
	   	}


        //Create a Map of Existing Contacts in the format OVOID vs Contact
        //This is done for easy comparison between newly received Friend List and those that have
        //Already been saved in Salesforce
	   	List<Contact> existingContactsList = [Select Id, OVOCustomerID__c from Contact where OVOCustomerID__c IN :allReceivedOVOIDs];
	   	Map<String, Contact> existingCollection = new Map<String, Contact>();
	   	system.debug('!!!!!!!!!!!!!! Here is the Start !!!!!!!!!!!!!');
	   	for(Contact existingContact : existingContactsList){
	   		system.debug('!!!!!!!!!!!!!! Contact Found !!!!!!!!!!!!!');
	   		system.debug(existingContact);
	   		existingCollection.put(existingContact.OVOCustomerID__c,existingContact);
	   	}

	   	//Build the List of new Contacts that need to be saved to Salesforce
	   	if(newCollection.values().size() > existingContactsList.size()){
	   		for(Contact contactMatch : newCollection.values()){
	   			system.debug('!!!!!!!!!!!!!! Processing OVO ID !!!!!!!!!!!!!  '+ contactMatch.OVOCustomerID__c);
		   		if(!existingCollection.containsKey(contactMatch.OVOCustomerID__c)){
		   			system.debug('!!!!!!!!!!!!!! Match Not Found So Will Add For Insert !!!!!!!!!!!!!');
		   			contactstoInsert.add(contactMatch);
		   		}
	   		}
	   	}
	   	
	   	insert contactstoInsert;

	   	return newCollection;

	}

}