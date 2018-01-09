validating
validateCanCommit
	"Private API. Do not rely on this.
	
	To know if you can commit you should ask the working copy"
	
	"If the repository head is detached (aka not a branch) we cannot commit.
	The repository has to be placed on a branch."
	self head isDetached ifTrue: [
		IceWorkingCopyDesyncronized signal ]