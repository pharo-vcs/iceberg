"
I represent a class read from an Iceberg repository, either from a commit or from the working directory in disk.

My contents is the class definition code.

See my superclasses for more information.
"
Class {
	#name : #IceClassDefinition,
	#superclass : #IceMethodContainerDefinition,
	#category : #'Iceberg-Changes'
}

{ #category : #visiting }
IceClassDefinition >> accept: aVisitor [ 
	
	^ aVisitor visitClassDefinition: self
]

{ #category : #patching }
IceClassDefinition >> addModification: anIceModification toPatcher: aMCPatcher [ 
	
	"If we are replacing an existing class, we need to handle the case. 
	For example, removing the last instance variable. 
	We need to remove the existing definition (empty class instance variables are not saved)."
	| defModification |
	
	"If the new definition has no class instance vaiables, we remove the meta side variables, and apply the new changes to the patcher "
	(self isMeta and: [ mcDefinition isNil and: [ anIceModification rightDefinition asMCDefinition isNotNil ] ])
		ifTrue: [ 
			defModification := anIceModification rightDefinition asMCDefinition deepCopy.
			defModification removeMetaSideVariables.
			aMCPatcher
				modifyDefinition: anIceModification rightDefinition asMCDefinition
				to: defModification.
				^ self].

	"We should not handle metaclasses if their mcDefinition is nil.
	They should be added automatically when added the instance side."
	(self isMeta and: [ mcDefinition isNil ])
		ifTrue: [ ^ self ].
	
	aMCPatcher
		modifyDefinition: anIceModification rightDefinition asMCDefinition
		to: anIceModification leftDefinition asMCDefinition
]

{ #category : #patching }
IceClassDefinition >> addToPatcher: aMCPatcher [ 
	
	"We should not handle metaclasses if their mcDefinition is nil.
	They should be added automatically when added the instance side."
	(self isMeta and: [ mcDefinition isNil ])
		ifTrue: [ ^ self ].
	
	"We should only be in this case if there is not instace-side changes."
	aMCPatcher addDefinition: self asMCDefinition
]

{ #category : #converting }
IceClassDefinition >> asMCDefinitionWithoutMetaSide [
	
	^ mcDefinition deepCopy removeMetaSideVariables

]

{ #category : #testing }
IceClassDefinition >> isClassDefinition [
	
	^ true
]

{ #category : #patching }
IceClassDefinition >> removeFromPatcher: aMCPatcher [

	"If the meta side is removed, we should modify the class definition to not include the meta-parts such as class-instance-variables"

	self asMCDefinition ifNil: [ ^ self ].

	isMeta ifTrue: [ 
		^ aMCPatcher
			  modifyDefinition: self asMCDefinition
			  to: self asMCDefinitionWithoutMetaSide ].

	aMCPatcher removeDefinition: self asMCDefinition
]
