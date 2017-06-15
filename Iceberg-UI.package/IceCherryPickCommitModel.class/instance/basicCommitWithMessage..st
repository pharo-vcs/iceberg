private
basicCommitWithMessage: aString
	| picked |

"
TODO: 
	- I need to check if picked = all changes (in that case, is not needed the pick)
	- I need to check status later (to see if package becomes unmodified)
	- what happens if package is new? (it does not have snapshot)
"

	cherryPickBlock ifNotNil: [ picked := cherryPickBlock value ].
	"Nothing was picked, continue as usual"
	picked ifNil: [ ^ super basicCommitWithMessage: aString ].

	self repository 
		commitCherryPick: picked  
		withMessage: aString