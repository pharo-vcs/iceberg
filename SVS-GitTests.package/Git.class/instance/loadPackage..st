actions
loadPackage: packageName
	| versions latest version | 
	versions := self versionsFor: packageName.
	latest := versions detectMax: #versionNumber.
	version := repository versionFromFileNamed: latest.
	version load