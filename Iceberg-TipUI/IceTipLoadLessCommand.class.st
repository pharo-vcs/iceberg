Class {
	#name : 'IceTipLoadLessCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'default' }
IceTipLoadLessCommand class >> defaultName [ 
	^ 'Load Less'
]

{ #category : 'executing' }
IceTipLoadLessCommand >> execute [

	^ self context historyPanel loadLess: 20
]

{ #category : 'accessing' }
IceTipLoadLessCommand >> iconName [ 
	^ #windowMinimize .
]
