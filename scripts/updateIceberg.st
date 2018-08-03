"Shutdown Libgit"
LGitLibrary shutDown: true.

"Unregister all iceberg repository adapters since we are going to unload all code related to it.
Otherwise obsolete instances will stay".
IceMetacelloRepositoryAdapter allInstances do: #unregister.

"Remove iceberg from system (so I can reload it)"
MetacelloPharoPlatform select.
#(
    'BaselineOfTonel'
    'BaselineOfLibGit'
    'BaselineOfIceberg'
    'MonticelloTonel-Core'
    'MonticelloTonel-FileSystem'
    'MonticelloTonel-Tests'
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
    'LibGit-Core') 
do: [ :each |
    (each asPackageIfAbsent: [ 
        (each , ' not found') logCr.
        nil ])
            ifNotNil: [ :package |
                ('Removing ', each) logCr.
                package removeFromSystem ] ].

Metacello new
    baseline: 'Iceberg';
    repository: 'filetree://./';
    load.

(Smalltalk at: #IcePharoPlugin) addPharoProjectToIceberg