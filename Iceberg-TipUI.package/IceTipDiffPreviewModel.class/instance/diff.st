accessing
diff

	^ diffModel ifNil: [ | diff |
		UIManager default 
			informUser: 'Calculating diff'
			during: [ diff := self calculateDiff ].
			diffModel := IceTipStaticDiffModel
					repositoryModel: self repositoryModel 
					on: diff ]