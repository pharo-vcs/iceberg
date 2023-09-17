Class {
	#name : 'IceGenericError',
	#superclass : 'IceError',
	#instVars : [
		'wrappedException'
	],
	#category : 'Iceberg-Errors',
	#package : 'Iceberg',
	#tag : 'Errors'
}

{ #category : 'accessing' }
IceGenericError >> wrappedException: anError [
	
	wrappedException := anError
]
