"
I'm a status bar item that gets its values from a target object.
For me, #contents keeps a selector of the method that will provide the actual value. 

"
Class {
	#name : #IceTipStatusBarTargetItem,
	#superclass : #IceTipStatusBarItem,
	#instVars : [
		'target',
		'helpBlock',
		'contentsBlock'
	],
	#category : #'Iceberg-TipUI-Spec-ItemBar'
}

{ #category : #configuring }
IceTipStatusBarTargetItem >> configurePresenter: aSpLabelPresenter [ 
	
	aSpLabelPresenter label: self contents.
	aSpLabelPresenter help: self help.

]

{ #category : #accessing }
IceTipStatusBarTargetItem >> contents [

	^ contentsBlock cull: target
]

{ #category : #accessing }
IceTipStatusBarTargetItem >> contentsBlock [
	^ contentsBlock
]

{ #category : #accessing }
IceTipStatusBarTargetItem >> contentsBlock: anObject [
	contentsBlock := anObject
]

{ #category : #accessing }
IceTipStatusBarTargetItem >> help [

	^ helpBlock cull: target 
]

{ #category : #accessing }
IceTipStatusBarTargetItem >> helpBlock [
	^ helpBlock
]

{ #category : #accessing }
IceTipStatusBarTargetItem >> helpBlock: anObject [
	helpBlock := anObject
]

{ #category : #configuring }
IceTipStatusBarTargetItem >> presenterClass [
	
	^ SpLabelPresenter 
]

{ #category : #accessing }
IceTipStatusBarTargetItem >> target [
	^ target
]

{ #category : #accessing }
IceTipStatusBarTargetItem >> target: anObject [
	target := anObject
]
