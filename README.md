# vim-cdroot

Simple vim script to change directory to the project root.
In contrast to other similar plugins, this one behaves properly if configuration files are managed via a git repository in the home directory.
Stops as soon as `$HOME` or `/` is reached while ascending directories to search the project root directory.

To configure the project root markers, set `g:cdroot_markers`:

```vim
let g:cdroot_markers = ['.projectroot', '.git', '.hg', '.bzr', '.svn'] " default markers
```

For more configurability, see [vim-projectroot](https://github.com/dbakker/vim-projectroot) or [vim-rooter](https://github.com/airblade/vim-rooter).
