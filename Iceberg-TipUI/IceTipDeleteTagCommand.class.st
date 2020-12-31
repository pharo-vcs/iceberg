"
Command that deletes the selected tag
"
Class {
	#name : #IceTipDeleteTagCommand,
	#superclass : #IceTipRemotesTreeCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipDeleteTagCommand class >> defaultDescription [

	^ 'Delete this tag for this repository'
]

{ #category : #accessing }
IceTipDeleteTagCommand class >> defaultName [

	^ 'Delete tag'
]

{ #category : #testing }
IceTipDeleteTagCommand >> actsOnTag: aRemoteModel [

	^ true
]

{ #category : #execution }
IceTipDeleteTagCommand >> execute [

	self tagModel delete
]

{ #category : #accessing }
IceTipDeleteTagCommand >> iconName [

	^ #delete
]

{ #category : #execution }
IceTipDeleteTagCommand >> tagModel [

	^ self item
]
