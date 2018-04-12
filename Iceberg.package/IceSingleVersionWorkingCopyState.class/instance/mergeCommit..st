merging
mergeCommit: mergeCommit
	
	"Merge a commit in the current image, and commit the results of the merge in the current branch.
	
	This method requires to check several complex scenarios. Te
	"
	| imageCommit headCommit leftCommit commitToAdvance merge |
	

	"at begining of this, there is a possibility that imageCommit needs to be 'fixed' to use."
	imageCommit := self referenceCommit.
	imageCommit isUnknownCommit ifTrue: [ 
		imageCommit := imageCommit resolveCommitOnWorkingCopy: self repository workingCopy ].
	
	mergeCommit validateCanMerge.
	
	headCommit := self repository headCommit.	
	
	"We check which is the commit we have to mege mergeCommit against"
	leftCommit := imageCommit = mergeCommit
		ifTrue: [ headCommit ]
		ifFalse: [ imageCommit ].
	
	(mergeCommit isAncestorOf: leftCommit)
		ifTrue: [
			"The commit is already merged in the image and in the head commit.
			This means the selected commit is already in the history and there is nothing to do about it."
			^ self ].
	
	" 1 - Merge commits.
	If the image and merge commit are the same, and the headCommit is their ancestor, we should do nothing.
	Otherwise, we should merge the two commits we have, discerning well which is the left and which is the right commit."
	 (imageCommit = mergeCommit and: [ headCommit isAncestorOf: imageCommit ])
		ifTrue: [ merge := IceEmptyMerge new ]
		ifFalse: [
			merge := IceMerge from: leftCommit to: mergeCommit.
			merge hasConflicts ifTrue: [ | resolved |
				"Abort merge and signal for manual merge. 
				Index is not saved and repository will be discarded, 
				so no further action is needed to abort the merge"
				resolved := IceMergeResolutionRequest new
					merger: merge;
					signal: 'Merging ', mergeCommit description, ' into ', leftCommit description.
				resolved ifFalse: [ IceMergeAborted signal ].
				merge ] ].

	" 2 - Update HEAD.
	If the merged commits are from diverging branches, generate a merge commit.
	Then, adopt the commit in
	 - the working copy
	 - the current branch"
	commitToAdvance := (headCommit isAncestorOf: mergeCommit)
		ifTrue: [ 
			"Fast-forward"
			self workingCopy adoptCommit: mergeCommit.
			mergeCommit ]
		ifFalse: [
			"Merge case"
			self workingCopy setMergeStateBetweenCommits: { leftCommit . mergeCommit }.
			self workingCopy commitChanges: merge withMessage: 'Merge ', mergeCommit id asString ].
	self repository branch commit: commitToAdvance.
	
	" 3 - Load changes in the image.
	In case the commit was already in the history, merge is a null object with no changes"
	self workingCopy loadChangesInWorkingCopy: merge mergeTree.
	self workingCopy refreshDirtyPackages.
	^ commitToAdvance