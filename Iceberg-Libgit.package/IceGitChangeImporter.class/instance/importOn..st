importing
importOn: aNode
	
	| currentSegment |
	currentSegment := path segments first.

	"If I represent a package, let's do it and do nothing else.
	This could be optimized to add the exact methods and avoid MC diff afterwards"
	((diff isCodeSubdirectory: aNode)
		and: [ diff sourceVersion writerClass isValidPackageName: currentSegment ])
			ifTrue: [ ^ self ensurePackageFromDirectoryName: currentSegment inParentNode: aNode ].

	"If I do not represent a package, I may be a file or a directory that may (recursively) contain a method or a package.
	For now, we only support packages inside the declared subdirectory (or root otherwise).
	All other changes are simple directory/file changes"
	
	"If path = 1 this means it is a file"
	path size = 1
		ifTrue: [ | fileReference filePath |
			filePath := aNode path / currentSegment.
			fileReference := version fileSystem resolve: filePath.
			fileReference exists ifTrue: [
				^ aNode addChild: (IceFileDefinition named: currentSegment path: filePath fileReference: fileReference) ] ].
	
	path size > 1 ifTrue: [ 
		"Otherwise, we recursively create a directory structure"
		self nextPath importOn: (self ensureDirectoryNamed: currentSegment inParentNode: aNode) ].
	
	"If path size = 0 we should stop recursion"