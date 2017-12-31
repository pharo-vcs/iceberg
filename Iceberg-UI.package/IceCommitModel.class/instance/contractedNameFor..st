utilities
contractedNameFor: status
	"If the name of a branch is too long it is better to contract it in order to limit the UI glitches."

	^ status headCommitString