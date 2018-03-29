accessing
diff

	^ diffModel ifNil: [ | diff |
		UIManager default 
			informUser: 'Calculating diff'
			during: [ diff := commitish entity diffTo: self repository workingCopy ].
			diffModel := IceTipCommitDiffModel
					repositoryModel: self repositoryModel 
					on: diff ]