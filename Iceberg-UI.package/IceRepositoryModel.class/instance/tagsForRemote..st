accessing
tagsForRemote: aRemote
	| tags |
	
	tags := OrderedCollection new.
	(self isPushRemote: aRemote) ifTrue: [ tags add: self class tagPushing ]. 
	(self isPullRemote: aRemote) ifTrue: [ tags add: self class tagPulling ]. 
	
	^ tags asArray