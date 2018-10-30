executing
basicExecute
	[ 
	
	| url |
	url := (self github getRepository: self organisation project: self projectName) at: 'html_url'.
	
	self class environment at: #WebBrowser ifPresent: [ :webBrowser | webBrowser openOn: url ] ifAbsent: [ self inform: ('Cannot open "{1}" because the project WebBrowser is not present by default in Pharo 6.' format: { url }) ] 
	
	]
		on: IceGitHubError
		do: [ self inform: ('Invalid Github repository. No project named "{1}" found for the owner "{2}"' format: {self projectName. self organisation}) ]