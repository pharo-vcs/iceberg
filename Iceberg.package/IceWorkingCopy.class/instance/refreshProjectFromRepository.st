accessing
refreshProjectFromRepository

	| commitToCheck maybeProject |
	commitToCheck := referenceCommit isCollection
		ifTrue: [ referenceCommit first ]
		ifFalse: [ referenceCommit ].

	maybeProject := commitToCheck project.
	maybeProject isInvalid ifTrue: [ 
		maybeProject := IceUnbornProject onCommitish: commitToCheck ].
	self basicSetProject: maybeProject.
	
	properties := commitToCheck properties asBornProperties.
	self refreshProject.
	^ project