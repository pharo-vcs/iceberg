running
tearDown
	dialog ifNotNil: [ [dialog window close] on: LGitNoCredentialsProvided do: [  ] ].