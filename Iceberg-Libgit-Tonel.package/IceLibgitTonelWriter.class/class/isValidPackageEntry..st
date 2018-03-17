testing
isValidPackageEntry: anEntry
	^ (self isValidPackageName: anEntry filename)
		and: [ anEntry isBlob not
		and: [ (anEntry entryByPath: 'package.st' ifAbsent: [ nil ]) notNil ] ]