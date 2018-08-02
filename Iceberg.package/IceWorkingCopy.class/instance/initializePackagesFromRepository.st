initialization
initializePackagesFromRepository
	"If no reference commit was configured, we adopt the head commit"
	| commitToAdopt |
	commitToAdopt := referenceCommit isNoCommit
		ifTrue: [ self repository headCommit ]
		ifFalse: [ referenceCommit ].
	self adoptCommit: commitToAdopt.