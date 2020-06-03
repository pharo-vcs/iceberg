"
I'm a status bar item. 
I'm the most commonly used item and I will be displaying a text on the statusbar.

My children can extend this behaviour.
"
Class {
	#name : #IceTipStatusBarItem,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'Iceberg-TipUI-Spec-ItemBar'
}

{ #category : #accessing }
IceTipStatusBarItem >> bePositionLeft [
	self position: IceTipItemPosition left
]

{ #category : #accessing }
IceTipStatusBarItem >> bePositionRight [
	self position: IceTipItemPosition right
]

{ #category : #accessing }
IceTipStatusBarItem >> position [
	^ position ifNil: [ IceTipItemPosition default ]
]

{ #category : #accessing }
IceTipStatusBarItem >> position: anObject [
	position := anObject
]
