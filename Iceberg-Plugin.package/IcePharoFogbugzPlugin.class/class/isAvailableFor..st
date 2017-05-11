testing
isAvailableFor: aRepository
	"validate if this is a github repository"
	| origin |
	origin := aRepository origin.
	^ (origin host = 'github.com')
		and: [ (self authorizedOwners includes: origin owner) 
		and: [ origin projectName = 'pharo-core' ] ]