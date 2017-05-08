private
basicCommitWithMessage: aString
	| picked |
	cherryPickBlock ifNotNil: [ picked := cherryPickBlock value ].
	picked ifNil: [ ^ super basicCommitWithMessage: aString ].
	
	self repository 
		commitSnapshop: (MCSnapshot fromDefinitions: picked)
		withMessage: aString