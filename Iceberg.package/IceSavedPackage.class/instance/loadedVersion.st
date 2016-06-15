querying
loadedVersion
	^ self versions 
		detect: [ :version | version entry info = self package workingCopy versionInfo ] 
		ifNone: [ 
			self package workingCopy repositoryGroup repositories 
				"Check that the repository has that version"
				detect: [ :repo | repo isKindOf: MCGitHubRepository ] 
				ifFound: [: repo | | commitId | 
					self haltOnce.
					commitId := repo directory basename copyAfterLast: $-.
					^ self versions reversed detect: [ :version | 
						(self repository command: { 'merge-base'. commitId. version commitId }) trim = version commitId  
					]
				]
		]
