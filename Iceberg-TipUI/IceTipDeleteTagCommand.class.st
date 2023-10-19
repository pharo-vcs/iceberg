"
Command that deletes the selected tag
"
Class {
	#name : 'IceTipDeleteTagCommand',
	#superclass : 'IceTipRemotesTreeCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipDeleteTagCommand class >> defaultDescription [

	^ 'Delete this tag for this repository'
]

{ #category : 'accessing - defaults' }
IceTipDeleteTagCommand class >> defaultName [

	^ 'Delete tag'
]

{ #category : 'testing' }
IceTipDeleteTagCommand >> actsOnTag: aRemoteModel [

	^ true
]

{ #category : 'executing' }
IceTipDeleteTagCommand >> execute [

	self tagModel newDeleteAction executeWithContext: self context
]

{ #category : 'accessing' }
IceTipDeleteTagCommand >> iconName [

	^ #delete
]

{ #category : 'executing' }
IceTipDeleteTagCommand >> tagModel [

	^ self item
]
