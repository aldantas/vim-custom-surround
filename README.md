# vim-custom-surround

It's a simple plugin that lets you surround the word under cursor or the current
selection with custom strings.

To use it, just call one of the mode-specific commands:

```vim
    :SurroundWord <text before> <text after>
    :SurroundSelection <text before> <text after>
 ```

 Or, even better, define a normal and visual mapping for the specified surround strings
 using the function `customsurround#map`. For example, to map a LaTeX inline math function
 just do:

```vim
     call customsurround#map('<Leader>m', '\(', '\)')
```

## Installation

Use your prefered plugin manager.  For Vundle, add

```vim
Plugin 'augustold/vim-custom-surround'
```

to your `.vimrc`.
