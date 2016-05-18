*Iceberg-Core
iceClass
	^ self definition isClassDefinition
		ifTrue: [ 
			"I am a class removal, so my class does not exist anymore."
			IceRemovedClassReference for: self definition.
		]
		ifFalse: [ super iceClass ]