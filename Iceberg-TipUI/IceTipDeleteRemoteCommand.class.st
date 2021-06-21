"
Command that deletes the selected remote
"
Class {
	#name : #IceTipDeleteRemoteCommand,
	#superclass : #IceTipRemotesTreeCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipDeleteRemoteCommand class >> defaultDescription [

	^ 'Delete this remote for this repository'
]

{ #category : #'accessing - defaults' }
IceTipDeleteRemoteCommand class >> defaultName [

	^ 'Delete remote'
]

{ #category : #testing }
IceTipDeleteRemoteCommand >> actsOnRemote: aRemoteModel [

	^ true
]

{ #category : #executing }
IceTipDeleteRemoteCommand >> execute [

	self remoteModel delete
]

{ #category : #accessing }
IceTipDeleteRemoteCommand >> iconName [

	^ #delete
]

{ #category : #executing }
IceTipDeleteRemoteCommand >> remoteModel [

	^ self item
]
