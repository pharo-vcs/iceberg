"
I am a IceNode (containing an IceOperationMerge) visitor meant to update a SpCodePresenter
 with the highlighted code.
"
Class {
	#name : #IceNodeCodeDisplayVistor,
	#superclass : #Object,
	#instVars : [
		'codePresenter'
	],
	#category : #'Iceberg-TipUI'
}

{ #category : #'instance creation' }
IceNodeCodeDisplayVistor class >> onCodePresenter: aSpCodePresenter [
	^ self new
		codePresenter: aSpCodePresenter ;
		yourself
]

{ #category : #accessing }
IceNodeCodeDisplayVistor >> codePresenter [
	^ codePresenter
]

{ #category : #accessing }
IceNodeCodeDisplayVistor >> codePresenter: aSpCodePresenter [.
	codePresenter := aSpCodePresenter 
]

{ #category : #visiting }
IceNodeCodeDisplayVistor >> visitClassDefinition: anIceClassDefinition [ 
	codePresenter text: anIceClassDefinition contents.
	codePresenter behavior: nil
]

{ #category : #visiting }
IceNodeCodeDisplayVistor >> visitConflictingOperation: anIceConflictingOperation [ 
	anIceConflictingOperation chosenOperation definition accept: self.
]

{ #category : #visiting }
IceNodeCodeDisplayVistor >> visitMethodNode: anIceMethodDefinition [ 
	codePresenter text: anIceMethodDefinition sourceCode;
	behavior: (anIceMethodDefinition className asClassIfAbsent: [ UndefinedObject  ] ). 
	
]

{ #category : #visiting }
IceNodeCodeDisplayVistor >> visitNonConflictingOperation: anIceNonConflictingOperation [ 
	anIceNonConflictingOperation definition accept: self .
]

{ #category : #visiting }
IceNodeCodeDisplayVistor >> visitPackage: anIcePackageDefinition [
	codePresenter
		text: '';
		behavior: nil
]
