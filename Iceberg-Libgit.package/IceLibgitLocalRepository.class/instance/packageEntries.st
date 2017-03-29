private
packageEntries

  "returns a collection of associations (directory->package directory")
	
  ^ (self codeDirectories select: [:dir | dir exists]) collect: [ :dir |
		dir -> (dir entries select: [ :entry | self isPackageEntry: entry ]) ]