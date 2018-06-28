accessing
refreshProjectFromRepository

	project := (referenceCommit isCollection
		ifTrue: [ referenceCommit first ]
		ifFalse: [ referenceCommit ]) basicProject.
	project commitish: self.
	self refreshProject.
	^ project