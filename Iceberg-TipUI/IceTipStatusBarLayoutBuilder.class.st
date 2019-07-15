Class {
	#name : #IceTipStatusBarLayoutBuilder,
	#superclass : #Object,
	#instVars : [
		'leftSide'
	],
	#category : #'Iceberg-TipUI-Spec-ItemBar'
}

{ #category : #configuring }
IceTipStatusBarLayoutBuilder >> beRightSide [
	
	leftSide := false
]

{ #category : #bulding }
IceTipStatusBarLayoutBuilder >> buildFor: aBuilder [ 

	| presenters layout |
	presenters := aBuilder instVarToModelObject.

	layout := SpBoxLayout newHorizontal.
	
	leftSide ifFalse: [  
		aBuilder createNullPresenters: 1.
		layout add: (aBuilder nullPresentersInstVarNames first) withConstraints: [:aConstraint | aConstraint fill: true; expand: true]. 
	].

	presenters do: [ :anAssoc | layout add: anAssoc key withConstraints: [:aConstraint | aConstraint fill: true; expand: false]].
	
	^ layout
]
