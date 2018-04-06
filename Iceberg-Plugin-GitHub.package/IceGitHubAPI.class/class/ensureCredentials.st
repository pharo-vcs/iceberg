credentials
ensureCredentials
	| provider newCredentials |

	provider := IceGitHubCredentialsProvider new. 
	newCredentials := IcePlaintextCredentials new.
	provider providePlaintextCredentialsTo: newCredentials.
	^ newCredentials