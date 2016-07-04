querying
lookupPackages
	^ self packageEntries collect: #asIcePackage 
	