"
Command that deletes the selected remote
"
Class {
	#name : #IceTipDeleteRemoteCommand,
	#superclass : #IceTipRemotesTreeCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipDeleteRemoteCommand class >> defaultDescription [

	^ 'Delete this remote for this repository'
]

{ #category : #accessing }
IceTipDeleteRemoteCommand class >> defaultName [

	^ 'Delete remote'
]

{ #category : #testing }
IceTipDeleteRemoteCommand >> actsOnRemote: aRemoteModel [

	^ true
]

{ #category : #execution }
IceTipDeleteRemoteCommand >> execute [

	self remoteModel delete
]

{ #category : #accessing }
IceTipDeleteRemoteCommand >> iconName [

	^ #delete
]

{ #category : #execution }
IceTipDeleteRemoteCommand >> remoteModel [

	^ self item
]
