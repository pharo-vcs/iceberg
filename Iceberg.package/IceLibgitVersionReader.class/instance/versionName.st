accessing
versionName
	^ ('{1}-{2}.{3}' format: {
		self packageNameFromPackageDirectory. 
		self commit author name. 
		self versionNumber
	})