actions
accept
	self removeFromRepositoryCheckbox state
		ifTrue: [ self model remove ].
	self unloadFromImageCheckbox state
		ifTrue: [ self model unload ].