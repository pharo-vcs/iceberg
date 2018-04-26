testing
isCloneOfUrl: aString

	^ self isMissing not and: [ super isCloneOfUrl: aString ]