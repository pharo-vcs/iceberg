credentials
ensureCredentials
	| provider |

	provider := IceCredentialsProvider defaultForHost: 'github.com'. 
	^ provider providePlaintextCredentials.