executing
execute
	"at begining of this, there is a possibility that imageCommit needs to be 'fixed' to use."
	| commitToAdvance |
	mergeCommit validateCanMerge.
	self isAlreadyMerged ifTrue: [ ^ self ].

	" 1 - Merge changes.
	If the image and merge commit are the same, and the headCommit is their ancestor, we should do nothing.
	Otherwise, we should merge the two commits we have, discerning well which is the left and which is the right commit." 
	self resolveConflicts.
	commitToAdvance := self updateHead.
	
	self updateWorkingCopy.
	
	^ commitToAdvance