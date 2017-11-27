running
runCase
	"Enable metacello integration"
	| oldState |
	oldState := Iceberg enableMetacelloIntegration.
	Iceberg enableMetacelloIntegration: true.
	[ super runCase ]
		ensure: [ Iceberg enableMetacelloIntegration: oldState ]