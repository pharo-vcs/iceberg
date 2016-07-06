private
loadVersions
	^ versionDescriptors := 
		(self savedPackages collect: [:pkg | pkg packageName -> pkg loadVersions ]) asDictionary

