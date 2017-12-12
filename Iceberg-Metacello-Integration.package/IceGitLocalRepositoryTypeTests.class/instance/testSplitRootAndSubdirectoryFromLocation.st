tests
testSplitRootAndSubdirectoryFromLocation

	| repositoryType tmpDir |

	self timeLimit: 5 seconds.
	tmpDir := FileLocator temp resolve.
	repositoryType := IceGitLocalRepositoryType new initializeLocation: 'gitlocal://', tmpDir fullName.
	self 
		should: [ repositoryType splitRootAndSubdirectoryFromLocation ]
		raise: Error
		whoseDescriptionIncludes: 'I can''t find a .git/config file.' 
		description: 'Failed to catch missing git repository' .
