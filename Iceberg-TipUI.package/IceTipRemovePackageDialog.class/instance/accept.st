actions
accept
	self removeFromRepositoryCheckbox state
		ifTrue: [ self model entity remove ].
	self unloadFromImageCheckbox state
		ifTrue: [ self model unload ].