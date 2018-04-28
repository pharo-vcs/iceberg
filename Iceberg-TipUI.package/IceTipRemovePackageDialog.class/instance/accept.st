actions
accept
	1halt.
	self removeFromRepositoryCheckbox state
		ifTrue: [ self model entity removeFromDiskForce: true ].
	self unloadFromImageCheckbox state
		ifTrue: [ self model unload ].