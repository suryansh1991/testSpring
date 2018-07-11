@isTest
private class AccountControllerTest {

    static testMethod void getAccountsTest() {
		
		Account accountObj = new Account(Name = 'Test Account name');
		insert accountObj;
		
		List<Account> accountList = new List<Account>();  
		
		Test.startTest();
			accountList = AccountController.getAccounts();
		Test.stopTest();
		
		system.assertEquals(accountObj.Name, accountList.get(0).Name);
    }
}