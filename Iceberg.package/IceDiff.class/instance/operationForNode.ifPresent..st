private-building
operationForNode: aNode ifPresent: aBlock
	
	^ operations at: aNode description ifPresent: aBlock