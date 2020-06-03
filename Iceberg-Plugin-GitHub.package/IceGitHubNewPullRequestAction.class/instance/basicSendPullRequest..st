private
basicSendPullRequest: pullRequest
	| pullRequestDatas url |

	pullRequestDatas := pullRequest send.
	url := pullRequestDatas at: 'html_url'.
	UIManager default 
		inform: 'Pull request created. Click to view on Github.' 
		actionOnClick: [ 
			self class environment 
				at: #WebBrowser 
				ifPresent: [ :webBrowser | webBrowser openOn: url ] 
				ifAbsent: [ self inform: ('Cannot open "{1}" because the project WebBrowser is not present by default in Pharo 6.' format: { url }) ] ]