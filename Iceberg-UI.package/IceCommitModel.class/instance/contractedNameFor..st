utilities
contractedNameFor: diff
	"If the name of a branch is too long it is better to contract it in order to limit the UI glitches."

	^ diff repository branchName contractTo: 20