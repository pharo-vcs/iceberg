Class {
	#name : 'IceTipLoadMoreCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'executing' }
IceTipLoadMoreCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	^ self context historyPanel loadMore:20.
]

{ #category : 'accessing' }
IceTipLoadMoreCommand >> iconName [ 
	^ #smallUpdate.
]
