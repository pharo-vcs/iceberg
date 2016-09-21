running
setUp
	packageName :=  'Pharo-Git-Test'.
	projectName := 'pharo-git-test'.

	"origin := 'git@github.com:npasserini/{1}.git' format: { projectName }."
	"origin := 'file:///home/nico/checkout/inria/{1}' format: { projectName }."
	origin := FileLocator temp asFileReference / 'pharo' / 'iceberg' / projectName.
	
	origin exists ifFalse: [ 
		origin parent ensureCreateDirectory.
		IceGitCommand 
			in: origin parent  
			execute: { 
				'clone'. 
				'--bare'. 
				'https://github.com/npasserini/{1}.git' format: { projectName }. 
				projectName }. 
	].
	
	repository := self createTestRepository: 'file://', origin fullName.
	
	self removeTempDirectories.
	self removeTestPackages.
