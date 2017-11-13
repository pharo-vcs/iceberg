private validating
validateCanPull
	self isModified 
		ifTrue: [ IceShouldCommitBeforePull signal ]