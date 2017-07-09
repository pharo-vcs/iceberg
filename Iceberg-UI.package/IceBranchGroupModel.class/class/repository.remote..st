instance creation
repository: aRepository remote: aRemote
	^ self repository: aRepository branches: [ :repository | aRemote branchesFrom: repository ] groupName: aRemote asString