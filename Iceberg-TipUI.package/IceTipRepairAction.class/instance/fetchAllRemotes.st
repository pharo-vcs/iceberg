private
fetchAllRemotes
	| remotes |
	remotes := self repository remotes.
	UIManager default informUserDuring: [ :bar | 
		bar label: 'Fetching incoming commits'.
		bar max: remotes size.
		bar value: 1.
		remotes withIndexDo: [ :each :index |
			bar label: ('Fetching incoming commits of {1}' format: {each name}).
			bar value: index + 1.
			self repository fetchFrom: each ] ].	