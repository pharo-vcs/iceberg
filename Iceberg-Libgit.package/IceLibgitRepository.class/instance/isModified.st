API-packages
isModified
	"We cannot correctly determine if a repository is modified if it is missing so, false"
	
	^ self isMissing not and: [ super isModified ]