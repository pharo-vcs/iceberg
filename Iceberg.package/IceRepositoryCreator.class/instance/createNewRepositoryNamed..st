actions
createNewRepositoryNamed: aString
	| backend locationToUse repository |
	
	self validate.

	locationToUse := self locationToUse.
	(locationToUse exists 
		and: [ locationToUse hasChildren ])
		ifTrue: [ IceError signal: ('{1} is not empty.' format: {locationToUse fullName}) ].
		
	locationToUse ensureCreateDirectory.
	self subdirectory  
		ifNotEmpty: [ (locationToUse / self subdirectory) ensureCreateDirectory ].
	backend := self storageClass 
		newRepositoryAt: locationToUse
		subdirectory: self subdirectory.
	backend init.

	repository := (IceRepository backend: backend)
		name: aString;
		yourself.
		
	self useTonel ifTrue: [ self addPropertiesFileTo: repository ].

	^ repository