private
doEnsureProject

	| fileFormat |

	ensureProjectFile ifFalse: [ ^ self ].
	self repository project isUnbornProject ifFalse: [ ^ self ].

	self repository workingCopy project: ((IceProject onRepository: self repository)
		sourceDirectory: self subdirectory;
		yourself)