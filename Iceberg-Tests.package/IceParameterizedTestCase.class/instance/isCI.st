running
isCI
	^ (OSEnvironment current at: 'CI' ifAbsent: [ 'false' ]) asLowercase = 'true'