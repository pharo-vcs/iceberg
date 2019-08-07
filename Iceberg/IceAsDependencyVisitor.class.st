Class {
	#name : #IceAsDependencyVisitor,
	#superclass : #Object,
	#instVars : [
		'currentNode',
		'cherrypicker'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #accessing }
IceAsDependencyVisitor >> cherrypicker: anIceCherrypicker [ 
	cherrypicker := anIceCherrypicker
]

{ #category : #visiting }
IceAsDependencyVisitor >> visitClassDefinition: anIceClassDefinition [
	^ IceClassDependency new
		definition: anIceClassDefinition;
		cherrypicker: cherrypicker ;
		yourself
]

{ #category : #visiting }
IceAsDependencyVisitor >> visitExtensionDefinition: anIceExtensionDefinition [
	^ IceExtendedClassDependency new
		definition: anIceExtensionDefinition;
		cherrypicker: cherrypicker;
		yourself
]

{ #category : #visiting }
IceAsDependencyVisitor >> visitMethodNode: anIceMethodDefinition [ 
	^ IceMethodDependency new
	definition: anIceMethodDefinition ;
	cherrypicker: cherrypicker ;
	yourself 
]

{ #category : #'as yet unclassified' }
IceAsDependencyVisitor >> visitPackage: anIcePackageDefinition [
	^ IcePackageDependency new
		definition: anIcePackageDefinition;
		cherrypicker: cherrypicker;
		yourself
]

{ #category : #visiting }
IceAsDependencyVisitor >> visitTraitDefinition: anIceTraitDefinition [
	^ IceTraitDependency new
		definition: anIceTraitDefinition;
		cherrypicker: cherrypicker;
		yourself
]

{ #category : #visiting }
IceAsDependencyVisitor >> visitTreeNode: anIceNode [
	^ anIceNode value definition accept: self
]
