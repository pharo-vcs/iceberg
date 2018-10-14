accessing
latestTagParts
	^ self latestTagPartsIn: (commitishToTag tagModels collect: #name)