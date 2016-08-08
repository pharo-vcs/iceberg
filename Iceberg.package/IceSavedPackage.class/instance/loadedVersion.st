querying
loadedVersion
	^ self versions 
		detect: [ :version | self package workingCopy ancestors includes: version info  ] 
		ifNone: [ 
			"Check if working copy came from an MCGithubRepository"
			(MCGitHubRepository commitIdFor: self workingCopy)
				ifNotNil: [ :commitId |
					^ self versions reversed 
						detect: [ :version | version isAncestorOfCommitId: commitId ]]
		]
