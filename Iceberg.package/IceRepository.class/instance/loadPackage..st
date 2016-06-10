actions
loadPackage: packageName
	| package |
	package := Iceberg packageNamed: packageName. 	
	(self latestVersionForPackage: package) load.
	announcer announce: IcePackageLoaded new.

	