testing
canUpgradeTo: anMCGitBasedRepository 
	"Copied from MCGitBasedNetworkRepository"
	self halt.
  (anMCGitBasedRepository isKindOf: self class) ifFalse: [ ^ false ].

  ^ self projectPath = anMCGitBasedRepository projectPath 
	and: [ self repoPath = anMCGitBasedRepository repoPath ]