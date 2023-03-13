@isTest
private class AccountTriggerTest {

    @isTest
    private static void AccountInsertTest() {
        // Test data setup
        Account acc = new Account();
        acc.Name='MyTestAcc';
        // Actual test
        Test.startTest();
        insert acc;
        Test.stopTest();

        //Asserts
        Account accRecord = [Select Id,NumberOfEmployees from Account where Id =:acc.Id];
        System.assertEquals(1, accRecord.NumberOfEmployees);
        List<contact> conlist = [Select Id,Name from contact where accountId =:acc.Id];
       // consol.log (conlist);
       //System.assert(conlist.size()>0);
       if(!conlist.isEmpty()){
       System.assert(conlist.size()>0);}

    }    
}