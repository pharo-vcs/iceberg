initialize
initialize
	super initialize.
"	repositoryProperties := self readProperties.
	repositoryProperties properties
		at: #format
		ifAbsent: [ 	repositoryProperties fileFormat: self backwardsCompatibleFormat ]"