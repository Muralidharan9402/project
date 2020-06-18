read "Enter the local repository directory:" directory
chdir $directory #/etc/ansible/project
git add --all
read "Enter the URL to add project to remote repository:" remotePath
git remote add MovieMax $remotePath  #https://github.com/Muralidharan9402/test_unix_push.git
read "Enter the Commit message:" commitMessage
git commit -am $commitMessage #"Regular auto-commit "
#git pull origin master
#git rebase master

git push $remotePath master #https://github.com/Muralidharan9402/test_unix_push.git master
git merge master
