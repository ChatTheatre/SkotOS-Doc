# SkotOS Pull Requests

SkotOS uses a pretty standard GitHub workflow for most of what it does. Let's talk about that here, and about a few SkotOS-specific extensions.

## Pull Requests

SkotOS uses normal GitHub Pull Requests. Want to add a feature? You can file an issue - that's a great way to get comments. It would be a shame if you were working in the wrong repo, or if there were already a way to do what you want. It's always good to save work!

If you're sure you're in the right repo, or if you've already done the work for yourself, you may just want to put together a Pull Request and file it against a ChatTheatre repo - SkotOS for core library work, game-specific spots like gables_game for game extensions, Orchil for the web client and so on. That's part of why it's good to file an issue first - it can be hard to keep track of all the pieces, and the best place to fix a specific problem.

The ChatTheatre team should get back to you promptly, within a few days, about your issue or Pull Request. That's not necessarily for a final resolution - just a quick comment or answer of some kind. Some issues are addressed rapidly ("this belongs in the Orchil repo, we would welcome a Javascript-based fix") while others may take a long time ("that feature is on our roadmap, but not very soon.")

If a PR looks basically good then the ChatTheatre team should get around to reviewing and merging it for you. It's strongly preferred to let somebody else look over your change before it gets merged, even if you have permission to merge it. SkotOS staff: please let people know via a GitHub comment or Signal conversation that you are self-merging and why (e.g. "this is just a documentation change and it's holding up another PR.") Self-merging is okay for docs or other non-code, but please try to get review for code whenever possible.

If your change gets comments, please address them when you can - that may mean changing your PR, or it may mean arguing your case ("actually I think this *is* the right way to do it because...")

## CLAs

Some ChatTheatre repos (e.g. SkotOS) use a contributor agreement called a CLA. For those repos, there should be a CLA.md markdown file which you can sign and a CLA-signed directory with signed agreements from other contributors.

If you contribute to one of those repos, please read CLA.md carefully, then add your name and gpg signature. You can then submit a PR adding your signed CLA to the CLA-signed directory.

## How To Make a Pull Request

This is general Git info rather than anything SkotOS-specific.

First, you'll want to fork the appropriate repo into your own account. If you're logged into GitHub, there should be a "plus" button in the upper right from which you can choose "New Repository". It will make a copy ("fork") of the repo in your own GitHub account.

Next clone the repository and make sure it's up to date. For my repositories I like to add an "upstream" Git remote to make it easy to update later. For example:

~~~
git remote add upstream git@github.com:ChatTheatre/SkotOS-Doc.git  # Add the remote for ChatTheatre/SkotOS-Doc

git checkout master && git pull upstream master # Make sure the master branch is up-to-date with upstream
~~~

Once you have an up-to-date fork in your account, create a new branch, make changes and push it to your own fork:

~~~
git checkout master
git checkout -b name_of_my_lovely_new_feature
vi some_file.txt
git add some_file.txt && git commit -m "Awesome new changes"
git push --set-upstream origin name_of_my_lovely_new_feature
~~~

Now if you head over to GitHub's page for the ChatTheatre repo (e.g. https://github.com/ChatTheatre/SkotOS-Doc), GitHub should tell you that you have a recent push to a branch on that repo. It will offer to let you create a new Pull Request (how polite of it!)

You can review your changes in the new PR to make sure you have only what you meant to include. Then you can open the PR and wait for the ChatTheatre team to review it.

If there are any changes needed (e.g. you see a problem later, or you need to re-merge with master) then you can make more commits to the same Git branch. Until you hit "merge" on the Pull Request, new commits will be automatically added to the PR. You don't have to do anything special, just reload the page on GitHub and you should see your changes.

## Outdated PRs

Sometimes other commits will happen in master and your PR will become un-mergeable. Normally that means you need to re-merge with master and re-push.

~~~
git checkout master && git pull upstream master
git checkout name_of_my_lovely_new_feature
git merge master
# Now fix any conflicts and do a quick check and test - is anything broken by the new changes?
git push
~~~

And now your branch should show up as mergeable in GitHub. You may have to reload the GitHub page in your browser.
