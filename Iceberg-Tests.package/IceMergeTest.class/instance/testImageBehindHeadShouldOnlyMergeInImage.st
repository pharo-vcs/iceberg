merge-cases
testImageBehindHeadShouldOnlyMergeInImage

	"If the image is behind HEAD and we want to merge HEAD we need to update the image to be in HEAD.
	
	(c2)  -  HEAD commit / merge commit
	 |
	 v
	(c1)  -  Image reference commit
	
	expected
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1) 
	
	(arrows meaning parent)
	"
	| referenceCommit headCommit mergeCommit |
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	referenceCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	headCommit := mergeCommit := self repository commitWithMessage: 'Change 1'.
	
	referenceCommit adopt.

	self assert: self repository headCommit equals: headCommit.
	self assert: headCommit equals: mergeCommit.
	self assert: headCommit parent equals: self repository workingCopy referenceCommit.
	
	"Experimental issue. If we merge and we have dirty package we should just resume"
	[self repository workingCopy mergeCommit: mergeCommit]
		on: Warning
		do: #resume.
	
	self assert: self repository headCommit equals: headCommit.
	self assert: headCommit equals: self repository workingCopy referenceCommit.