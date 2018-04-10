private
basicCommitWithMessage: aString
	| picked changesToCommit |
	cherryPickBlock ifNotNil: [ picked := cherryPickBlock value ].
	changesToCommit := picked
		ifNil: [ self model ]
		ifNotNil: [ self model copyWithOnly: (picked collect: #node) ].
	
	self repository 
		commitChanges: changesToCommit
		withMessage: aString.