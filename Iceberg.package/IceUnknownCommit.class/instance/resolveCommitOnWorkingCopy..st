as yet unclassified
resolveCommitOnWorkingCopy: aWorkingCopy
	"This commit is a temporal commit that needs to be resolved eventually. 
	 Attemp to solve it by looking for it... if user made a fetch it will work."
	| commit |
	
	commit := aWorkingCopy repository 
		lookupCommit: self id 
		ifAbsent: [ 
			"Still not found, abort"
			^ self ].	
			
	aWorkingCopy referenceCommit: commit.
	^ commit