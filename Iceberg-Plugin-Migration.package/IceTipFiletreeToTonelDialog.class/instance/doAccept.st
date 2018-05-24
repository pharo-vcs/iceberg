actions
doAccept
	| oldBranch newBranch |

	oldBranch := self repository branch.
	self migrateSources.
	newBranch := self repository branch.	
	self mergeWithMasterCheckbox state ifTrue: [ 
		oldBranch checkout: IceCheckoutDoNotLoadPackages new.
		newBranch merge ]