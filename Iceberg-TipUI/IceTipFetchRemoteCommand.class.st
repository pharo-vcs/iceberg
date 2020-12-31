"
Command that fetches from remote repositories
"
Class {
	#name : #IceTipFetchRemoteCommand,
	#superclass : #IceTipRemotesTreeCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipFetchRemoteCommand class >> defaultDescription [

	^ 'Fetch commits from this remote'
]

{ #category : #accessing }
IceTipFetchRemoteCommand class >> defaultName [

	^ 'Fetch remote'
]

{ #category : #testing }
IceTipFetchRemoteCommand >> actsOnRemote: aRemoteModel [

	^ true
]

{ #category : #execution }
IceTipFetchRemoteCommand >> execute [

	self remoteModel fetch
]

{ #category : #accessing }
IceTipFetchRemoteCommand >> iconName [

	^ #smallUpdate
]

{ #category : #execution }
IceTipFetchRemoteCommand >> remoteModel [

	^ self item
]
