accessing
refreshProjectFromRepository

	project := (referenceCommit isCollection
		ifTrue: [ referenceCommit first ]
		ifFalse: [ referenceCommit ]) project.
	self refreshProject.
	^ project