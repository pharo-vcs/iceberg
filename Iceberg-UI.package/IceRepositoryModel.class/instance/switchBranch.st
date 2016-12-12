actions
switchBranch
	| branches selection | 
	branches := self repository branchesForCheckout.
	selection := IceTool uiManager
		chooseFrom: (branches collect: #name)
		values: branches
		message: 'Select the new branch you want to switch to:' 
		title: 'Checkout branch'.

	selection ifNotNil: [ self repository checkoutBranch: selection name ]
