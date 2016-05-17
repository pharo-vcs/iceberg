querying
allPackages
	^ self lookupPackages collect: [ :directory | | packageName |
			packageName := directory asFileReference basenameWithoutExtension.			
			Ice packageNamed: packageName ]