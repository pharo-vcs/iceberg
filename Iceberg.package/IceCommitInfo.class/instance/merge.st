actions
merge
	| loader |
	((self repository loadedPackages collect: #workingCopy) anySatisfy: #modified)
		ifTrue: [ UIManager default deny: 'Please commit your local changes before merging.' ].

	"Todo: if merge is not a fast-forward we should allow the user to see the merge before creating a new commit"
	self repository backend merge: self id.
	self repository pull.
