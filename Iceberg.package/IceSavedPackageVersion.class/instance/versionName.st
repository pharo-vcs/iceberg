patches
versionName
	^ ('{1}-{2}.{3}' format: {
		self package packageName. 
		self author. 
		self number
	})
