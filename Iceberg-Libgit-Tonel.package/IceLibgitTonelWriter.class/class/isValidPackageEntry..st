testing
isValidPackageEntry: anEntry
	^ (self isValidPackageName: anEntry filename)
		and: [ anEntry object isBlob not
		and: [ (anEntry entryByPath: 'package.st' ifAbsent: [ nil ]) notNil ] ]