actions
addFilesToIndex: aListOfPathes 
	self 
		gitCommand: 	(#( 'add' ) , aListOfPathes collect: [ :path | path ])
		in: directory.