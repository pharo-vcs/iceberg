accessing
resolve: aRelativePath 
	
	^ self resolve: aRelativePath ifAbsent: [ NotFound signalFor: aRelativePath ]