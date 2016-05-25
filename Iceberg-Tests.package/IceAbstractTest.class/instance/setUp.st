running
setUp
	packageName :=  'Pharo-Git-Test'.
	projectName := 'pharo-git-test'.

	origin := 'git@github.com:npasserini/{1}.git' format: { projectName }.
	repository := IceRepository origin: origin.
	
	self removeTempDirectories.
	self removeTestPackage.
