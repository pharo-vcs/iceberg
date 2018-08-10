actions
createNewRepositoryNamed: aString
	| locationToUse |
	
	self validate.

	locationToUse := self locationToUse.
	(locationToUse exists 
		and: [ locationToUse hasChildren ])
		ifTrue: [ IceError signal: ('{1} is not empty.' format: {locationToUse fullName}) ].
		
	locationToUse ensureCreateDirectory.
	self subdirectory  
		ifNotEmpty: [ (locationToUse resolve: self subdirectory) ensureCreateDirectory ].

	repository := IceLibgitRepository new
		name: aString;
		location: locationToUse;
		init;
		yourself.
	
	self addProjectFileTo: repository.
	self addPropertiesFileTo: repository.
	repository workingCopy refreshProject.

	^ repository