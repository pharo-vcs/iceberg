private
doEnsureProject

	| fileFormat |

	ensureProjectFile ifFalse: [ ^ self ].
	self repository project isUnbornProject ifFalse: [ ^ self ].

	fileFormat := self repository project fileFormat.

	self repository workingCopy project:
			((IceProject onRepository: self repository)
				fileFormat: fileFormat;
				sourceDirectory: self subdirectory;
				yourself)