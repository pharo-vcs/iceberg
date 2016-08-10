commits
commitsFromUpstream
	^ self backend commitsFromUpstream 
		do: [ :commit | commit repository: self ];
		yourself