private factory
projects
	^ self entity collect: [ :each | (IceTipProjectModel for: each) beCached ]