accessing
refreshProjectFromRepository

	project := (referenceCommit isCollection
		ifTrue: [ referenceCommit first ]
		ifFalse: [ referenceCommit ]) basicProject.
	self refreshProject.
	^ project