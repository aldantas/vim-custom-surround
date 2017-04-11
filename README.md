# vim-custom-surround

It's a simple plugin that lets you surround the word under cursor or the current
selection with custom strings.

To use it, just call one of the mode-specific commands:

```vim
    :SurroundWord <text before> <text after>
    :SurroundSelection <text before> <text after>
 ```

You can make your own normal and visual mappings for the above commands, or just use the function
`customsurround#map` to do both for you. For example, to map a LaTeX inline math function just do:

```vim
     call customsurround#map('<Leader>m', '\(', '\)')
```

See the doc for more detailed explanations:

```vim
     :h vim-custom-surround
```

## Installation

Use your prefered plugin manager.  For Vundle, add

```vim
    Plugin 'augustold/vim-custom-surround'
```

to your `.vimrc`.
