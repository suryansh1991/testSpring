public without sharing class ContactTriggerHelper {
    
    
    public static void afterInsert(List<Contact> newContacts){
    	
    	updateCount(newContacts);
    }
    
    public static void afterDelete(List<Contact> oldContactList){
    	
    	
    	updateCount(oldContactList);
    }
    
    private static void updateCount(List<Contact> newContacts){
    	
    	Set<Id> accountIds = new Set<Id>();
    	
    	for(Contact contactObj : newContacts){
    			
    		accountIds.add(contactObj.accountId);	
    	}
    	
    	List<Account> accountlist = [SELECT Id, No_of_Contact__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds ];
    	
    	
    	for( Account accountObj : accountlist ){
    		
    		Integer size = accountObj.Contacts.size() == null ? 0 : accountObj.Contacts.size(); 
    		
    		accountObj.No_of_Contact__c = size;
    	}
    	
    	update accountlist;
    	
    }
}