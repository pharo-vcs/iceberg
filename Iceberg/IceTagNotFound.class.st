Class {
	#name : 'IceTagNotFound',
	#superclass : 'IceError',
	#instVars : [
		'tagName'
	],
	#category : 'Iceberg-Core',
	#package : 'Iceberg',
	#tag : 'Core'
}

{ #category : 'accessing' }
IceTagNotFound >> tagName: aString [ 
	tagName := aString
]
