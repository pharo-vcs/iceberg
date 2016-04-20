querying
currentBranchName
	^ (self gitCommand: #('symbolic-ref' '--short' 'HEAD')) trim
