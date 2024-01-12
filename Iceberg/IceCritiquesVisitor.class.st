"
I am a tree visitor that returns a set of critics to the elements in the collection
"
Class {
	#name : 'IceCritiquesVisitor',
	#superclass : 'IceTreeVisitor',
	#instVars : [
		'critiques'
	],
	#category : 'Iceberg-Changes',
	#package : 'Iceberg',
	#tag : 'Changes'
}

{ #category : 'accessing' }
IceCritiquesVisitor >> critiques [
	^ critiques
]

{ #category : 'initialization' }
IceCritiquesVisitor >> initialize [

	super initialize.
	critiques := Set new
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitAddition: anIceAddition [ 
	
	^ anIceAddition definition accept: self
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitAll: aCollection [

	aCollection do: [ :each | each accept: self ]
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitClassDefinition: anIceClassDefinition [

	anIceClassDefinition canBeBrowsed ifTrue: [ 
		critiques addAll: anIceClassDefinition actualClass critiques ]
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitDirectoryDefinition: anIceDirectoryDefinition [ 
	"no critiques for directories"
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitExtensionDefinition: anIceExtension [ 
	"^ anIceExtension definition accept: self"
	| actualClass methods |
	actualClass := anIceExtension actualClass.
	methods := actualClass methodsInProtocol: '*', anIceExtension packageName.
	methods do: [ :method | critiques addAll: method critiques ].
	
	
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitFileNode: anIceFileDefinition [ 
	
	
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitMethodNode: anIceMethodDefinition [ 

	anIceMethodDefinition canBeBrowsed 
		ifTrue: [ critiques addAll: (anIceMethodDefinition contextClass >> anIceMethodDefinition name) critiques ]
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitModification: anIceModification [ 

	^ anIceModification definition accept: self
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitNoModification: anIceNoModification [ 
	
	"If there is no modification I don't generate critics for this node"
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitPackage: anIcePackageDefinition [

	| aPackage |
	aPackage := self packageOrganizer packageNamed: anIcePackageDefinition name ifAbsent: [ ^ self ].
	critiques addAll: aPackage critiques
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitRemoval: anIceRemoval [ 
	
	"We do nothing on removal"
]

{ #category : 'visiting' }
IceCritiquesVisitor >> visitTraitDefinition: anIceClassDefinition [

	anIceClassDefinition canBeBrowsed ifTrue: [ 
		critiques addAll: anIceClassDefinition actualClass critiques ]
]
