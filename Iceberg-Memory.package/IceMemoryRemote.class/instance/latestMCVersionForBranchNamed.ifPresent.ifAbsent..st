private-commits
latestMCVersionForBranchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock
	
	| latestVersionInfo latestVersion branchCommits |
	branchCommits := branchRepository sortedVersionInfos
		select: [ :each | each name = aName ].
	
	branchCommits ifEmpty: [ ^ absentBlock value ].
	
	latestVersionInfo := (branchCommits sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
	latestVersion := branchRepository versionWithInfo: latestVersionInfo.

	presentBlock value: latestVersion