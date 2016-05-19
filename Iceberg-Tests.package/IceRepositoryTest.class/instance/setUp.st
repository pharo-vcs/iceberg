running
setUp
	packageName :=  'Pharo-Git-Test'.
	projectName := 'pharo-git-test'.
	location := ('iceberg-cache/npasserini/{1}' format: { projectName }) asFileReference.
	origin := 'git@github.com:npasserini/{1}.git' format: { projectName }.
	repository := IceRepository origin: origin.
	
	self removeTestDirectory.
	self removeTestPackage.
