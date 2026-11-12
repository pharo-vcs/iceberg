Class {
	#name : 'IceTipBackgroundAction',
	#superclass : 'IceTipStandardAction',
	#instVars : [
		'title',
		'operation'
	],
	#category : 'Iceberg-TipUI',
	#package : 'Iceberg-TipUI'
}

{ #category : 'execution' }
IceTipBackgroundAction >> execute [

	^ IceTaskList default add: ((IceTask repository: self repository operation: operation action: [ :task | actionBlock value ])
			   title: title;
			   yourself)
]

{ #category : 'accessing' }
IceTipBackgroundAction >> operation: aKey [

	operation := aKey
]

{ #category : 'accessing' }
IceTipBackgroundAction >> title: aString [

	title := aString
]
