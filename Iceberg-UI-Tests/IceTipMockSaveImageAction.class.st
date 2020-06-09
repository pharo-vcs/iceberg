Class {
	#name : #IceTipMockSaveImageAction,
	#superclass : #Object,
	#instVars : [
		'timesExecuted'
	],
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #initialization }
IceTipMockSaveImageAction >> execute [

	timesExecuted := timesExecuted + 1
]

{ #category : #initialization }
IceTipMockSaveImageAction >> initialize [ 

	super initialize.
	timesExecuted := 0
]

{ #category : #accessing }
IceTipMockSaveImageAction >> timesExecuted [
	^timesExecuted 
]
