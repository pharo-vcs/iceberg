requirements
codeDirectories
	"Code repository might have been deleted or image might have been moved."

	| dirs |
	
	dirs := self basicCodeDirectories.
	(dirs, {self repositoryDirectory}) do: [ :each |
		each exists ifFalse: [ IceLocalRepositoryMissing signalFor: self frontend ] ].
	^ dirs
	