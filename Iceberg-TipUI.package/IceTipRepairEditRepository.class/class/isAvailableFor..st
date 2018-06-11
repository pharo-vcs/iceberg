testing
isAvailableFor: aRepository

	^ aRepository isMissing not and: [aRepository isCodeMissing]