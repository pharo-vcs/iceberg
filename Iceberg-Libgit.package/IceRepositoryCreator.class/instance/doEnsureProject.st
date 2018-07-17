private
doEnsureProject

	| fileFormat |

	ensureProjectFile ifFalse: [ ^ self ].
	self repository project isUnbornProject ifFalse: [ ^ self ].

	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: self subdirectory)