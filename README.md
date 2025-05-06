# The_Parlour
Making Moves

## Git guidelines

### Starting fresh from main
Before making any changes, in godot, do the following:

Identify what branch you are on by looking in the bottom left corner of vscode, or by looking at the branch prompt in git bash, or by running `git status`. 

If you are not on main, then run `git switch main`. 

Once you are on main, run `git fetch`, then `git status`. If it says you are behind remote, then run `git pull`. 

Then make a new branch by running `git switch -c your-branch-name-here` (this will create the branch and switch to it)
(It is good practice to name your branch after whatever you are working on e.g. raf-enemy-spawner)

Then make changes to your heart's content. 

### Saving changes
Pretty sure we are all familiar with this, but save your changes by running:
`git add .`
`git commit -m "describe your changes"`
If you want to be able to access your changes from another device but you don't want to merge with main yet, then run:
`git push -u origin your-branch-name-here`
This will make a branch with the same name in the remote repository. 

### Merging with main
When you want to merge your changes with the main project, make sure you having added and committed any changes you want to keep. Any uncommitted changes that you don't want can be discarded by running `git stash`
Then make sure you are still on your branch and you have nothing left to commit by running `git status`. 

Then run:
`git rebase main`
Make sure you are on your branch before running this. Never rebase when on main. Rebasing will bring any changes on main that you do not have over to your branch. If you think there will be conflicts with main, you can run `git rebase -i main` (or just phone a friend)

Then once the rebase is done, switch to main:
`git switch main`

Then run:
`git merge your-branch-name-here`
This should be able to merge automatically easily and smoothly as the rebase will have lubed your throbbing branch up. 

The once your branch is merged on main, run:
`git push`

And BOOM your changes are now on main and are ready to be used by everyone. 

Then start the process again by making a new branch. 


## List of changes / improvements

- The attack component is too tied up in player function.

- Need to finish adding animations to the enemies



