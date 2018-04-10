private-commits
latestCommitsOf: aRepository 
self halt.
	^ (aRepository sortedVersionInfos
		groupedBy:[ :each | each name ])
			values collect: [ :versions | | versionInfo |
				versionInfo := (versions sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
				aRepository versionWithInfo: versionInfo ]