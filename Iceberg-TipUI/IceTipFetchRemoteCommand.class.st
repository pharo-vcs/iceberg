"
Command that fetches from remote repositories
"
Class {
	#name : 'IceTipFetchRemoteCommand',
	#superclass : 'IceTipRemotesTreeCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipFetchRemoteCommand class >> defaultDescription [

	^ 'Fetch commits from this remote'
]

{ #category : 'accessing - defaults' }
IceTipFetchRemoteCommand class >> defaultName [

	^ 'Fetch remote'
]

{ #category : 'testing' }
IceTipFetchRemoteCommand >> actsOnRemote: aRemoteModel [

	^ true
]

{ #category : 'executing' }
IceTipFetchRemoteCommand >> execute [

	self remoteModel fetch
]

{ #category : 'accessing' }
IceTipFetchRemoteCommand >> iconName [

	^ #smallUpdate
]

{ #category : 'executing' }
IceTipFetchRemoteCommand >> remoteModel [

	^ self item
]
