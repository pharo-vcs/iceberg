running
setUp
	packageName :=  'Pharo-Git-Test'.
	repositoryName := 'pharo-git-test'.
	self initGit.
	self removeTestDirectory.
	self removeTestPackage.
