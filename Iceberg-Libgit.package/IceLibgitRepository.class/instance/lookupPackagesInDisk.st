accessing
lookupPackagesInDisk

	self halt: #donotuse.
	^ (self packageEntries
		collect: [ :entry |
			entry packageName -> (IceSavedPackage 
				named: entry packageName
				repository: self) ])
			asDictionary