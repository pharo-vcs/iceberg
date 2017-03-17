tests
testCanLoadArbitraryFileFromGitCommitish
	| content |

	content := repository 
		contentOfFileNamed: 'BaselineOfPharoGitTest.package/properties.json'
		commit: repository headCommit id.

	self
		assert: content
		equals: '{
	 }
' withUnixLineEndings