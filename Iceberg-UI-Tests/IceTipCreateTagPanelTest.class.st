Class {
	#name : 'IceTipCreateTagPanelTest',
	#superclass : 'TestCase',
	#instVars : [
		'panel'
	],
	#category : 'Iceberg-UI-Tests',
	#package : 'Iceberg-UI-Tests'
}

{ #category : 'tests' }
IceTipCreateTagPanelTest >> testLatestTagPartsNoNumeric [
	panel := IceTipCreateTagPanel basicNew.
	self assert: (panel latestTagPartsIn: #()) equals: #('v' 0 0 0).
	self assert: (panel latestTagPartsIn: #('non-numeric')) equals: #('v' 0 0 0)
]

{ #category : 'tests' }
IceTipCreateTagPanelTest >> testLatestTagPartsNoNumeric2 [
	panel := IceTipCreateTagPanel basicNew.
	self assert: (panel latestTagPartsIn: #('v1.2.x')) equals: #('v' 1 2 0).
	self assert: (panel latestTagPartsIn: #('v1.x')) equals: #('v' 1 0 0).
]

{ #category : 'tests' }
IceTipCreateTagPanelTest >> testLatestTagPartsPadded [
	panel := IceTipCreateTagPanel basicNew.
	self assert: (panel latestTagPartsIn: #('v2.1')) equals: #('v' 2 1 0)
]

{ #category : 'tests' }
IceTipCreateTagPanelTest >> testLatestTagPartsWithExtra [
	panel := IceTipCreateTagPanel basicNew.
	self
		assert: (panel latestTagPartsIn: #('v1.0.0-alpha+001' 'v1.0.3+20130313144700'))
		equals: #('v' 1 0 3)
]

{ #category : 'tests' }
IceTipCreateTagPanelTest >> testLatestTagPartsWithPrefix [
	panel := IceTipCreateTagPanel basicNew.
	self
		assert: (panel latestTagPartsIn: #('v2.1.2' 'v2.1.3' '3.1.7' '4.0.0' 'non-numeric'))
		equals: #('v' 2 1 3)
]

{ #category : 'tests' }
IceTipCreateTagPanelTest >> testLatestTagPartsWithoutPrefix [
	panel := IceTipCreateTagPanel basicNew.
	self
		assert: (panel latestTagPartsIn: #('3.1.7' '4.0.0' 'non-numeric'))
		equals: #('' 4 0 0)
]
