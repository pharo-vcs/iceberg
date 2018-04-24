utilities
issuesClosedOn: repoName milestone: milestone 
	"Answers a string with a list and description of items closed on a milestone. 
	 Used to paste it as explanations on releases, etc.
	 Example: 
	 	self issuesClosedOn: 'pharo-vcs/iceberg' milestone: '0.7.3'"
	
	| project api issues |
	
	api := self new.
	project := '/repos/', repoName.
	issues := (api get: project, '/milestones')
		detect: [ :each | (each at: 'title') = milestone ]
		ifFound: [ :each | 
			api 
				get: project, '/issues'
				parameters: { 
					'milestone' -> (each at: 'number') asString.
					'state' -> 'closed' } asDictionary ]
		ifNone: [ #() ].
	
	^ String streamContents: [ :stream |  
		issues 
			do: [ :each | 
				stream << '- #' << (each at: 'number') << ': ' << (each at: 'title').
				each 
					at: 'labels' 
					ifPresent: [ :labels | 
						stream << ' ('.
						labels 
							do: [ :eachLabel | stream << (eachLabel at: 'name') ]
							separatedBy: [ stream << ', ' ].
						stream << ')' ] ]
			separatedBy: [ stream << String lf ] ]