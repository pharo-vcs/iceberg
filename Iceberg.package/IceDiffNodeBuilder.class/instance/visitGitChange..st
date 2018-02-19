visiting
visitGitChange: anIceGitChange 

	| currentSegment |
	currentSegment := anIceGitChange path segments first.

	"If I represent a package, let's do it and do nothing else.
	This could be optimized to add the exact methods and avoid MC diff afterwards"
	(parentNode isCodeSubdirectory
		and: [ diff isValidPackageName: currentSegment ])
			ifTrue: [ ^ self ensurePackageFromDirectoryName: currentSegment ].

	1halt.
	"If I do not represent a package, I may be a file or a directory that may (recursively) contain a method or a package.
	For now, we only support packages inside the declared subdirectory (or root otherwise).
	All other changes are simple directory/file changes"
	
	"If path = 1 this means it is a file"
	self path size = 1
		ifTrue: [ ^ self ensureFileNamed: currentSegment ].
	
	self path size > 1 ifTrue: [ 
		"Otherwise, we recursively create a directory structure"
		anIceGitChange child buildOn: (self ensureDirectoryNamed: currentSegment) ].
	
	"If path size = 0 we should stop recursion"