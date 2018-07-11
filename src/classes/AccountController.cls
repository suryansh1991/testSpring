public class AccountController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
    	
    	List<Account> accountsList = [SELECT Id, Name, Industry, Type, NumberOfEmployees, Phone FROM Account ORDER BY createdDate DESC LIMIT 10];
    	
    	return accountsList;
    }
}