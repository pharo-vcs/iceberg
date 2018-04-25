accessing
newRepository
	| repositoryName location subdirectory |

	repositoryName := self projectNameInputText text trimmed.
	location := self projectLocation location.
	subdirectory := self subdirectoryInputText text asString trimmed.
	
	UIManager default 
		informUser: ('Cloning repository {1} at {2}' format: { repositoryName. location fullName })
		during: [ 
			^ IceRepositoryCreator new
				repository: repository;
				location: location;
				subdirectory: subdirectory;
				createNewRepositoryNamed: repositoryName ]