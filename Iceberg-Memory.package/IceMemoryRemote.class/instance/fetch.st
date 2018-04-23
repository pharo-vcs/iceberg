fetching
fetch

	self fetchCommitsThat: [ :each | true ].
	
	"Call post fetch to fix unknown commits"
	localRepository postFetch.