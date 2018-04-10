private-commits
latestCommitsOf: aMCDictionaryRepository 
	
	^ (aMCDictionaryRepository sortedVersionInfos
		groupedBy:[ :each | each name ])
			values collect: [ :versions | | versionInfo |
				versionInfo := (versions sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
				aMCDictionaryRepository versionWithInfo: versionInfo ]