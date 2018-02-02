private factory
createProjectModels
	^ self repositories collect: [ :each | IceTipProjectModel for: each ]