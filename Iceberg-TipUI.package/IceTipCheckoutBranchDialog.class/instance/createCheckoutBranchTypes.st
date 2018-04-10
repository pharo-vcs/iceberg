private factory
createCheckoutBranchTypes
	| allTypes |

	"Collect types new+local+remotes"	
	allTypes :=  { 
		IceTipCheckoutNewBranchPanel on: self model. "New branch"
	 	(IceTipCheckoutBranchPanel on: self model) 
			title: 'Local';
			icon: #branch asIcon;
			yourself }, 
	(self model remoteModels collect: [ :each | 
		(IceTipCheckoutBranchPanel on: each)
			title: each name;
			icon: #remote asIcon;
			yourself ]).
	
	"Doing this because I can trigger the accept inside the panels."
	allTypes do: [ :each | each onAccept: [ self window delete ] ].
	
	^ allTypes