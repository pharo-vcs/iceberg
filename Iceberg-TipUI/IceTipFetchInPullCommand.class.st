Class {
	#name : #IceTipFetchInPullCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #default }
IceTipFetchInPullCommand class >> defaultDescription [

	^ 'Fetch from the selected remote'
]

{ #category : #default }
IceTipFetchInPullCommand class >> defaultName [

	^ 'Fetch'
]

{ #category : #executing }
IceTipFetchInPullCommand >> execute [

	context model remoteModel fetch

]

{ #category : #accessing }
IceTipFetchInPullCommand >> iconName [

	^ #smallUpdate
]
