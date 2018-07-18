private
doEnsureProject

	ensureProjectFile ifFalse: [ ^ self ].
	self repository project isUnborn ifFalse: [ ^ self ].

	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: self subdirectory)