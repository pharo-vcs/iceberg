private
internalSavePackage: aPackage withMessage: commitMessage
	"Store a new version of a package without modifying the branch"
	| workingCopy newCommit |
	
	workingCopy := 	aPackage workingCopy.	
	workingCopy modified: false.
	
	newCommit := self
		commitPackage: workingCopy package
		author: 'Lala?'
		ancestors: #()
		dependencies: #()
		inInternalRepository: codeRepository.
	^ newCommit 