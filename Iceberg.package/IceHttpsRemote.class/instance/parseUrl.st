private
parseUrl
	| parsedUrl |
	parsedUrl := url asZnUrl.
	host := parsedUrl host.
	projectName := parsedUrl pathSegments atLast: 1.
	owner := parsedUrl pathSegments atLast: 2
