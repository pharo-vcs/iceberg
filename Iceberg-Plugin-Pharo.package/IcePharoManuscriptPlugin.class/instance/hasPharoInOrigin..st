testing
hasPharoInOrigin: aRepository

	| origin |
	origin := aRepository origin.
	^ (origin host = 'github.com')
		and: [ origin owner = 'pharo-project'
		and: [ origin projectName = 'pharo' ] ]