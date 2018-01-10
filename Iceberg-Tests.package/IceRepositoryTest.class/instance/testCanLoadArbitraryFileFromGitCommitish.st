tests
testCanLoadArbitraryFileFromGitCommitish
	| content entry |

	entry := repository headCommit entryByPath: 'BaselineOfPharoGitTest.package/properties.json'.
	content := entry readStreamDo: [ :stream | stream contents ].
	self
		assert: content
		equals: '{
	 }
' withUnixLineEndings