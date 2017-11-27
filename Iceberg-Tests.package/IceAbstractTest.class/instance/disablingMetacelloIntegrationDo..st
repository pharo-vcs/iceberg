auxiliar
disablingMetacelloIntegrationDo: aBlockClosure 
	| oldStatus |
	oldStatus := Iceberg enableMetacelloIntegration.
	Iceberg enableMetacelloIntegration: false.
	aBlockClosure ensure: [ Iceberg enableMetacelloIntegration: oldStatus ]