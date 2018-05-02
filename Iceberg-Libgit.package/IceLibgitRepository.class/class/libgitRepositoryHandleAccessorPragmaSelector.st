rules
libgitRepositoryHandleAccessorPragmaSelector
	
	"Pragma selector used to detect methods allowed to directly access the repository handle. 
	This selector is mainly used by architectural rules to ensure that libgit is being called correctly."
	^ #repositoryHandleAccessor