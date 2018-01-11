merging
executeMergeOfCommit: aCommit withMerger: merger

	merger hasConflicts ifTrue: [ | resolved |
		"Abort merge and signal for manual merge. 
		Index is not saved and repository will be discarded, 
		so no further action is needed to abort the merge"
		
		resolved := ((MCMergeResolutionRequest new merger: merger)
			signal: 'Merging ', aCommit id asString).
		
		resolved ifFalse: [ IceMergeAborted signal ].
	].

	self workingCopy loadChangesFromMCPatch: merger.