instance creation
from: aGitLogLine repository: anIceRepository
	^ self new 
		repository: anIceRepository;
		initializeFrom: aGitLogLine;
		yourself.
	
	