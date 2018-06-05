private factory
createCheckoutBranchTypes
	| allTypes |

	"Collect types new+local+remotes"	
	allTypes :=  { 
		IceTipCheckoutNewBranchPanel on: self model. "New branch"
	 	(IceTipCheckoutBranchPanel on: self model) 
			title: 'Local';
			icon: (self iconNamed: #branch);
			yourself }, 
	(self model remoteModels collect: [ :each | 
		(IceTipCheckoutBranchPanel on: each)
			title: each name;
			icon: (self iconNamed: #remote);
			yourself ]),
	(self model entity pluginManager checkoutBranchPanelsOnModel: self model).
	
	"Doing this because I can trigger the accept inside the panels."
	allTypes do: [ :each | each onAccept: [ self window delete ] ].
	
	^ allTypes