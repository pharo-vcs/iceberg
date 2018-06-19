accessing
referenceCommit: aCommit

	self referenceCommit = aCommit
		ifTrue: [ ^ self ].

	referenceCommit := aCommit.
	self refreshProjectFromRepository