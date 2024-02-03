Class {
	#name : 'IceExternalJob',
	#superclass : 'Object',
	#instVars : [
		'title',
		'started',
		'min',
		'max',
		'current'
	],
	#category : 'Iceberg-Progress',
	#package : 'Iceberg',
	#tag : 'Progress'
}

{ #category : 'events' }
IceExternalJob >> changed [

	self currentWorld defer: [  
		Job jobAnnouncer announce: (current >= max 
			ifTrue: [ JobEnd on: self ]
			ifFalse: [ JobChange on: self ]) ]
]

{ #category : 'accessing' }
IceExternalJob >> current: anInteger [ 
	current := anInteger 
]

{ #category : 'events' }
IceExternalJob >> end [

	self currentWorld defer: [ 
		Job jobAnnouncer announce: (JobEnd on: self) ]
]

{ #category : 'events' }
IceExternalJob >> ensureStarted [

	started ifFalse: [ self start ]
]

{ #category : 'initialization' }
IceExternalJob >> initialize [

	super initialize.
	started := false.
	current := 0.
	min := 0. 
	max := 100
]

{ #category : 'accessing' }
IceExternalJob >> max: anInteger [ 
	max := anInteger
]

{ #category : 'accessing' }
IceExternalJob >> min: anInteger [

	min := anInteger 
]

{ #category : 'accessing' }
IceExternalJob >> owner [
	^ nil
]

{ #category : 'accessing' }
IceExternalJob >> progress [
	
	^ min >= max ifTrue: [ 1 ] ifFalse: [ (current - min) / (max - min) ]
]

{ #category : 'events' }
IceExternalJob >> start [

	started := true.
	self currentWorld defer: [ 
		Job jobAnnouncer announce: (JobStart on: self) ]
]

{ #category : 'accessing' }
IceExternalJob >> title [
	^ title
]

{ #category : 'accessing' }
IceExternalJob >> title: aString [ 
	title := aString
]
