Class {
	#name : 'IceProxySettingsTest',
	#superclass : 'TestCase',
	#instVars : [
		'oldNetworkSettingsHost',
		'oldNetworkSettingsPort'
	],
	#category : 'Iceberg-Tests-Core-Remotes',
	#package : 'Iceberg-Tests',
	#tag : 'Core-Remotes'
}

{ #category : 'asserting' }
IceProxySettingsTest >> assertProxyURLExternalStringHasValue: aString [ 
	
	| value |
	value := Iceberg proxyURLExternalString.
	
	self assert: value isExternalAddress.
	self deny: value isNull.
	
	self assert: value utf8StringFromCString equals: aString
]

{ #category : 'running' }
IceProxySettingsTest >> setUp [ 

	super setUp.

	oldNetworkSettingsHost := NetworkSystemSettings httpProxyServer.
	oldNetworkSettingsPort := NetworkSystemSettings httpProxyPort.	
]

{ #category : 'running' }
IceProxySettingsTest >> tearDown [ 

	NetworkSystemSettings httpProxyServer: oldNetworkSettingsHost.
	NetworkSystemSettings httpProxyPort: oldNetworkSettingsPort.	
	
	super tearDown
]

{ #category : 'tests' }
IceProxySettingsTest >> testConfigureProxyOptWithCorrectProxyUrl [

	| proxyOpt |
	
	NetworkSystemSettings httpProxyServer: 'myproxy.company.com'.
	NetworkSystemSettings httpProxyPort: 8080.
	
	proxyOpt := LGitProxyOptions defaults.
	Iceberg configureLGitProxyOpt: proxyOpt.
	
	self assert: proxyOpt prim_url value equals: Iceberg proxyURLExternalString value.
	self assert: proxyOpt prim_url utf8StringFromCString equals: 'https://myproxy.company.com:8080'.
]

{ #category : 'tests' }
IceProxySettingsTest >> testEmptyHostReturnsNullPointer [

	NetworkSystemSettings httpProxyServer: ''.

	self assert: Iceberg proxyURLExternalString isNull.
]

{ #category : 'tests' }
IceProxySettingsTest >> testHostAndDefaultPortHasCorrectAddress [

	NetworkSystemSettings httpProxyServer: 'myproxy.company.com'.

	self assertProxyURLExternalStringHasValue: 'https://myproxy.company.com:80'.
]

{ #category : 'tests' }
IceProxySettingsTest >> testHostAndPortHasCorrectAddress [

	NetworkSystemSettings httpProxyServer: 'myproxy.company.com'.
	NetworkSystemSettings httpProxyPort: 8080.

	self assertProxyURLExternalStringHasValue: 'https://myproxy.company.com:8080'.
]
