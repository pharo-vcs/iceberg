accessing
allTypes
	^ types ifNil: [ types := IceTipRepositoryTypePanel allTypes ]