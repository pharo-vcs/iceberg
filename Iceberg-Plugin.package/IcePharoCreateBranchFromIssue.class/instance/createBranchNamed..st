private
createBranchNamed: branchName
	UIManager default informUserDuring: [ :bar | 
		bar max: 3.
		"fetch pharo remote to be sure we have the commit we need"
		bar label: 'Fetching last commmits from remote.'.
		self repository fetchFrom: self remotesIncludingPharoURLs first.
		bar current: 1.
		"checkout current image version"
		bar label: 'Moving repository to current image version.'.
		self repository checkoutBranch: SystemVersion current commitHash.
		bar current: 2.
		"... create branch starting from it"
		bar label: ('Creating branch {1}.' format: { branchName }).
		self repository createBranch: branchName.
		bar current: 3 ]		