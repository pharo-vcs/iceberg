actions
loadPackage: packageName
	| package |
	package := Ice packageNamed: packageName. 	
	(self latestVersionForPackage: package) load