@isTest
public class TestTriggerProject {
	static testmethod void testInsertProject(){
		Projects__c project = new Projects__c (Name = 'Test'); 
        Test.startTest();
		insert project;
        Test.stopTest();
		list <Backlog__c> listBacklog = [SELECT Id,Name,Project__c FROM Backlog__c WHERE Project__c = :project.Id];  
		for (Backlog__c b:  listBacklog) {
		    If (b.Project__c == project.Id){
		       System.assertEquals(b.Name, 'Product Backlog '+ project.Name); 
		    }
		}   
	}   
}