API-remotes
pushRemote
	"Remote configured automatically for pushing new commits.
	If none is set, default to #origin"
	^ pushRemote ifNil: [ pushRemote := self origin ]