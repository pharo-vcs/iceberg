querying
currentBranchName
	^ (self command: 'symbolic-ref --short HEAD') trim
