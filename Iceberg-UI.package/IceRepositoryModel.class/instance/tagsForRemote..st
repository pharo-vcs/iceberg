accessing
tagsForRemote: aRemote
	| tags wc |
	
	tags := OrderedCollection new.
	wc := self repository workConfiguration.
	(wc isPushingRemote: aRemote) ifTrue: [ tags add: self class tagPushing ]. 
	(wc isPullingRemote: aRemote) ifTrue: [ tags add: self class tagPulling ]. 
	
	^ tags asArray