private
pickOne: aList
	^ UIManager default
		chooseFrom: aList
		values: aList
		lines: (aList collect: [ :each | each projectName, each url asString ]) 
		message: 'Pick your contribution remote'
		title: 'Which remote will you use?'.
