querying
versionsFor: package 
	^ self versionDictionary  
		at: package name 
		ifAbsentPut: [ package loadVersionsInBranch: self ]