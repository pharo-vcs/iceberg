execute
execute
	| commit |
	commit := self repository headCommit.
	commit merge.
	(self repository workingCopy referenceCommit = commit)
		ifTrue: [ self beSuccess ]