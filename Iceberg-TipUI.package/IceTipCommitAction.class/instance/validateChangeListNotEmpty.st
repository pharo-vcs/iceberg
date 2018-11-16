validating
validateChangeListNotEmpty
	"If there are no selected changed, no point on commiting :)"
	
	items ifEmpty: [ IceNothingToCommit signal ]