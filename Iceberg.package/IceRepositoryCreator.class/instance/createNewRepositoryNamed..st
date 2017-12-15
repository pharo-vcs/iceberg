actions
createNewRepositoryNamed: aString
	| locationToUse repository |
	
	self validate.

	locationToUse := self locationToUse.
	(locationToUse exists 
		and: [ locationToUse hasChildren ])
		ifTrue: [ IceError signal: ('{1} is not empty.' format: {locationToUse fullName}) ].
		
	locationToUse ensureCreateDirectory.
	self subdirectory  
		ifNotEmpty: [ (locationToUse / self subdirectory) ensureCreateDirectory ].

	repository := IceLibgitRepository new
		name: aString;
		location: locationToUse;
		subdirectory: self subdirectory;
		init;
		yourself.
		
	self addPropertiesFileTo: repository.

	^ repository