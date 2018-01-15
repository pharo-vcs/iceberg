events
fetchFinished
	
	"We check if the repository has a commit with the unknown commit id.
	In such a case, we replace the instances.
	Otherwise, do noth"
	
	| newCommit |
	newCommit := repository
		lookupCommit: commit id
		ifAbsent: [ ^ self].
	
	commit becomeForward: newCommit