# Replace Repo Path Git Filter
The [Filter Script](filter.sh) can be used to create a git filter that replaces all occurrences of the repository path with a standard string. And then replaces this string with the path in the working tree. It is made to work with both forward slashes and backslashes.

Forward Slash Paths are replaced with the string `__‎REPO_PATH‎__`.

Backslash Paths are replaced with the string `__‎REPO_PATH_BACKSLASH‎__`.

## Usage
**Note: Since git filters are configured in your git config file, there is no way to have them automatically applied when pulled from a remote repository. A way around this is:**

1. Place these configs in any file in your repository. This repo uses the [following file](../.gitconfig).
2. Run the following commands when you first pull your repository (or put them in a file similar to  this [Git Config Script](../gitconfig.sh)):

    ``` bash
    #!/bin/bash

    # This will tell git to also use your custom gitconfig
    git config --local include.path ../.gitconfig

    # This will force git to recheck and "reapply" gitattributes changes.
    git rm --cached -r .
    git add -A
    ```


### 1. Create the filter
Add the following lines to your git config:
```
[filter "replace_repo_path"]
    clean = /path/to/filter_replace_repo_path.sh clean
    smudge = /path/to/filter_replace_repo_path.sh smudge
```

### 2. Assign the filter to your files
In the `.gitattributes` file of your repo, add the following (Replacing *.txt with the files you wish to filter):
```
*.txt filter=replace_repo_path
```

## Demonstration
Once you pull the repo and run the [Git Config Script](../gitconfig.sh) you should see the strings replaced with your path below.

### Forward Slash Path
`__REPO_PATH__/replace_repo_path`

### Backslash Path
`__REPO_PATH_BACKSLASH__\replace_repo_path`

