accessing
tags

	| tags |
	tags := OrderedCollection new.
	self isPushRemote ifTrue: [ tags add: self class tagDefaultPush ]. 
	self isPullRemote ifTrue: [ tags add: self class tagDefaultPull ]. 
	^ tags asArray