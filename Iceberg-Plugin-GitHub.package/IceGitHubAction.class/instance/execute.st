executing
execute
	self withErrorHandlingDo: [ 
		[[ self basicExecute ] on: IceAuthenticationError do: [ :e |
			retries = 0 ifTrue: [ e pass ].
			retries := retries - 1.
			^ self execute.
		]] on: LGitNoCredentialsProvided do: [ ^ self].
		self finishSuccess ]