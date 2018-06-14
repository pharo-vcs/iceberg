accessing
defaultFileFormat
	
	^ TIceRepositoryWriter users
			detect: #isLegacyDefault
			ifNone: [ Smalltalk at: #IceLibgitFiletreeWriter ] 