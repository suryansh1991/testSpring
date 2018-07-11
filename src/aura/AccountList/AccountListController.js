({
	doInit : function(component, event, helper) {
        
        console.log(component);
        console.log(event);
        console.log(helper);
		helper.getAccountList(component);
	}
})