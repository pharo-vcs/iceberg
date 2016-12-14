action
contentOfFileNamed: aPathString commit: aCommitId 
	| zip |
	
	zip := ZipArchive new.
	zip
		readFrom:
			(self command:
					{'archive'.
					'--format=zip' .
					aCommitId .
					aPathString }) asByteArray readStream.
	^ (zip memberNamed: aPathString) contents