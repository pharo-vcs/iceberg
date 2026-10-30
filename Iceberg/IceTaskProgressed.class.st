Class {
	#name : 'IceTaskProgressed',
	#superclass : 'IceTaskAnnouncement',
	#instVars : [
		'title',
		'current',
		'max'
	],
	#category : 'Iceberg-Tasks',
	#package : 'Iceberg',
	#tag : 'Tasks'
}

{ #category : 'accessing' }
IceTaskProgressed >> current [

	^ current
]

{ #category : 'accessing' }
IceTaskProgressed >> current: aNumber [

	current := aNumber
]

{ #category : 'accessing' }
IceTaskProgressed >> max [

	^ max
]

{ #category : 'accessing' }
IceTaskProgressed >> max: aNumber [

	max := aNumber
]

{ #category : 'accessing' }
IceTaskProgressed >> title [

	^ title
]

{ #category : 'accessing' }
IceTaskProgressed >> title: aString [

	title := aString
]
