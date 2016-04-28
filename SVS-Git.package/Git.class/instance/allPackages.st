querying
allPackages
	^ packages ifNil: [ packages := self lookupPackages collect: [ :directory | | packageName |
			packageName := directory asFileReference basenameWithoutExtension.			
			Ice workingCopyForPackageNamed: packageName ]] .