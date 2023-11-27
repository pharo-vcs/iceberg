"
I'm a base model to present diffs.
"
Class {
	#name : 'IceTipDiffModel',
	#superclass : 'IceTipEntityModel',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'instance creation' }
IceTipDiffModel class >> new [
	^ self error: 'Use #for:'
]

{ #category : 'instance creation' }
IceTipDiffModel class >> on: aDiff [
	^ self basicNew 
		initializeEntity: aDiff;
		yourself
]

{ #category : 'accessing' }
IceTipDiffModel >> copyWithOnly: aCollection [
	^ self diff copyWithOnly: aCollection
]

{ #category : 'accessing' }
IceTipDiffModel >> diff [
	^ self subclassResponsibility
]

{ #category : 'actions' }
IceTipDiffModel >> reset [

	self resetDiff.
	self diff
]

{ #category : 'private' }
IceTipDiffModel >> resetDiff [
	
]

{ #category : 'accessing' }
IceTipDiffModel >> tree [
	^ self diff treeToShow
]

{ #category : 'accessing' }
IceTipDiffModel >> treeRoots [
	^ self tree children
]
