merging
mergeStateWith: anIceNotFetchedPackage 
	
	self assert: commit == anIceNotFetchedPackage currentCommit.
	
	^ self