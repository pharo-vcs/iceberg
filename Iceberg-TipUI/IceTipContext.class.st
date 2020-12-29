"
I'm a generic context for iceberg tools.
"
Class {
	#name : #IceTipContext,
	#superclass : #CmdToolContext,
	#instVars : [
		'repositoryModel'
	],
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipContext >> readContextParametersFromModel: aModel [
	self repositoryModel: aModel repositoryModel
]

{ #category : #accessing }
IceTipContext >> repositoryModel [
	^ repositoryModel
]

{ #category : #accessing }
IceTipContext >> repositoryModel: anObject [
	repositoryModel := anObject
]
