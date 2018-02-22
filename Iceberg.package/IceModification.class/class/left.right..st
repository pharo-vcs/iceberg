instance creation
left: leftDefinition right: rightDefinition

	^ self new
		oldNode: rightDefinition;
		modifiedNode: leftDefinition;
		yourself