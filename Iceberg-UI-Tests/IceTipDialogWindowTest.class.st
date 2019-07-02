Class {
	#name : #IceTipDialogWindowTest,
	#superclass : #TestCase,
	#instVars : [
		'dialogWindow'
	],
	#category : #'Iceberg-UI-Tests'
}

{ #category : #running }
IceTipDialogWindowTest >> tearDown [ 
	dialogWindow ifNotNil: [dialogWindow close]
]

{ #category : #tests }
IceTipDialogWindowTest >> testHasCancelButton [

	dialogWindow := IceTipRegisterRepositoryDialog new openDialogWithSpec.
	self assert: (dialogWindow buttons anySatisfy: [:button | button label='Cancel']).

]
