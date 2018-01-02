patches
mcVersion

	^ (commit mcVersionFor: self)
		ifNil: [ IceVersionDoesNotExist new version: self; signal ]