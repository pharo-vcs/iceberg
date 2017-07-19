accessing remotes
remotes
	self isValid ifFalse: [ ^ #() ].
	^ self backend remotes 