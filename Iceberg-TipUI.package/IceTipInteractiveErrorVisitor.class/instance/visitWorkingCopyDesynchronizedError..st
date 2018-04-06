visiting
visitWorkingCopyDesynchronizedError: anError
	| solveStrategy command |
	solveStrategy := UIManager default 
		chooseFrom: #(
			'Create new branch and commit' 
			'Merge local copy into image and commit')		
		values: { 
			IceCreateBranchCommand. 
			IceMergeWorkingCopyCommand }
		message: 'Your loaded code is not synchronized with the local sources in your repository. 
You need to solve this problem before you continue, please choose one of the strategies below.'
		title: 'Loaded code out of sync!'.
	solveStrategy ifNil: [ ^ self ].
	(command := solveStrategy new) 
		repository: self repository;
		execute.
	command isSuccess 
		ifTrue: [ anError retry ]