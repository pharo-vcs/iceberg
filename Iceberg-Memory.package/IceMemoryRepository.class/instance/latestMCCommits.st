private-commits
latestMCCommits
	
	^ (branchRepository sortedVersionInfos
		groupedBy:[ :each | each name ])
			values collect: [ :versions | | versionInfo |
				versionInfo := (versions sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
				branchRepository versionWithInfo: versionInfo ]