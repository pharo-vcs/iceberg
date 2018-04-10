TOMOVE
computeLoadedVersionOf: anIceSavedPackage 
	^ IceSavedPackageVersion
		fromCommit: head commit
		package: anIceSavedPackage