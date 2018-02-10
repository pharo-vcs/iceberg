execution
readParametersFromGlamourContext: aContext
	"If the project comes from a glamour action contextual execution, the selection 
	 will be an IceTipRepositoryModel"
	repositoryModel := aContext presentationSelection