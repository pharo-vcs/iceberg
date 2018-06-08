private-libgit
handleLibgitError: aBlock
	"Handle errors while calling libgit.
	The pragma is used to detect this method and verify on architectural rules that it is correctly called"
	<libgitErrorHandler>
	
	aBlock on: LGitCallReturnHandler do: [ :error | error acceptError: (IceLibgitErrorVisitor onContext: self) ]