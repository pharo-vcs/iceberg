API-remotes
pullRemote
	"Remote configured automatically for pulling new commits.
	If none is set, default to #origin"
	^ pullRemote ifNil: [ pullRemote := self origin ]