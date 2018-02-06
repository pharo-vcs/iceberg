private factory
createProjectModels
	^ self entity collect: [ :each | IceTipCachedModel for: (IceTipProjectModel for: each) ]