private-monticello
mcVersionForPackage: aMCPackage inCommit: anIceGitCommit 
	
	^ self mcVersionFor: (IceSavedPackageVersion fromCommit: anIceGitCommit package: aMCPackage)