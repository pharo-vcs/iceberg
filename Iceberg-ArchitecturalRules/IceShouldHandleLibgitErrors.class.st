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

{ #category : 'accessing' }
IceShouldHandleLibgitErrors class >> groupSelector [

	^ #architecturalGroup
]

{ #category : 'accessing' }
IceShouldHandleLibgitErrors class >> ruleName [

	^ 'Should manage errors when doing a libgit call'
]

{ #category : 'running' }
IceShouldHandleLibgitErrors >> check: aNode forCritiquesDo: aBlock [
	"Detect strange case where method node is nil"

	"Does not apply to defined accessors"

	(aNode methodNode isNotNil and: [ aNode methodNode pragmas anySatisfy: [ :pragma | pragma selector = IceLibgitRepository libgitRepositoryHandleAccessorPragmaSelector ] ]) ifTrue: [ ^ self ].

	"Only apply to 
		- reads to the handle variable
		- usages of defined accessors "
	((aNode isVariable and: [ aNode isRead and: [ aNode name = 'handle' ] ]) or: [
		 aNode isMessage and: [ self isLibgitRepositoryHandleAccessorSend: aNode ] ]) ifFalse: [ ^ self ].

	(aNode allParents anySatisfy: [ :handleParent |
		 handleParent isBlock and: [
			 | blockParent |
			 blockParent := handleParent parent.
			 blockParent isMessage and: [ blockParent selector = IceLibgitRepository libgitErrorHandlerSelector ] ] ]) ifFalse: [ aBlock cull: (self critiqueFor: aNode) ]
]

{ #category : 'testing' }
IceShouldHandleLibgitErrors >> isLibgitRepositoryHandleAccessorSend: aMessageNode [
	"A snippet parsed outside of a class, such as a playground expression, has no method class and no accessor."

	| methodClass |
	methodClass := aMessageNode methodNode ifNotNil: [ :methodNode | methodNode methodClass ].
	methodClass ifNil: [ ^ false ].
	^ (self libgitRepositoryHandleAccessorsForClass: methodClass) anySatisfy: [ :accessor | accessor selector = aMessageNode selector ]
]

{ #category : 'accessing' }
IceShouldHandleLibgitErrors >> libgitRepositoryHandleAccessorsForClass: aClass [

	^ aClass allMethods
		select:
			[ :m | m pragmas anySatisfy: [ :p | p selector = IceLibgitRepository libgitRepositoryHandleAccessorPragmaSelector ] ]
]
