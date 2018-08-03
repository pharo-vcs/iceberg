private
doEnsureProject

	ensureProjectFile ifFalse: [ ^ self ].
	self repository project isUnborn ifFalse: [ ^ self ].

	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: self subdirectory).
	self repository workingCopy refreshRepositoryProperties.
	
	"If the properties file has no format, set it the default legacy format"
	self repository workingCopy properties properties
		at: #format
		ifAbsent: [ 	self repository workingCopy properties fileFormat: (TIceRepositoryWriter users
			detect: #isLegacyDefault
			ifNone: [ Smalltalk at: #IceLibgitFiletreeWriter ]) ].
		
	self repository workingCopy refreshPackages.