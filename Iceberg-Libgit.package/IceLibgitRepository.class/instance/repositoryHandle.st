private-libgit
repositoryHandle

	<repositoryHandleAccessor>
	(handle isNil or: [ handle isNull ])
		ifTrue: [ handle := (LGitRepository on: self location) open ].
	^ handle