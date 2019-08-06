Class {
	#name : #IceAsDependencyVisitor,
	#superclass : #Object,
	#instVars : [
		'currentNode'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #visiting }
IceAsDependencyVisitor >> visitClassDefinition: anIceClassDefinition [ 
^ IceClassDependency new
		definition: anIceClassDefinition;
		yourself
]

{ #category : #visiting }
IceAsDependencyVisitor >> visitExtensionDefinition: anIceExtensionDefinition [ 
	^ IceExtendedClassDependency new
				definition: anIceExtensionDefinition ;
				yourself
]

{ #category : #'as yet unclassified' }
IceAsDependencyVisitor >> visitPackage: anIcePackageDefinition [ 
	
	^ IcePackageDependency new
				definition: anIcePackageDefinition;
				yourself
]

{ #category : #visiting }
IceAsDependencyVisitor >> visitTraitDefinition: anIceTraitDefinition [ 
^ IceTraitDependency new
		definition: anIceTraitDefinition;
		yourself
]

{ #category : #visiting }
IceAsDependencyVisitor >> visitTreeNode: anIceNode [
	^ anIceNode value definition accept: self
]
