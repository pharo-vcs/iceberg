instance creation
for: anIceRepository withVersion: aString 

	| projectVersion |
		
	projectVersion := aString isEmptyOrNil 
		ifTrue: [ anIceRepository head description ]
		ifFalse: [ aString ].

	^ self new 
		repository: anIceRepository;
		projectVersion: projectVersion;
		yourself