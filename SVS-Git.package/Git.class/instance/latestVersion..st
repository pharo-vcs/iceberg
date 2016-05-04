querying
latestVersion: packageName
	| package |
	package := Ice packageNamed: packageName.
	^ (self versionsFor: packageName) detectMax: #versionNumber.