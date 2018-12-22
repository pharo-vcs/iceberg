private
ensureSourceCodeParentNodeIn: aNode
	
	^ self
		ensureDirectoryAtPath: diff repository subdirectoryPath segments
		inNode: aNode