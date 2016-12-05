private
addFilesToIndex: aListOfPathes
	self withRepoDo: [ :repo | 
		| index |
		index := repo index.
		index addAll: aListOfPathes.
		index writeToDisk.
		^ index writeTreeAndReturnOid.		
	]