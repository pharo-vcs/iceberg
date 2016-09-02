utilities
switchBranchOf: anIceRepository
	| branches selection | 
	branches := anIceRepository branchesForCheckout.
	selection := self uiManager
		chooseFrom: (branches collect: #displayName)
		values: branches
		message: 'Select the new branch you want to switch to:' 
		title: 'Checkout branch'.

	selection ifNotNil: [ anIceRepository checkoutBranch: selection simpleName ]
