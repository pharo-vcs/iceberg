private-libgit
free

	(handle isNil or: [ handle isNull ])
		ifFalse: [ 
			handle free.
			handle := nil ]