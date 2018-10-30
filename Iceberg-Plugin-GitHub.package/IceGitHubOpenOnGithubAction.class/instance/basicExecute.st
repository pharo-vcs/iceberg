executing
basicExecute
	self class environment
		at: #WebBrowser
		ifPresent: [ :webBrowser | 
			[ | repo |
			repo := self github getRepository: self organisation project: self projectName.
			webBrowser openOn: (repo at: 'html_url') ]
				on: IceGitHubError
				do: [ self inform: 'Invalid Github repository' ] ]
		ifAbsent: [ self inform: 'Feature unavailable in Pharo 6' ]