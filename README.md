# GitUtils
GitUtils is a collection of useful Git utilities and scripts designed to enhance and streamline your Git experience. The repository includes a variety of tools, starting with the path replacement filter described below. As more utilities are added, this README will be updated accordingly.

## Replace Repo Path Git Filter

The `replace_repo_path` filter is a utility that replaces occurrences of the repository path with a standard string in your files. When files are checked out, the standard string is replaced with the actual repository path. This filter works with both forward slashes and backslashes.

To learn more about the `replace_repo_path` filter and how to set it up, check out the [Replace Repo Path README](filters/replace_repo_path/README.md).

## Usage

When you first clone the repository, run the provided `gitconfig.sh` script to apply the necessary Git configurations:

```bash
./gitconfig.sh
```
This script will update your local Git configuration, include the custom .gitconfig file, and apply .gitattributes.

## Contributing
If you have a useful Git script or tool that you'd like to add to the collection, please feel free to open a pull request or create an issue with your suggestion.

## License
This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.