"
I check that every libgit call should be wrapped with an error handler (IceLibgitRepository libgitErrorHandlerSelector).

Otherwise, libgit errors may be thrown to the user and produce ugly effects. E.g.,
	- Iceberg UI only manages Iceberg errors
	- Libgit errors are criptyc and can only be understood by reading the message text...
"
Class {
	#name : 'IceShouldHandleLibgitErrors',
	#superclass : 'ReAbstractRule',
	#category : 'Iceberg-ArchitecturalRules',
	#package : 'Iceberg-ArchitecturalRules'
}

{ #category : 'testing-interest' }
IceShouldHandleLibgitErrors class >> checksNode [

	^ true
]

{ #category : 'running' }
IceShouldHandleLibgitErrors >> check: aNode forCritiquesDo: aBlock [

	"Detect strange case where method node is nil"
	"Does not apply to defined accessors"
	(aNode methodNode notNil and: [ aNode methodNode pragmas anySatisfy: [ :pragma |
		pragma selector = IceLibgitRepository libgitRepositoryHandleAccessorPragmaSelector ]])
			ifTrue: [ ^ self ].

	"Only apply to 
		- reads to the handle variable
		- usages of defined accessors "
	((aNode isVariable and: [ aNode isRead and: [ aNode name = 'handle' ] ])
		or: [ aNode isMessage and: [ 
				(self libgitRepositoryHandleAccessorsForClass: aNode methodNode methodClass)
					anySatisfy: [ :accessor | accessor selector = aNode selector ] ] ])
		ifFalse: [ ^ self ].
	
	(aNode parents anySatisfy: [ :handleParent | 
		handleParent isBlock
			and: [ | blockParent | 
				blockParent := handleParent parent.
				blockParent isMessage and: [
					blockParent selector = IceLibgitRepository libgitErrorHandlerSelector ] ] ])
		ifFalse: [ aBlock cull: (self critiqueFor: aNode) ]
]

{ #category : 'accessing' }
IceShouldHandleLibgitErrors >> group [

	^ 'Architectural'
]

{ #category : 'accessing' }
IceShouldHandleLibgitErrors >> libgitRepositoryHandleAccessorsForClass: aClass [

	^ aClass allMethods
		select:
			[ :m | m pragmas anySatisfy: [ :p | p selector = IceLibgitRepository libgitRepositoryHandleAccessorPragmaSelector ] ]
]

{ #category : 'accessing' }
IceShouldHandleLibgitErrors >> name [

	^ 'Should manage errors when doing a libgit call'
]
