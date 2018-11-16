execution
execute
	| oldBranch newBranch |

	oldBranch := self repository branch.
	self migrateSources.
	newBranch := self repository branch.	
	self isMergeWithCurrentBranch ifTrue: [
		oldBranch checkout: IceCheckoutDoNotLoadPackages new.
		newBranch merge ]