rules
libgitErrorHandlerSelector
	
	"Detect what method is used for handling libgit errors.
	Detection is done through a pragma to allow future renames.
	
	This selector is mainly used by architectural rules to ensure that libgit is being called correctly."
	^ (self methods detect: [ :each |
		each pragmas anySatisfy: [ :pragma | pragma keyword = self libgitErrorHandlerPragmaSelector ] ]) selector