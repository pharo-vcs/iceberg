Class {
	#name : 'IceTipLoadAllCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'default' }
IceTipLoadAllCommand class >> defaultName [ 
	^ 'Load All'
]

{ #category : 'executing' }
IceTipLoadAllCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	^ self context historyPanel loadAll.
]

{ #category : 'accessing' }
IceTipLoadAllCommand >> iconName [ 
	^ #smallUpdate.
]
