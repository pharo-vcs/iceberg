execution
execute
	| repositories |
	(UIManager default confirm: 'This operation can take some times depending on the size and number of your repositories. Are you sure you want to fetch all repositories?' label: 'Proceed?')
		ifFalse: [ ^ self ].
		
	repositories := IceRepository registry.
	UIManager default
		informUserDuring: [ :bar | 
			bar max: repositories size.
			bar value: 1.
			repositories
				withIndexDo: [ :each :index | 
					bar label: ('Fetching incoming commits of {1}' format: {each name}).
					bar value: index + 1.
					each fetch ] ].
			
	"Inform an unespecified change to force a refresh"
	Iceberg announcer announce: IceRepositoryModified new