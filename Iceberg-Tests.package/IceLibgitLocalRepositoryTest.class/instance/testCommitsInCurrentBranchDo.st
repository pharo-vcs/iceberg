tests
testCommitsInCurrentBranchDo
	repository backend commitsInCurrentBranchDo: [ :commit | 
		"No assertions right now, just verify that no errors ocurred and we found at least one commit"
		^ self ].
	
	"No commits found"
	self fail