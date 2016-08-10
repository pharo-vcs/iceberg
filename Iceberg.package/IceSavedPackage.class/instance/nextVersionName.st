querying
nextVersionName

	^ [self latestVersion nextVersionName]
		on: Error do: [ self workingCopy nextVersionName ]