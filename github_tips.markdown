Help on github.com
------------------

- [set up git](http://help.github.com/set-up-git-redirect)
- [create a repo](http://help.github.com/create-a-repo)
- [fork a repo](http://help.github.com/fork-a-repo)

Create a Totally New Project
----------------------------

Create the project directory and some files

	$ mkdir yourproject
	$ cd yourproject
	# just to make sure there is some file to create/update...
	$ touch README

(from this point on you are supposed to be **into the yourproject directory**)

Create an empty repository

	$ git init

Add all your files and commit them!

	$ git add .
	$ git commit -m 'first commit'

Create a web repository 

- go to your user Dashboard on github and just click (create) "New Repository"
- you will get a private access address

Connect your web and local repositiories using your private access address

	$ git remote add origin git@github.com:youruser/yourproject.git

And finally pass your commits to the web repo

	$ git push origin master

Fork an Existing Project
------------------------

Fork an existing project repo:

- log into github.com as youruser
- go to the project you wish to fork
- press fork button 
- copy the private access address

Create (clone) a local repository

	# get the files using the private access address
	$ git clone git@github.com:youruser/hacketyhack.git

	# enter into the just created repository directory
	$ cd hacketyhack

Link to the real 'original'

	# add another remote named 'upstream' with the original from the fork
	$ git remote add upstream git://github.com/hacketyhack/hacketyhack.git

Project Operation
-----------------

UPDATING FROM UPSTREAM

	$ git fetch upstream
	$ git merge upstream/master

CHANGING LOCAL

	# do some wonderful changes first... and ready to commit

	# remove undesired files from directory *and index* (staging the changes)
	$ git rm <filename>
	# rename or move files (staging the changes)
	$ git mv <source> <destination>

	# stage changes *to index*
	# (can undo with $ git reset HEAD ...)
	$ git add .

	# commiting changes (to local repo)
	$ git commit -m "My changes description"

	# or optionally to fully type the message in an editor
	$ git commit

CHANGING INTERNET 

	$ git push origin master

SEEING GIT STATUS

	$ git status
	
	# just the files 
	$ git status -s
	
	# shows the difference between the working tree and the index file.
	# (show diffs of unstaged changes with last staged ones)
	$ git diff
	
	# on linux you can also try
	tig
