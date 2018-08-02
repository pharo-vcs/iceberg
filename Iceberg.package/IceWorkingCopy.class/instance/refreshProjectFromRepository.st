accessing
refreshProjectFromRepository

	| commitToCheck maybeProject |
	commitToCheck := referenceCommit isCollection
		ifTrue: [ referenceCommit first ]
		ifFalse: [ referenceCommit ].

	maybeProject := commitToCheck project.
	maybeProject isInvalid ifFalse: [ 
		self basicSetProject: maybeProject ].
	
	properties := commitToCheck properties asBornProperties.
	self refreshProject.
	^ project