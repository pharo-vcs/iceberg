accessing
diff

	^ diffModel ifNil: [ | diff |
		UIManager default 
			informUser: 'Calculating diff'
			during: [ diff := commitish entity diffTo: self repository workingCopy ].
			diffModel := IceTipStaticDiffModel
					repositoryModel: self repositoryModel 
					on: diff ]