running
setUp
	packageName :=  'Pharo-Git-Test'.
	projectName := 'pharo-git-test'.

	"origin := 'git@github.com:npasserini/{1}.git' format: { projectName }."
	origin := 'file:///home/nico/checkout/inria/{1}' format: { projectName }.
	repository := self createTestRepository: origin.
	
	self removeTempDirectories.
	self removeTestPackages.
