private
repositoryRemotesOf: aRepository
	^ (self cachedValues 
		at: #repositoryRemotes ifAbsentPut: [ Dictionary new ])
		at: aRepository ifAbsentPut: [ aRepository remotes ]