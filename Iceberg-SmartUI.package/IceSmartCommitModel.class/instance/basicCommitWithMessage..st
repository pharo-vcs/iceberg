private
basicCommitWithMessage: aString
	| picked |

	self flag: #todo. "I need to check if picked = all changes (in that case, is not 
	needed the pick and I can just go 'business as usual')"
	cherryPickBlock ifNotNil: [ picked := cherryPickBlock value ].
	"Nothing was picked, continue as usual"
	picked ifNil: [ 
		^ self repository 
			commitPackages: self model modifiedPackages
			withMessage: aString ].
	self halt.
	self repository 
		commitCherryPick: picked  
		withMessage: aString