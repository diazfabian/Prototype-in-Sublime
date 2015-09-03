@isTest
private class TestMoveTicketFromProductoToSprint {
	
    static testMethod void AddTickets() {
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	Test.startTest();
    	MoveTicket.AddTickets();
    	Test.stopTest();
        System.assertNotEquals(null, MoveTicket);
    }
    
    static testMethod void selectclick(){
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	PageReference ref = new PageReference('/apex/MoveTicket?id=a0561000000Jjjk'); 
    	Test.startTest();
    	Test.setCurrentPage(ref); 
    	Test.stopTest();
    }
    
    static testMethod void unselectclick(){
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	PageReference ref = new PageReference('/apex/MoveTicket?id=a0561000000Jjjk'); 
    	Test.startTest();
    	Test.setCurrentPage(ref); 
    	Test.stopTest();
    }
    
    static testMethod void getunSelectedValues(){
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	Test.startTest();
    	List<SelectOption> unSelectedValues = MoveTicket.getunSelectedValues();
    	Test.stopTest();
    	System.assertNotEquals(null, unSelectedValues);
    }
    
    static testMethod void getSelectedValues(){
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	Test.startTest();
    	List<SelectOption> SelectedValues = MoveTicket.getSelectedValues();
    	Test.stopTest();
    	System.assertNotEquals(null, SelectedValues);
    }
    
    static testMethod void ButtonActionSave() {
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	Test.startTest();
    	MoveTicket.ButtonActionSave();
    	Test.stopTest();
        System.assertNotEquals(null, MoveTicket);
    }
        
    static testMethod void ticketsOld() {
        MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
        Test.startTest();
        List<Tickets__c> ticketsOld = MoveTicket.ticketsOld('Carro');
        Test.stopTest();
        System.assertNotEquals(null, ticketsOld);
    }
    
    static testMethod void ticketsNew(){
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	List<Tickets__c> ListTicket = new List<Tickets__c>();
    	ListTicket = [SELECT Backlog__c,CreatedById,Description__c,Id,Name,Sort_order__c,Status__c,Story_Point__c,Type_Of_Ticket__c 
                      FROM Tickets__c 
                      WHERE Name = 'Carro'];
      	Test.startTest();
      	List<Tickets__c> TestListNew = MoveTicket.ticketsNew(ListTicket);
      	Test.stopTest();
      	System.assertNotEquals(null, TestListNew);
    }
    
    static testMethod void getfieldstart(){
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	Test.startTest();
    	Boolean getfieldstart = MoveTicket.getfieldstart();
    	Test.stopTest();
    	System.assertNotEquals(null, getfieldstart);
    }
    
    static testMethod void getfieldstarttwo(){
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	Test.startTest();
    	Boolean getfieldstart = MoveTicket.getfieldstart();
    	Test.stopTest();
    	System.assertNotEquals(null, getfieldstart);
    }
    
    static testMethod void DeleteUpdateTicket(){
    	MoveTicketFromProductToSprint MoveTicket = new MoveTicketFromProductToSprint();
    	List<Tickets__c> ListOld = new List<Tickets__c>();
    	ListOld = [SELECT Backlog__c,CreatedById,Description__c,Id,Name,Sort_order__c,Status__c,Story_Point__c,Type_Of_Ticket__c 
                   FROM Tickets__c 
                   WHERE Name = 'Carro'];
       	List<Tickets__c> ListNew = new List<Tickets__c>();
       	Tickets__c ticket = new Tickets__c();
        ticket.Backlog__c = 'a0561000000JkS2';
        ticket.Name = 'Carro';
        ticket.Sort_order__c = 0;
        ticket.Status__c = 'Done';
        ticket.Story_Point__c = 7.0;
        ticket.Type_Of_Ticket__c = 'Other Task';
        ticket.Description__c = 'Pintar Carro';
        ListNew.add(ticket);
        Test.startTest();
        MoveTicket.DeleteUpdateTicket(ListOld, ListNew);
        Test.stopTest();
        System.assertNotEquals(null, MoveTicket);
    }
}