Class {
	#name : #IceTreeTests,
	#superclass : #TestCase,
	#category : 'Iceberg-Tests-Changes'
}

{ #category : #tests }
IceTreeTests >> testDetectFoundElement [

	| selected |
	selected := (IceNode value: 2) detect: [ :e | e value even ].

	self assert: selected equals: 2
]

{ #category : #tests }
IceTreeTests >> testDetectNotFoundElement [
	self should: [ (IceNode value: 1) detect: [ :e | e value even ] ] raise: NotFound
]

{ #category : #tests }
IceTreeTests >> testSelect [

	| selected |
	selected := (IceNode value: 1) select: [ :e | e even ].
	self
		assert: selected isEmpty.
		
	selected := (IceNode value: 1) select: [ :e | e odd ].
	self
		assert: selected value
		equals: 1.
]
