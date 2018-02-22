merging
mergeCommit: aCommit
	
	| merger currentCommit newCommit diff changedPackages merge |
	
	currentCommit := self referenceCommit.
	
	(aCommit isAncestorOf: currentCommit)
		ifTrue: [
			"The commit is already merged"
			^ self ].

	merge := IceMerge from: self workingCopy to: aCommit.
	merge hasConflicts ifTrue: [ | resolved window mergeMorph |
		"Abort merge and signal for manual merge. 
		Index is not saved and repository will be discarded, 
		so no further action is needed to abort the merge"		

"		resolved := ((MCMergeResolutionRequest new merger: merge)
			signal: 'Merging ', aCommit id asString)."
		mergeMorph := (IceMergeMorph forMerger: merger).
		mergeMorph
			fromDescription: 'Working copy' translated;
			toDescription: aCommit id asString.
		window := mergeMorph newWindow
			title: 'Merging';
			yourself.
		UIManager default openModal: window.
		resolved := mergeMorph resolved.
		1halt.
		resolved ifFalse: [ IceMergeAborted signal ].
	].
1halt.
	"If we are here we can assume all conflicts were resolved either manually or automatically."
	self workingCopy loadChangesFromMCPatch: merger.

	(currentCommit isAncestorOf: aCommit) ifTrue: [
		"We can fast-forward"
		"Update current branch target commit"
		self repository branch commit: aCommit.
		self workingCopy adoptCommit: aCommit.
		^ aCommit ].

	1halt.
	"Otherwise, we enter in a merge case and we should create a merge commit either manually or automatically"
	self workingCopy setMergeStateBetweenCommits: { currentCommit . aCommit }.
	newCommit := self workingCopy commitWithMessage: 'Merge ', aCommit id asString.
	self repository branch commit: newCommit.
	^ newCommit