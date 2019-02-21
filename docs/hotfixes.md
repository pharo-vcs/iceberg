# Introduction
Assume you have one **master** branch where your current development is done.

You also have an older branch, in this example it is version **1.04**.

You want to change some code in **both** branches. This could happen, if you have to make a hotfix. 

You will create a branch called myFirsthotfix for the fix and merge it in master and in version 1.04.

Each single step will be described.

# local branches
First, open the repository manager

![open repository manager](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-repomanager.png)

Be sure that you have both branches local. 

![branches](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-branches.png)

If you don't have them local, select them from the remote branches and in the menu select checkout branch.

![checkout branch](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-checkout%20branch.png)

You checkout branch 1.04 by right click on it and selecting checkout. This loads the code of the branch 1.04 into your image.

![checkout104](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-checkout104.png)

At the end of this step, you should see your branch 1.04 in bold letters.

# Create a branch for the fix
You create a branch for your fix by click on the branch button in the repository manager. Because you ended in the previous step with 1.04 in bold, this means that the base code for this fix is the code of the version 1.04.

![create branch](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-createbranch.png)

You see that you now have the myFirstHotfix branch as current branch in the lower left corner of the repositories window (myFirstHotfix at 5186269). In this moment the code of 1.04 and myFirstHotfix are the same.

![repository with hotfix ](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-repository.png)

The changes you make in the next step for fixing the bug will be committed into this branch "myFirstHotfix".

# commit your fix in the fix branch
Now fix the bug/change the code. I added one method "aFirstHotfixMethod" to my baseline class. 

The package where the change was done is green now. This tells you there are uncommitted changes. You press the commit button. 

![commit in branch](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-commit%20code%20change%20in%20hotfix%20branch.png)

The code is now committed in the "myFirstHotfix" branch.

![commit](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-commit%20bugfix.png)

You have one more branch in the repositories branches list.

Your new code is only in the myFirstHotfix branch. 

The next steps will add the code to 1.04 and to master.

![3 branches now](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-3branches.png)

myFirstHotfix is written in bold because this is the current branch. 

# commit in 1.04
Switch to branch 1.04 by selecting it and choose "Checkout branch"

The Preview of checkout window tells you that when you load the code of version 1.04, the new method is no longer there because it is only in the current working copy you are about to leave.

![preview 1.04](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-preview104.png)

Now, 1.04 in bold because this is the current branch. 

In the repository manager, select "Merge". In the dialog, you see the current branch (1.04) and you select the branch where you want get the new code from, this is myFirstHotfix.

![merge local 104](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-merge%20hotfix%20into%20104.png)

You see the preview of the merge. It tells you that there is only one method difference between 1.04 and myFirstHotfix. You press Press "Merge" to merge myFirstHotfix into 1.04.

 ![preview of merge 104](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-preview%20of%20merge%20104%20.png)

This creates a merge of the myFirstHotfix code into the current 1.04 working copy.

At the end of this step, you merged the new code into version 1.04. No change yet to master.

Until now, everything is done local.

Now push this into the remote repository by clicking on push. The code is pushed to 1.04 on the remote. 

![push](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-push.png)

# commit in master
You are not finished because you want to apply this changes also in master. For this, change the repository to master so that is appears in bold in the repository (checkout branch). If this branch is much newer than the branch from where you started your hotfix (in this example, 1.04) then you see a lot of code here. It shows all the code which is not in the hotfix (because this started in the old version 1.04) but in the target. This is ok, because we have a lot of new stuff in the new version. But we also want this simple new fix of myFirstHotfix in our master version. We assume that there are no conflicts e.g. the method already existing.

![preview master](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-preview%20master.png)

press checkout.

merge

 ![merge master ](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-preview%20merge%20master.png)

Now you have 2 commits to push. One is for the new method and the other is for the methods which have been added in the meantime between 1.04 and master. (can someone please confirm this? i am not sure)

![2 commits](https://github.com/SabineMa/iceberg/blob/master/docs/images/hotfix-2commits.png)

 







 
