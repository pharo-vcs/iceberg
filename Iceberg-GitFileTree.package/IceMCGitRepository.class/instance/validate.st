initialize local repository
validate
	"TODO: More validations are needed, see: https://github.com/npasserini/iceberg/issues/27."
	(((self repositoryDirectory / '.git') exists) and: [self isGitRepository: self repositoryDirectory ])
		ifFalse: [ MCFileTreeGitError new signal: 'is not a git repository: ' , directory ].