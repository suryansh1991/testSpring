({
	getAccountList : function(component) {
        console.log(component);
		var action = component.get('c.getAccounts');
		
		console.log(action);
		
        action.setCallback(this,(function (response) {
            var state = response.getState();
            console.log( response.getReturnValue());
            $A.log(response);
            if (state === "SUCCESS") {
                component.set('v.accounts', response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        
        $A.enqueueAction(action);
	}
})