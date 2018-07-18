initialize
backwardsCompatibleFormat

	^ TIceRepositoryWriter users
		detect: #isLegacyDefault
		ifNone: [ Smalltalk at: #IceLibgitFiletreeWriter ]