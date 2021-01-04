"
I am a IceNode (containing an IceOperationMerge) visitor meant to update a SpCodePresenter
 with the highlighted code.
"
Class {
	#name : #IceNodeCodeDisplayVisitor,
	#superclass : #Object,
	#instVars : [
		'codePresenter'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #'instance creation' }
IceNodeCodeDisplayVisitor class >> onCodePresenter: aSpCodePresenter [
	^ self new
		codePresenter: aSpCodePresenter ;
		yourself
]

{ #category : #accessing }
IceNodeCodeDisplayVisitor >> codePresenter [

	^ codePresenter
]

{ #category : #accessing }
IceNodeCodeDisplayVisitor >> codePresenter: aSpCodePresenter [

	codePresenter := aSpCodePresenter
]

{ #category : #visiting }
IceNodeCodeDisplayVisitor >> visitClassDefinition: anIceClassDefinition [

	codePresenter text: anIceClassDefinition contents.
	codePresenter behavior: nil
]

{ #category : #visiting }
IceNodeCodeDisplayVisitor >> visitConflictingOperation: anIceConflictingOperation [

	anIceConflictingOperation chosenOperation definition accept: self
]

{ #category : #visiting }
IceNodeCodeDisplayVisitor >> visitMethodNode: anIceMethodDefinition [

	codePresenter
		text: anIceMethodDefinition sourceCode;
		behavior:
			(anIceMethodDefinition className asClassIfAbsent: [ 
					 UndefinedObject ])
]

{ #category : #visiting }
IceNodeCodeDisplayVisitor >> visitNonConflictingOperation: anIceNonConflictingOperation [

	anIceNonConflictingOperation definition accept: self
]

{ #category : #visiting }
IceNodeCodeDisplayVisitor >> visitPackage: anIcePackageDefinition [

	codePresenter
		text: '';
		behavior: nil
]
