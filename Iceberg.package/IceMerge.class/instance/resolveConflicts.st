executing
resolveConflicts
	self hasConflicts
		ifTrue: [ | resolved |
			"Abort merge and signal for manual merge. 
				Index is not saved and repository will be discarded, 
				so no further action is needed to abort the merge"
			resolved := IceMergeResolutionRequest new
				merger: self;
				signal: 'Merging ' , mergeCommit description , ' into ' , self leftCommit description.
			resolved
				ifFalse: [ IceMergeAborted signal ] ]