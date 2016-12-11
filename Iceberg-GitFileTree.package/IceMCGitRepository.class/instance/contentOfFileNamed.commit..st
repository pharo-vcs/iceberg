action
contentOfFileNamed: aPathString commit: aCommitId 
	| zip |
	
	zip := ZipArchive new.
	zip
		readFrom:
			(self
				gitCommand:
					{'archive'.
					'--format=zip' .
					aCommitId .
					aPathString }
				in: directory) asByteArray readStream.
	^ (zip memberNamed: aPathString) contents