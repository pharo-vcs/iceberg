querying
currentBranch
	^ (self command: 'symbolic-ref --short -q HEAD') trim 
