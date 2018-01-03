execute
execute
	| commit |
	commit := self repository headCommit.
	commit mergeIntoWorkingCopy.
	(self repository workingCopy referenceCommit = commit)
		ifTrue: [ self beSuccess ]