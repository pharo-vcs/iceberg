branches
latestMCVersionForBranchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock inBranchMCRepository: aBranchMCRepository
	
	| latestVersionInfo latestVersion branchCommits |
	branchCommits := aBranchMCRepository sortedVersionInfos
		select: [ :each | each name = aName ].
	
	branchCommits ifEmpty: [ ^ absentBlock value ].
	
	latestVersionInfo := (branchCommits sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
	latestVersion := aBranchMCRepository versionWithInfo: latestVersionInfo.

	presentBlock value: latestVersion