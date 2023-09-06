"
I represent a package inside the iceberg repository. How I am built depends on the repository format (e.g., tonel or filetree).

My contents are the tags defined in the package.

See my superclasses for more information.
"
Class {
	#name : #IcePackageDefinition,
	#superclass : #IceDefinition,
	#instVars : [
		'package',
		'path',
		'packageName',
		'tagNames'
	],
	#category : #'Iceberg-Changes'
}

{ #category : #visiting }
IcePackageDefinition >> accept: aVisitor [
	
	^ aVisitor visitPackage: self
]

{ #category : #patching }
IcePackageDefinition >> addModification: anIceModification toPatcher: aMCPatcher [ 

	"In MC there is no such thing as a MCPackage definition.
	Instead, we should manage organization definitions.
	The problem is that they have no identity: they do not know the package they belong to.
	Then, if we just apply this modification, we end up just adding a new definition (and having both).
	To solve this, we remove the old organization and add the new one explicitly."

	aMCPatcher removeDefinition: anIceModification rightDefinition asMCDefinition.
	^ aMCPatcher addDefinition: anIceModification leftDefinition asMCDefinition
]

{ #category : #patching }
IcePackageDefinition >> addToPatcher: aPatcher [

	aPatcher addDefinition: self asMCDefinition
]

{ #category : #accessing }
IcePackageDefinition >> asMCDefinition [

	^ MCOrganizationDefinition packageName: packageName tagNames: tagNames
]

{ #category : #accessing }
IcePackageDefinition >> contents [

	^ String streamContents: [ :stream |
		  stream
			  nextPutAll: 'Package: ';
			  nextPutAll: self packageName;
			  crlf;
			  nextPutAll: 'Tags: '.
		  self tagNames do: [ :tagName |
			  stream
				  nextPutAll: String crlf;
				  nextPutAll: String tab;
				  nextPutAll: tagName ] ]
]

{ #category : #testing }
IcePackageDefinition >> isPackageDefinition [
	
	^ true
]

{ #category : #accessing }
IcePackageDefinition >> package [
	
	^ package
]

{ #category : #accessing }
IcePackageDefinition >> packageName [

	^ packageName
]

{ #category : #accessing }
IcePackageDefinition >> packageName: anObject [

	packageName := anObject
]

{ #category : #accessing }
IcePackageDefinition >> path [
	^ path
]

{ #category : #accessing }
IcePackageDefinition >> path: aRelativePath [ 
	
	path := aRelativePath
]

{ #category : #operations }
IcePackageDefinition >> removeFrom: aVisitor [ 
	aVisitor removePackage: self
]

{ #category : #patching }
IcePackageDefinition >> removeFromPatcher: aPatcher [

	aPatcher removeDefinition: self asMCDefinition
]

{ #category : #accessing }
IcePackageDefinition >> tagNames [

	^ tagNames
]

{ #category : #accessing }
IcePackageDefinition >> tagNames: anObject [

	tagNames := anObject
]
