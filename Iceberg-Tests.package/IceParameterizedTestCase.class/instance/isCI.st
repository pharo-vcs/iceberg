running
isCI
	^ (OSEnvironment current at: 'CI' ifAbsent: [  ]) = 'true'