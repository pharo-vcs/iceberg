initialization
initializePackagesFromRepository
	
	| commitToAdopt |
	commitToAdopt := self repository headCommit.
	commitToAdopt packages do: [ :each | self basicAddPackage: each ].
	self adoptCommit: commitToAdopt.