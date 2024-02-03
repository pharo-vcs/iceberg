Class {
	#name : 'IceExternalJob',
	#superclass : 'Object',
	#instVars : [
		'title',
		'started',
		'min',
		'max',
		'current',
		'mutex'
	],
	#category : 'Iceberg-Progress',
	#package : 'Iceberg',
	#tag : 'Progress'
}

{ #category : 'events' }
IceExternalJob >> changed [

	mutex critical: [  
		self currentWorld defer: [  
			Job jobAnnouncer announce: (current < max 
				ifTrue: [ JobEnd on: self ]
				ifFalse: [ JobChange on: self ]) ] ]
]

{ #category : 'accessing' }
IceExternalJob >> current: anInteger [ 
	current := anInteger 
]

{ #category : 'events' }
IceExternalJob >> end [

	mutex critical: [ 
		self currentWorld defer: [ 
			Job jobAnnouncer announce: (JobEnd on: self) ] ]
]

{ #category : 'events' }
IceExternalJob >> ensureStarted [

	started ifFalse: [ self start ]
]

{ #category : 'initialization' }
IceExternalJob >> initialize [

	super initialize.
	mutex := Mutex new.
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
	mutex critical: [
		self currentWorld defer: [ 
			Job jobAnnouncer announce: (JobStart on: self) ] ]
]

{ #category : 'accessing' }
IceExternalJob >> title [
	^ title
]

{ #category : 'accessing' }
IceExternalJob >> title: aString [ 
	title := aString
]
