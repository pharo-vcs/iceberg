private-packages
refreshPackages
	| commitPackages |
	commitPackages := self referenceCommit isCollection
		ifTrue: [ (self referenceCommit flatCollect: [ :each | each packages ]) asSet ]
		ifFalse: [ self referenceCommit project packages ].

	"remove packages that are not there anymore"
	(self packages \ commitPackages) do: [ :each | self basicRemovePackage: each ].
	"Add packages not already there"
	(commitPackages \ self packages) do: [ :each | self basicAddPackage: each ].
