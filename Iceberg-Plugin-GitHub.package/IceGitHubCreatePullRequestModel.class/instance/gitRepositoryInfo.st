private
gitRepositoryInfo
	^ gitRepositoryInfo ifNil: [ 
		gitRepositoryInfo := self requestGitRepositoryInfo ]