*Iceberg-Core
changesFileNamed: fileName 
	^ self parents allSatisfy: [ :parent |
		| selfTree parentTree diff |
		[ 	
			selfTree := self tree.
			parentTree := parent tree.
		
			diff := (LGitDiff of: self repository)
				diffTree: selfTree 
				toTree: parentTree.
		
			diff includesFileNamed: fileName
		] 
		ensure: [ { diff. selfTree. parentTree} do: #free ]
	]
