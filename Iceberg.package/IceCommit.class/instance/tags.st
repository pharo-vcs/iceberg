API-tags
tags
	
	^ self repository tags select: [ :each | each commit = self ]