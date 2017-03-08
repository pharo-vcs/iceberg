accessing
zip
	^ zip ifNil: [ 
		zip := ZipArchive new
			readFrom: self readStream;
			yourself ]