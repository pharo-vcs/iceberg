I'm a metacello execution sesssion. 
I will be active during the context of a "metacello load" command, and it will be shared between all dependent baselines/configurations to be traversed in that execution.

Tipically, I will be used to keep some state needed during the full execution, like a choice of what whas selected when conflicting or upgraded versions acts.  