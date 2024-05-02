# GitHub actions testing

This repo holds GitHub action definitions for pipeline creation on GitHub.  
In my humble opinion GitLab is a better tool for this, but a task is a task.

I was not able to run the python greeting app for some reason. Even manually launching the greeting apps using pm2. The application errors out 15 times and does not launch.  
I was able to launch the `app.py`, but that has a hardcoded port and it would be too out of scope for this task to try to modify it after cloning the repository.

To get the registration token, run:

```bash
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/OWNER/REPO/actions/runners/registration-token
```

or go to [actions -> runners](https://github.com/jikaven/testing-cicd/settings/actions/runners/new) for the repo.
