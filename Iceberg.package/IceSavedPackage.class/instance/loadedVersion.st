querying
loadedVersion
	^ self versions 
		detect: [ :version | version entry info = self package workingCopy versionInfo ] 
		ifNone: [ 
			"Check if working copy came from an MCGithubRepository"
			(MCGitHubRepository commitIdFor: self workingCopy)
				ifNotNil: [ :commitId |
					^ self versions reversed 
						detect: [ :version | version isAncestorOf: commitId ]]
		]
