private accessing
defaultLocation
	| remoteToUse |
	remoteToUse := self remoteToUse.
	^ IceLibgitRepository repositoriesLocation 
		/ remoteToUse organizer 
		/ remoteToUse projectName