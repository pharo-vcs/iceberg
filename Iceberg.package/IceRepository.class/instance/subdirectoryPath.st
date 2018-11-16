API-accessing
subdirectoryPath
	"Return a relative path containing the path to the code source.
	This is required to compute the diff between two versions.
	
	Subclasses that do not require this may implement it, for example, as an empty relative path"
	
	self subclassResponsibility