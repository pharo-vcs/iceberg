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

{ #category : #accessing }
IceClassDefinition >> basicName [
	^ name
]

{ #category : #accessing }
IceClassDefinition >> contents [
	mcDefinition ifNil: [ ^ '' ].
	^ self isMeta
		ifFalse: [ mcDefinition fullDefinitionString ]
		ifTrue: [ mcDefinition classDefinitionString ]
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
		
	"The patcher is storing the definitions by name of the class only.
	We need to check it also if the original definition is the one we have here.
	If it is, we can replace it in the patch.
	But if it is not, we should not replace. If we replace it we will overwrite
	the changes already in the patcher"
		aMCPatcher definitions definitionLike: self asMCDefinition 
			ifPresent: [ :found |
				found = self asMCDefinition 
				ifTrue: [
					aMCPatcher
						modifyDefinition: self asMCDefinition
						to: self asMCDefinitionWithoutMetaSide]] 
			ifAbsent: [].
		^ self ].
	
	aMCPatcher removeDefinition: self asMCDefinition 
]
