accessing
tags

	| tags |
	tags := OrderedCollection new.
	self isPushRemote ifTrue: [ tags add: self class tagDefaultPush ]. 
	^ tags asArray