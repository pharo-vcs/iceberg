running
isCI

	^ (OSEnvironment default at: 'CI' ifAbsent: []) = 'true'