"
I read exclusively the definition of the method defined in fileName.
I'm using to speed the creation of a version list on IceLibgitFiletreeLog.
"
Class {
	#name : 'IceLibgitFiletreeLogReader',
	#superclass : 'IceLibgitFiletreeReader',
	#instVars : [
		'fileName'
	],
	#category : 'Iceberg-Libgit-Filetree-Reader',
	#package : 'Iceberg-Libgit-Filetree',
	#tag : 'Reader'
}

{ #category : 'instance creation' }
IceLibgitFiletreeLogReader class >> fileName: aString on: aCommit [
	^ (self on: aCommit)
		fileName: aString;
		yourself
]

{ #category : 'accessing' }
IceLibgitFiletreeLogReader >> fileName [
	^ fileName
]

{ #category : 'accessing' }
IceLibgitFiletreeLogReader >> fileName: aString [
	fileName := aString
]

{ #category : 'utilities' }
IceLibgitFiletreeLogReader >> loadDefinitions [
 	| entry segments className classIsMeta entryPath packageIndex |	
	
	definitions := OrderedCollection new.
	
	segments := (self fileName substrings: '/') allButLast asOrderedCollection.
	classIsMeta := segments removeLast = 'class'.
	className := segments last copyUpToLast: $..
	"entryPath is the relative path from the package to the method being loaded"
	packageIndex := segments indexOf: packageDirectory filename.
	entryPath := packageIndex > 0 ifTrue: 
		[ entryPath := $/ join: (segments copyFrom: 1 to: packageIndex).
		self fileName allButFirst: entryPath size ]
	ifFalse:
		[ self fileName allButFirst: packageDirectory filename size ].
	entry := (packageDirectory 
		entryByPath: entryPath
		ifAbsent: [ ^ nil ]).
	entry readStreamDo: [ :fileStream |
		| category source timestamp selector |

		category := fileStream nextLine.
		source := fileStream upToEnd.
 		selector := self methodSelectorFor: source.
 		timestamp := stream author name, ' ' , stream time asDateAndTime asStringYMDHM.
		definitions add: (MCMethodDefinition
			className: className
			classIsMeta: classIsMeta
			selector: selector
			category: category
			timeStamp: timestamp
			source: source) ]
]

{ #category : 'accessing' }
IceLibgitFiletreeLogReader >> package [
	^ package
]

{ #category : 'accessing' }
IceLibgitFiletreeLogReader >> package: aPackage [
	package := aPackage
]
