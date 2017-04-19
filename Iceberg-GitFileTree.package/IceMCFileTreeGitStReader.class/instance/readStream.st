accessing
readStream
	^ (IceGitCommand 
		in: stream 
		execute: {
			'archive'.
			'--format=zip'.
			commitID.
			packageDirectory
		}) 
		asByteArray
		readStream