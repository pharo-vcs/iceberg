private
gitVersionsForPackage: package branchName: branchName
	"Mostly copied from superclass, added branch name parameter"

	^ ReadStream on: (
		self 
			gitCommand: {
				'log'. branchName. 
				'--log-size'. '--parents'. '--reverse'. 
				'--format=|%H|%an|%ai|%p|%s'. 
				'--'. '.'
			} 
			in: (self directoryForPackage: package))