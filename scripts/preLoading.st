"Shutdown Libgit"
(Smalltalk classNamed: #LGitLibrary) shutDown: true.

(Smalltalk classNamed: #IceSystemEventListener) unregisterSystemAnnouncements.
(Smalltalk classNamed: #Iceberg) enableMetacelloIntegration: false.

"Unregister all iceberg repository adapters since we are going to unload all code related to it.
Otherwise obsolete instances will stay".
(Smalltalk classNamed: #IceRepository) registry copy do: [ :each | each forget ].
(Smalltalk classNamed: #IceMetacelloRepositoryAdapter) allInstances do: #unregister.

"Workaround to avoid keeping an entry in World Menu to the obsolete class."
((Smalltalk classNamed: #IceTipRepositoriesBrowser) class>>#menuCommandOn:) removeFromSystem.

"Working copy keeps some annoying references that prevent a correct clean up. 
 this is a hack to keep one element in the registry (needed for the tests)"
MCWorkingCopy registry becomeForward: (MCWorkingCopy registry select: [ :each | each packageName = 'MonticelloMocks' ]).

"Remove iceberg from system (so I can reload it)"
MetacelloPlatform select.

#(
	'Calypso-SystemPlugins-Monticello-Browser'
    'BaselineOfLibGit'
    'BaselineOfIceberg'
    'Iceberg-UI' 
    'Iceberg-TipUI'
    'Iceberg-Plugin-Pharo' 
    'Iceberg-Plugin-Metacello' 
    'Iceberg-Plugin-GitHub'
    'Iceberg-Plugin-Migration'
    'Iceberg-Plugin' 
    'Iceberg-Metacello-Integration' 
    'Iceberg-Libgit-Tonel' 
    'Iceberg-Libgit-Filetree' 
    'Iceberg-Libgit' 
    'Iceberg-Tests'
    'Iceberg-Memory'
    'Iceberg-UI-Tests'
    'Iceberg-Core' 
    'Iceberg-Changes' 
    'Iceberg-Adapters' 
    'Iceberg'
    'Iceberg-GitCommand'
    'Iceberg-SmartUI'
    'Iceberg-Pharo6'
    'LibGit-Core'
)
do: [ :each |
    (each asPackageIfAbsent: [ 
        (each , ' not found') traceCr.
        nil ])
            ifNotNil: [ :package |
                ('Removing ', each) traceCr.
                package removeFromSystem ] ]
