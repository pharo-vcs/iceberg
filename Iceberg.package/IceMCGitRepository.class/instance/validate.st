initialize local repository
validate
	"TODO: More validations are needed, see: https://github.com/npasserini/iceberg/issues/27."
	(self isGitRepository: directory)
		ifFalse: [ MCFileTreeGitError new
				signal: 'is not a git repository: ' , directory ].