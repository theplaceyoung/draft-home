# Draft Co - GitHub Pages
This repository contains the source files for the GitHub Pages deployed website for **Draft Co**.

### Contents
+ build/: Contains the built static files for the website.
+ .gitignore: Defines which files and directories to ignore in version control.
+ .nojekyll: Ensures that GitHub Pages treats files as static files, not processed by Jekyll.
+ README.md: This README file.
+ index.html: Main HTML file of the website.

### Deployment
The website is hosted on GitHub Pages and updates automatically when changes are pushed to the gh-pages branch.
You can view the live site at <http://draft.best>.

### Building the Website Locally
1. Ensure that you have Flutter installed.
2. Run the following commands to build the web version:
   ```git checkout gh-pages```
   ```flutter build web```
3. Once built, commit and push the changes to the gh-pages branch to reflect them on the live site.


