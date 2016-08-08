private
gitVersionsForPackage: aDirectoryEntry branchName: branchName
	"Mostly copied from superclass, added branch name parameter"

	| packageDirectory |
	packageDirectory := self fileUtils directoryFromPath: aDirectoryEntry relativeTo: directory.
	^ ReadStream on: (self gitCommand: {'log'. branchName. '--log-size'. '--parents'. '--reverse'. '--format=|%H|%an|%ai|%p|%s'. '--'. '.'} in: packageDirectory)