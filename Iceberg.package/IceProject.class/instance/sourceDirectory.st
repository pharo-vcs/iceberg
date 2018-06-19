accessing
sourceDirectory
	
	^ properties at: 'srcDirectory' ifAbsent: [ 'src' ]