"
I'm the general announcer of Iceberg.
I'm an announcer that knows how to suspend just some kind of announcements (the ones that matches matching block on #suspendAllMatching:while:).

In current implementation of Iceberg, I will be used mainly for the convenience method: #suspendAllForRepository:while:

"
Class {
	#name : 'IceAnnouncer',
	#superclass : 'Announcer',
	#instVars : [
		'suspendedConditions',
		'suspendAll'
	],
	#category : 'Iceberg-Core',
	#package : 'Iceberg',
	#tag : 'Core'
}

{ #category : 'announce' }
IceAnnouncer >> announce: anAnnouncement [

	(self isAnnouncementSuspended: anAnnouncement) ifTrue: [ ^ anAnnouncement asAnnouncement ].
	^ super announce: anAnnouncement
]

{ #category : 'initialization' }
IceAnnouncer >> initialize [

	super initialize.
	suspendAll := false.
	suspendedConditions := OrderedCollection new: 5
]

{ #category : 'testing' }
IceAnnouncer >> isAnnouncementSuspended: anAnnouncement [

	suspendAll ifTrue: [ ^ true ].
	suspendedConditions ifEmpty: [ ^ false ].
	^ suspendedConditions anySatisfy: [ :each | 
		each value: anAnnouncement ]
]

{ #category : 'testing' }
IceAnnouncer >> isSuspended [

	^ suspendAll
]

{ #category : 'suspending' }
IceAnnouncer >> suspendAllForRepository: aRepository while: aBlock [

	^ self 
		suspendAllMatching: [ :ann | ann appliesToRepository: aRepository ] 
		while: aBlock 
]

{ #category : 'suspending' }
IceAnnouncer >> suspendAllMatching: matchBlock while: aBlock [

	suspendedConditions add: matchBlock.
	aBlock ensure: [ suspendedConditions remove: matchBlock ]
]

{ #category : 'suspending' }
IceAnnouncer >> suspendAllWhile: aBlock [
	| previousSuspensionState |
	
	previousSuspensionState := suspendAll.
	suspendAll := true.
	aBlock ensure: [ 
		suspendAll := previousSuspensionState ]
]
