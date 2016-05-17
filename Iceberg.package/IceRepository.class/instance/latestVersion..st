querying
latestVersion: packageName
	| package |
	package := Ice packageNamed: packageName.
	^ (self versionsFor: package) detectMax: #versionNumber.