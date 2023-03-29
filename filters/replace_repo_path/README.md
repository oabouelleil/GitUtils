# Replace Repo Path Git Filter

The Replace Repo Path Git Filter is a utility that replaces all occurrences of the repository path in specified files with a standard string when committing changes. During checkout, the standard strings are replaced with the actual repository path. This filter is designed to work with both forward slashes and backslashes.

Forward slash paths are replaced with the string `__‎REPO_PATH‎__`.

Backslash paths are replaced with the string `__‎REPO_PATH_BACKSLASH‎__`.

## Prerequisites

- Git version 1.5.3 or later

## Usage

Follow the steps below to set up the Replace Repo Path Git Filter for your repository.

### 1. Set up the filter script

Copy the [Filter Script](filter_replace_repo_path.sh) into a suitable location in your repository, such as `replace_repo_path/filter_replace_repo_path.sh`.

### 2. Update Git configuration

Add the following lines to your Git configuration. This can be done in your global `.gitconfig` file or the repository's local `.git/config` file, or in a file inside your repository by following the steps below:

```
[filter "replace_repo_path"]
    clean = /path/to/filter_replace_repo_path.sh clean
    smudge = /path/to/filter_replace_repo_path.sh smudge
```

Replace `/path/to/` with the actual path to the `filter_replace_repo_path.sh` script.

Since git filters are configured in your Git configuration, there is no way to have them automatically applied when pulled from a remote repository. A way around this is:

1. Place these configs in any file in your repository. This repo uses the [following file](../.gitconfig).
2. Place the following commands in a script similar to this [Git Config Script](../gitconfig.sh):
    ``` bash
    #!/bin/bash

    # This will tell git to use your custom gitconfig
    git config --local include.path ../.gitconfig

    # This will force git to recheck and "reapply" gitattributes changes.
    git rm --cached -r .
    git reset --hard
    ```
3. Run this script whenever you clone your repository

### 3. Create or update the .gitattributes file

In your repository's root directory, create a `.gitattributes` file or update the existing one. Specify the files or file types you want the filter to be applied to by adding a line with the following format:

```
pattern filter=replace_repo_path
```

Replace `pattern` with the file type or specific file path you wish to filter. For example, to apply the filter to all `.txt` files, you would add the following line:

```
*.txt filter=replace_repo_path
```

## Example

Once you've completed the setup, you can test the filter by adding or modifying a file that matches the pattern specified in `.gitattributes`. After committing and checking out the file, you should see the repository path strings replaced as described below:

### Forward Slash Path

`__REPO_PATH__/replace_repo_path`

Replaced with:

`__‎REPO_PATH‎__/replace_repo_path`

### Backslash Path

`__REPO_PATH_BACKSLASH__\replace_repo_path`

Replaced with:

`__‎REPO_PATH_BACKSLASH‎__\replace_repo_path`

When the file is checked out, the standard strings will be replaced with the actual repository path, preserving the original forward slashes or backslashes.

## License

This Replace Repo Path Git Filter is released under the [MIT License](../LICENSE).
