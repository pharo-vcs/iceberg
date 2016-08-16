private
basicGetVersions
	| entryVersions |
	entryVersions := OrderedCollection new.
	entryVersionIndex := IdentityDictionary new.
	commitIDs := repository gitVersionsForPackage: package branchName: branchName.
	
	[ commitIDs atEnd ] whileFalse: [ 
		| newPackageEntry |
		newPackageEntry := self parseEntry.
		entryVersionIndex at: newPackageEntry shortCommitID put: newPackageEntry.
		entryVersions add: newPackageEntry 
	].

	entryVersions doWithIndex: [ :entryVersion :version | 
		entryVersion setMCVersionInfoWithNumber: version 
	].
	
	^ entryVersions