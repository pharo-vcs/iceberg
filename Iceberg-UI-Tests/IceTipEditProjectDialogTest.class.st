Class {
	#name : #IceTipEditProjectDialogTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'dialog'
	],
	#category : #'Iceberg-UI-Tests'
}

{ #category : #testing }
IceTipEditProjectDialogTest class >> isAbstract [
	^ self name = #IceTipEditProjectDialogTest
]
