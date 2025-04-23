Class {
	#name : 'IceTipBranchItem',
	#superclass : 'Object',
	#instVars : [
		'branches',
		'itemName',
		'branch'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'instance creation' }
IceTipBranchItem class >> itemName: aString branch: aBranch [

	^ self new
		  itemName: aString;
		  branch: aBranch;
		  yourself
]

{ #category : 'accessing' }
IceTipBranchItem >> branch [

	^ branch
]

{ #category : 'accessing' }
IceTipBranchItem >> branch: anObject [

	branch := anObject
]

{ #category : 'accessing' }
IceTipBranchItem >> branches [

	^ branches
]

{ #category : 'accessing' }
IceTipBranchItem >> displayName [
	"We want to add a 'current' to the checkouted branch"

	^ (self isCategory or: [ self branch isHead not ])
		  ifTrue: [ self itemName ]
		  ifFalse: [ self itemName , ' (current)' ]
]

{ #category : 'accessing' }
IceTipBranchItem >> iconName [

	^ self isCategory
		  ifTrue: [ #folder ]
		  ifFalse: [ #branch ]
]

{ #category : 'initialization' }
IceTipBranchItem >> initialize [

	super initialize.
	branches := SortedCollection sortUsing: #itemName ascending
]

{ #category : 'accessing' }
IceTipBranchItem >> isCategory [

	^ self branches isNotEmpty
]

{ #category : 'accessing' }
IceTipBranchItem >> itemName [

	^ itemName
]

{ #category : 'accessing' }
IceTipBranchItem >> itemName: anObject [

	itemName := anObject
]
