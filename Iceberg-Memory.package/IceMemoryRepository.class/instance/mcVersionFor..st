TOMOVE
mcVersionFor: iceVersion

	| branchCommit dependencyCommitInfo |
	"The ice version knows the branch version.
	We lookup the branch commit that knows the specific package versions.
	We then ask the branch commit for the package version for the corresponding version"
	branchCommit := branchRepository versionWithInfo: (MCVersionInfo new
		instVarNamed: 'id'
		put: (UUID fromString: iceVersion commit id asString);
		yourself).
	dependencyCommitInfo := branchCommit dependencies detect: [ :each |
		each package name = iceVersion packageName ].
	^ codeRepository versionWithInfo: dependencyCommitInfo