Class {
	#name : 'IceTipFetchInPullCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipFetchInPullCommand class >> defaultDescription [

	^ 'Fetch from the selected remote'
]

{ #category : 'accessing - defaults' }
IceTipFetchInPullCommand class >> defaultName [

	^ 'Fetch'
]

{ #category : 'executing' }
IceTipFetchInPullCommand >> execute [

	context model remoteModel newFetchAction executeWithContext: self context

]

{ #category : 'accessing' }
IceTipFetchInPullCommand >> iconName [

	^ #smallUpdate
]
