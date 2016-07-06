*Iceberg-Core
changesFileNamed: fileName 
	^ self parents allSatisfy: [ :parent |
		| diff selfTree parentTree |
		diff := LGitDiff of: self repository.
		selfTree := self tree.
		parentTree := parent tree.
		
		diff diffTree: selfTree toTree: parentTree.
		
		[ diff includesFileNamed: fileName ] 
			ensure: [ { diff. selfTree. parentTree} do: #free ]				
	]
