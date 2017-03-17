private
lookupPackages

	| entries allPackages |
	
	entries := self packageEntries.
	allPackages := entries flatCollect: [ :each |
		| filesystemEntries pkg relativePath |
		relativePath := each key pathString copyWithoutAll: self repositoryDirectory pathString.
		filesystemEntries := each value.
		filesystemEntries collect: [ :entry |
		pkg := IceSavedPackage
			named: entry packageName
			repository: self frontend
			subdirectory: relativePath.
		entry packageName -> pkg ].
		 ].

	^ allPackages asDictionary
