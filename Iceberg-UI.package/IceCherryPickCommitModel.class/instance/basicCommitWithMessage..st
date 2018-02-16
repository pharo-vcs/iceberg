private
basicCommitWithMessage: aString
	| picked changesToCommit |
	cherryPickBlock ifNotNil: [ picked := cherryPickBlock value ].
	changesToCommit := picked
		ifNil: [ self model ]
		ifNotNil: [ self model copyWithOnly: picked ].
	
	self repository 
		commitChanges: changesToCommit
		withMessage: aString.