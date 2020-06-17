chdir /etc/ansible/project/worktree
git add --all
git remote add MovieMax https://github.com/Muralidharan9402/test_unix_push.git
git commit -am "Regular auto-commit "
#git pull origin master
#git rebase master

git push https://github.com/Muralidharan9402/test_unix_push.git master
git merge master
