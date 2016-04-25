querying
latestVersion: packageName
	^ (self versionsFor: packageName) detectMax: #versionNumber.