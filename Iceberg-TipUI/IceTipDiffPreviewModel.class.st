Class {
	#name : 'IceTipDiffPreviewModel',
	#superclass : 'IceTipModel',
	#instVars : [
		'commitish',
		'diffModel'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipDiffPreviewModel >> calculateDiff [

	self subclassResponsibility
]

{ #category : 'accessing' }
IceTipDiffPreviewModel >> commitish [
	^ commitish entity
]

{ #category : 'accessing' }
IceTipDiffPreviewModel >> commitish: aCommitish [
	
	commitish := aCommitish
]

{ #category : 'accessing' }
IceTipDiffPreviewModel >> diff [

	^ diffModel ifNil: [
		  | diff |
		  diff := self calculateDiff.
		  diffModel := IceTipCommitDiffModel
			               repositoryModel: self repositoryModel
			               on: diff ]
]

{ #category : 'accessing' }
IceTipDiffPreviewModel >> repository [
	
	^ commitish repositoryModel entity
]

{ #category : 'accessing' }
IceTipDiffPreviewModel >> repositoryName [
	
	^ self repository name
]

{ #category : 'accessing' }
IceTipDiffPreviewModel >> targetName [
	
	^ commitish name
]
