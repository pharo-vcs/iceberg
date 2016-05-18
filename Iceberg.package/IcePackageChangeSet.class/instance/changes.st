initialization
changes
	^ self parent changes select: [ :change | change icePackage = self package ]