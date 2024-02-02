Class {
	#name : 'IceTreeTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Changes',
	#package : 'Iceberg-Tests',
	#tag : 'Changes'
}

{ #category : 'tests' }
IceTreeTest >> testDetectFoundElement [

	| selected |
	selected := (IceNode value: 2) detect: [ :e | e value even ].

	self assert: selected equals: 2
]

{ #category : 'tests' }
IceTreeTest >> testDetectNotFoundElement [
	self should: [ (IceNode value: 1) detect: [ :e | e value even ] ] raise: NotFound
]

{ #category : 'tests' }
IceTreeTest >> testSelect [

	| selected |
	selected := (IceNode value: 1) select: [ :e | e even ].
	self
		assert: selected isEmpty.
		
	selected := (IceNode value: 1) select: [ :e | e odd ].
	self
		assert: selected value
		equals: 1.
]
