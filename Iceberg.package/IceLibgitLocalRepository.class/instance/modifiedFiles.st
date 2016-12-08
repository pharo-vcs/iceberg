actions
modifiedFiles
	| statusMask modifiedPathes |
	statusMask :=  (LGitStatusTypeEnum git_status_wt_new value)
				| (LGitStatusTypeEnum git_status_wt_modified value)
				| (LGitStatusTypeEnum git_status_wt_deleted value)
				| (LGitStatusTypeEnum git_status_wt_typechange value)
				| (LGitStatusTypeEnum git_status_wt_renamed value).
	
	self withRepoDo: 
		[ :repo | 
		modifiedPathes := repo index 
			entriesSelect: [ :path :status | (status & statusMask) > 0 ] ].
	^ modifiedPathes 
		collect: [ :entry | entry first asFileReference ]