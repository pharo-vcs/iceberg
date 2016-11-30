querying
currentHead
	^ (self command: 'symbolic-ref --short -q HEAD') trim