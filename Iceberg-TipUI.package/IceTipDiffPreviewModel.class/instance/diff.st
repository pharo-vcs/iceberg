accessing
diff

	^ diffModel ifNil: [ | diff |
		UIManager default 
			informUser: 'Calculating diff'
			during: [ diff := self calculateDiff ].
			diffModel := IceTipCommitDiffModel
					repositoryModel: self repositoryModel 
					on: diff ]