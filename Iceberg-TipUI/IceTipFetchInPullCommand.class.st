Class {
	#name : #IceTipFetchInPullCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipFetchInPullCommand class >> defaultDescription [

	^ 'Fetch from the selected remote'
]

{ #category : #'accessing - defaults' }
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
