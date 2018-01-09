merging
executeMergeOfCommit: aCommit withMerger: merger

	merger hasConflicts ifTrue: [ | merged |
		"Abort merge and signal for manual merge. 
		Index is not saved and repository will be discarded, 
		so no further action is needed to abort the merge"
		
		merged := ((MCMergeResolutionRequest new merger: merger)
			signal: 'Merging ', aCommit id asString).
		
		merged ifFalse: [ IceMergeAborted signal ].
	].

	self workingCopy loadChangesFromMCPatch: merger