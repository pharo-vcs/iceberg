versions
loadVersions
	^ versionDictionary := 
		(self repository savedPackages collect: [:pkg | pkg packageName -> pkg loadVersions ]) asDictionary
