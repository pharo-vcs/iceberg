private factory
newContextWithSelection: aBranchModel
	^ self newContext 
		branchModel: aBranchModel;
		yourself