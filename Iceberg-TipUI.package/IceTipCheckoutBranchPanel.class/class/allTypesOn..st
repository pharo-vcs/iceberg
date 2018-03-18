accessing
allTypesOn: aModel
	^ { 
		IceTipCheckoutNewBranchPanel on: aModel. "New branch"
	 	(IceTipCheckoutLocalBranchPanel on: aModel) 
			title: 'Local branches';
			icon: #branch asIcon;
			yourself }, 
	(aModel remoteModels collect: [ :each | 
		(IceTipCheckoutLocalBranchPanel on: each)
			title: each name;
			icon: #remote asIcon;
			yourself ])