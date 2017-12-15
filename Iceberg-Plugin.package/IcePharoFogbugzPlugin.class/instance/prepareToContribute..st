actions
prepareToContribute: aRepository
	"I verify the status of Pharo and ensure certain aspects of Pharo are ok"
	| remotes |
	remotes := self pharoRemotesFor: aRepository.
	remotes ifEmpty: [ self inform: 'No remotes pointing to Pharo. You may want to add one.' ].
	
	UIManager default informUserDuring: [ :bar |
		bar max: remotes size + 1.
		remotes do: [ :each |
			bar label: ('Fetching {1}: {2}' format: {each remoteName. each url}).
			aRepository fetchFrom: each.
			bar increment ] ]