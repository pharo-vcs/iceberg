accessing
tagsForRemote: aRemote
	| tags |
	
	tags := OrderedCollection new.
	(self isPushingRemote: aRemote) ifTrue: [ tags add: self class tagPushing ]. 
	(self isPullingRemote: aRemote) ifTrue: [ tags add: self class tagPulling ]. 
	
	^ tags asArray