*Iceberg-Metacello-Integration
execute: statements

	MetacelloPlatform current withMetacelloLoadSessionDo: [ 
		super execute: statements ]