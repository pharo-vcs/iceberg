Class {
	#name : 'IceRingWorkingCopyChangerVisitor',
	#superclass : 'IceTreeVisitor',
	#instVars : [
		'workingCopy'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'instance creation' }
IceRingWorkingCopyChangerVisitor class >> on: anIceRingWorkingCopy [
	^ self new
		workingCopy: anIceRingWorkingCopy;
		yourself
]

{ #category : 'accessing' }
IceRingWorkingCopyChangerVisitor >> environment [

	^ self workingCopy environment
]

{ #category : 'accessing' }
IceRingWorkingCopyChangerVisitor >> packages [
	
	^ self workingCopy packages
]

{ #category : 'patching' }
IceRingWorkingCopyChangerVisitor >> removeClass: anIceClassDefinition [ 
	
	workingCopy removeClassNamed: anIceClassDefinition name
]

{ #category : 'operations' }
IceRingWorkingCopyChangerVisitor >> removeFile: anIceFileDefinition [ 
	
	(workingCopy repository location resolvePath: anIceFileDefinition path) 
		ensureDelete
]

{ #category : 'actions' }
IceRingWorkingCopyChangerVisitor >> removeFileReferenceInPath: aRelativePath [ 
	
	(workingCopy fileSystem resolve: aRelativePath) ensureDelete
]

{ #category : 'patching' }
IceRingWorkingCopyChangerVisitor >> removeMethod: anIceMethodDefinition [ 
	
	workingCopy removeMethod: anIceMethodDefinition selector fromClass: anIceMethodDefinition className.
]

{ #category : 'patching' }
IceRingWorkingCopyChangerVisitor >> removePackage: anIcePackageDefinition [
	
	workingCopy unloadPackage: anIcePackageDefinition
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitAddition: anIceAddition [ 
	anIceAddition definition accept: self.
	self visitChildrenOf: currentNode
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitClassDefinition: anIceClassDefinition [ 
	
	| package |
	anIceClassDefinition isMeta ifTrue: [ ^ self ].
	
	package := workingCopy packages detect: [ :icePackage | 
		anIceClassDefinition asMCDefinition category beginsWith: icePackage name ].
	workingCopy
		createClass: anIceClassDefinition name
		inPackage: package name
		with: [ :class | 
			class superclass name: anIceClassDefinition asMCDefinition superclassName.
			class instanceVariables: anIceClassDefinition asMCDefinition instVarNames ].
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitDirectoryDefinition: anIceDirectoryDefinition [ 
	
	"Do nothing for a ring working copy."
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitExtensionDefinition: anExtensionDefinition [ 
	
	workingCopy environment ask behaviorNamed: anExtensionDefinition name ifAbsent: [ self error: 'Not found' ].
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitFileNode: anIceFileDefinition [ 
	
	"Nothing, there are no files in the working copy"
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitMethodNode: anIceMethodDefinition [ 

	| isExtensionMethod |
	isExtensionMethod := anIceMethodDefinition protocol first = $*.
	isExtensionMethod
		ifTrue: [ 
			workingCopy
				createMethod: anIceMethodDefinition sourceCode
				extendingClass: anIceMethodDefinition className
				inPackage: anIceMethodDefinition protocol allButFirst ]
		ifFalse: [
			workingCopy
				createMethod: anIceMethodDefinition sourceCode
				inClass: anIceMethodDefinition className ]
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitModification: aModification [
	
	aModification leftDefinition accept: self.
	self visitChildrenOf: currentNode
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitNoModification: anIceNoModification [ 
	
	"Nothing with me. Just visit children"
	self visitChildrenOf: currentNode
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitNonConflictingOperation: anIceNonConflictingOperation [ 
	
	anIceNonConflictingOperation chosenOperation accept: self.
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitPackage: anIcePackageDefinition [

	| visitor package |
	package := self environment ensurePackageNamed: anIcePackageDefinition packageName.

	anIcePackageDefinition tagNames do: [ :tagName | package addClassTag: tagName ].

	visitor := IceRingWorkingCopyChangerVisitor on: self workingCopy.
	currentNode childrenDo: [ :each | each accept: visitor ]
]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitRemoval: anIceRemoval [ 
	
	anIceRemoval definition removeFrom: self.

]

{ #category : 'visiting' }
IceRingWorkingCopyChangerVisitor >> visitTraitDefinition: anIceTraitDefinition [ 
	|package|

	anIceTraitDefinition isMeta 
		ifTrue: [ ^ self ].
		
		package := workingCopy packages
		detect: [ :icePackage | 
			anIceTraitDefinition asMCDefinition category
				beginsWith: icePackage name ].
			
	workingCopy 
		createTrait: anIceTraitDefinition name
		inPackage: package name
	 	with: [ :trait |
			| composition transformations |
			composition := RGTraitComposition parent: trait.
			transformations := RGTraitCompositionVisitor new
				parse: anIceTraitDefinition asMCDefinition traitComposition 
				for: composition.
			trait traitComposition: composition.
			transformations do: [ :each | composition addTransformation: each ]  ]
]

{ #category : 'accessing' }
IceRingWorkingCopyChangerVisitor >> workingCopy [

	^ workingCopy
]

{ #category : 'accessing' }
IceRingWorkingCopyChangerVisitor >> workingCopy: anIceRingWorkingCopy [ 
	workingCopy := anIceRingWorkingCopy 
]
