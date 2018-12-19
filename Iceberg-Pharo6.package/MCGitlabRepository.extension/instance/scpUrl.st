*Iceberg-Pharo6
sshPort
	"In pharo 6 we do not have the code to be able to load gitlab with non default ssh port projects. So we return nil so that #scpUrl does not break."

	^ nil
	