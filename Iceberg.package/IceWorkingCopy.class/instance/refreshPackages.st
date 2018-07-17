private-packages
refreshPackages
	| commitPackages |
	commitPackages := self referenceCommit isCollection
		ifTrue: [ 1halt. ]
		ifFalse: [ self project packages ].

	"remove packages that are not there anymore"
	(self packages \ commitPackages) do: [ :each | self basicRemovePackage: each ].
	"Add packages not already there"
	(commitPackages \ self packages) do: [ :each | self basicAddPackage: each ].
