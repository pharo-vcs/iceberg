I am a class that listens to system events and dispatch them to the right iceberg object.
I'm mainly used to mark as dirty packages whose methods and classes are modified.

I'm implemented as class side methods to avoid memory leaks and problems when unsubscribing to events.