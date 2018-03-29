loading
isDirty

	^ self isLoaded and: [isDirty ifNil: [ isDirty := false ]]