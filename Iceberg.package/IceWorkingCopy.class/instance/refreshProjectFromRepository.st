accessing
refreshProjectFromRepository

	| commitToCheck |
	commitToCheck := referenceCommit isCollection
		ifTrue: [ referenceCommit first ]
		ifFalse: [ referenceCommit ].

	properties := commitToCheck properties.

	project := commitToCheck project.
	project commitish: self.
	self refreshProject.
	^ project