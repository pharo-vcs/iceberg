action
contentOfFileNamed: aPathString commit: aCommitId 
	"Do not run the command in codeDirectory. We want to be able to fetch files that are outside the code directory!"
	| zip |
	
	zip := ZipArchive new.
	zip
		readFrom:
			(IceGitCommand 
				in: self repositoryDirectory
				execute:	{'archive' . '--format=zip' . aCommitId . aPathString }) asByteArray readStream.
	^ (zip memberNamed: aPathString) contents