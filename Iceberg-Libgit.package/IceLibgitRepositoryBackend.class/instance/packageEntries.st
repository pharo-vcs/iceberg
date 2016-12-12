private
packageEntries
	^ self codeDirectory entries select: [ :entry | self isPackageEntry: entry ]. 

	