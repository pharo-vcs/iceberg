accessing
readParametersFromGlamourContext: aContext
	"If the context comes from a glamour action contextual execution, the selection 
	 will be an IceTipPackageModel"
	packageModel := aContext presentationSelection