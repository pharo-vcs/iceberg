actions
doAccept
	| oldBranch newBranch |

	oldBranch := self repository branch.
	self migrateSources.
	newBranch := self repository branch.	
	oldBranch checkout: IceCheckoutDoNotLoadPackages new.
	self mergeWithMasterCheckbox state ifTrue: [ 
		newBranch merge ]