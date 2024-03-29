"
I am an abstract class representing a non-code element read from an Iceberg repository, either from a commit or from the working directory in disk.

My concrete subclasses represent directories and files.

See my superclasses for more information.
"
Class {
	#name : 'IceFileSystemDefinition',
	#superclass : 'IceDefinition',
	#instVars : [
		'path',
		'fileReference'
	],
	#category : 'Iceberg-Changes',
	#package : 'Iceberg',
	#tag : 'Changes'
}

{ #category : 'instance creation' }
IceFileSystemDefinition class >> named: aString path: aPath [
	
	^ (self named: aString)
		path: aPath
		yourself
]

{ #category : 'accessing' }
IceFileSystemDefinition >> fileReference [

	^ fileReference
]

{ #category : 'accessing' }
IceFileSystemDefinition >> fileReference: aFileReference [

	fileReference := aFileReference 
]

{ #category : 'accessing' }
IceFileSystemDefinition >> path [
	^ path
]

{ #category : 'accessing' }
IceFileSystemDefinition >> path: anObject [

	path := anObject
]

{ #category : 'visiting' }
IceFileSystemDefinition >> removeFrom: aVisitor [
	
	aVisitor removeFileReferenceInPath: self path
]
