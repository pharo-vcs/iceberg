private
remoteBranches
	^ branches ifNil: [ branches := self requestRemoteBranches ]