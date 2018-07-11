@isTest
private class ContactTriggerHelperTest {

    static testMethod void countUpdateTest() {
        
        //test data
        
        Account accountObj = new Account(Name = 'Test Account');
        
        insert accountObj;
        
        Contact contactObj = new Contact(FirstName = 'Test', LastName = 'Contact Last Name', AccountId = accountObj.Id);
        
        insert contactObj;
        
        Integer beforeDeleteCount = 0;
        Integer afterDeleteCount = 0;
        
        Test.startTest();
        
        List<Account> accountList = [SELECT Id, Name, No_of_Contact__c FROM Account];
        
        beforeDeleteCount = Integer.valueOf(accountList.get(0).No_of_Contact__c);
        
        delete contactObj;
        
        accountList = [SELECT Id, Name, No_of_Contact__c FROM Account];
        
        afterDeleteCount = Integer.valueOf(accountList.get(0).No_of_Contact__c);
        
        Test.stopTest();
        
        System.assertEquals(beforeDeleteCount, 1);
        System.assertEquals(afterDeleteCount, 0);
        
    }
}