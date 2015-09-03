public  class ticketsController {
    
    public Tickets__c objTickets {get;set;}
    public ticketsController(ApexPages.StandardController controller) {
        objTickets = new Tickets__c();
        getLoadValuesPicklist();
    }
    
    public List<SelectOption> getLoadValuesPicklist(){        
        List <SelectOption> statusOptions = new List <SelectOption> ();
        Id profileId=userinfo.getProfileId();
        System.assert(profileId!=null);
        if(profileId=='00e61000000YIrqAAG'){
            statusOptions.add(new SelectOption('Pending Estimation','Pending Estimation'));
            statusOptions.add(new SelectOption('Estimated','Estimated'));
            statusOptions.add(new SelectOption('Dev In Progress','Dev In Progress'));
            statusOptions.add(new SelectOption('Pending QA','Pending QA'));
            statusOptions.add(new SelectOption('QA In Progress','QA In Progress'));
            statusOptions.add(new SelectOption('Pending Demo','Pending Demo'));
            statusOptions.add(new SelectOption('Blocked','Blocked'));
            statusOptions.add(new SelectOption('Rejected','Rejected'));          
        }
        if(profileId=='00e61000000WWGXAA4'){
            statusOptions.add(new SelectOption('Pending Demo','Pending Demo'));
            statusOptions.add(new SelectOption('Rejected','Rejected'));
            statusOptions.add(new SelectOption('Done','Done'));
        }
        if(profileId=='00e61000000WWvNAAW' || profileId=='00e61000000WNKeAAO'){
            Schema.DescribeFieldResult status = Tickets__c.Status__c.getDescribe();
            for (Schema.PickListEntry f : status.getPicklistValues()){
            statusOptions.add(new SelectOption(f.getLabel(), f.getLabel()));    
            }                  
        }
        return statusOptions;        
    }  
}