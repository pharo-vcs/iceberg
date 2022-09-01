"
I represent a trait read from an Iceberg repository, either from a commit or from the working directory in disk.

My contents is the trait definition.

See my superclasses for more information.
"
Class {
	#name : #IceTraitDefinition,
	#superclass : #IceMethodContainerDefinition,
	#category : #'Iceberg-Changes'
}

{ #category : #comparing }
IceTraitDefinition >> = anotherDefinition [
	
	^ super = anotherDefinition
		and: [ mcDefinition = anotherDefinition asMCDefinition ]
]

{ #category : #visiting }
IceTraitDefinition >> accept: aVisitor [
	
	^ aVisitor visitTraitDefinition: self
]

{ #category : #patching }
IceTraitDefinition >> addModification: anIceModification toPatcher: aMCPatcher [

	"If the new definition has no class instance vaiables, we remove the meta side variables, and apply the new changes to the patcher "
	(self isMeta and: [ mcDefinition isNil and: [ anIceModification rightDefinition asMCDefinition isNotNil ] ]) 
		ifTrue: [ | defModification |
			defModification := anIceModification rightDefinition asMCDefinition deepCopy.
			defModification removeMetaSideVariables.
			aMCPatcher
				modifyDefinition: anIceModification rightDefinition asMCDefinition
				to: defModification.
			^ self ].

	"We should not handle metaclasses if their mcDefinition is nil.
	They should be added automatically when added the instance side."
	(self isMeta and: [ mcDefinition isNil ]) ifTrue: [ ^ self ].

	aMCPatcher
		modifyDefinition: anIceModification rightDefinition asMCDefinition
		to: anIceModification leftDefinition asMCDefinition
]

{ #category : #patching }
IceTraitDefinition >> addToPatcher: aMCPatcher [ 
	
	"We should not handle metaclasses if their mcDefinition is nil.
	They should be added automatically when added the instance side."
	(self isMeta and: [ mcDefinition isNil ])
		ifTrue: [ ^ self ].

	"We should only be in this case if there is not instace-side changes."
	aMCPatcher addDefinition: self asMCDefinition
]

{ #category : #testing }
IceTraitDefinition >> isTraitDefinition [

	^ true
]

{ #category : #accessing }
IceTraitDefinition >> name [
	^ name , (isMeta ifTrue: [ ' classTrait' ] ifFalse: [ '' ])
]

{ #category : #patching }
IceTraitDefinition >> removeFromPatcher: aMCPatcher [ 
	
	"We should not handle metaclasses. They will be added automatically when added the instance side"
	self isMeta ifTrue: [ ^ self ].
	
	aMCPatcher removeDefinition: self asMCDefinition
]
