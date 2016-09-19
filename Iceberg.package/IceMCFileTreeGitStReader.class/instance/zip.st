accessing
zip
	"Mostly copied from MCFIleTreeGitStReader."
	zip isNil
		ifTrue: [ 
			zip := ZipArchive new.
			zip
				readFrom:
					(self
						gitCommand:
							{'archive'.
							'--format=zip'.
							commitID.
							packageDirectory}
						in: stream) asByteArray readStream ].
	^ zip