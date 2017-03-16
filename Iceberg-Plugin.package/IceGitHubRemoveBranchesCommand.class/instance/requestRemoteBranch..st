private
requestRemoteBranch: aName
	^ self github
		requestBranch: self remote owner 
		project: self remote projectName
		name: aName