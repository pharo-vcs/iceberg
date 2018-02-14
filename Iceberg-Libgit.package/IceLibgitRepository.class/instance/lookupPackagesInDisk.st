accessing
lookupPackagesInDisk

	self halt: #donotuse.
	^ (self packageEntries
		collect: [ :entry |
			entry packageName -> (IcePackage 
				named: entry packageName
				repository: self) ])
			asDictionary