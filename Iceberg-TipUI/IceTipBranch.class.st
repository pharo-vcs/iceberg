Class {
	#name : 'IceTipBranch',
	#superclass : 'Object',
	#instVars : [
		'branch',
		'branches',
		'isCategory'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'accessing' }
IceTipBranch >> branch [

	^ branch
]

{ #category : 'accessing' }
IceTipBranch >> branch: aBranch [

	branch := aBranch
]

{ #category : 'accessing' }
IceTipBranch >> branches [

	^ branches
]

{ #category : 'initialization' }
IceTipBranch >> initialize [

	super initialize.
	branches := OrderedCollection new.
	isCategory := false
]

{ #category : 'accessing' }
IceTipBranch >> isCategory [

	^ isCategory
]

{ #category : 'accessing' }
IceTipBranch >> isCategory: aBoolean [

	isCategory := true
]
