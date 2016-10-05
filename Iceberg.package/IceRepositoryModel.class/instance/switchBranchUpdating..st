actions
switchBranchUpdating: presentation
	| branches selection | 
	branches := self repository branchesForCheckout.
	selection := IceTool uiManager
		chooseFrom: (branches collect: #displayName)
		values: branches
		message: 'Select the new branch you want to switch to:' 
		title: 'Checkout branch'.

	selection ifNotNil: [ 
		self repository checkoutBranch: selection simpleName.
		presentation pane browser update. 
	]
