private
packageEntries
	
	 ^ self codeDirectories flatCollect: [ :dir |
		dir entries select: [ :entry | self isPackageEntry: entry ] ]