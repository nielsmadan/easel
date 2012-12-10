easel
-----

easel is your one-stop-shop for making color scheme development a breeze. It includes:

* A set of source files in different languages to try out your color scheme.
* Functions and associated keybindings that come in useful when working on your colorscheme.
* A dark canvas scheme to base your own color scheme on (will add a light one in the future).

### quick how-to

Start a new color scheme:

* Copy the dark_canvas directory out of this repo rename it with whatever name you want to use for your color scheme.
* Also rename the file that is in the colors directory and change the name in the line: `let colors_name
   = "dark_canvas"`.

Work on the your color scheme:

* Open one of the files in the test_subjects directory
* Open your color scheme
* source easel.vim (`so easel.vim`) from the plugin directory.

functions and mappings
----------------------

### Highlight and HighlightND (use inside dark_canvas color scheme file)

The canvas includes two vimscript functions that allow the definition of color scheme definitions with less typing. They
assume that colors are defined as pairs of RGB hex colors (as strings) and matching entries in the 256 terminal color scheme
palette ([xtem](www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html)). For example:

    let s:lime = ['#aeee00', 154]

The `Highlight` function (with defaults) can then be called inside the color scheme file:

    s:Highlight('Exception', s:lime, '', 'bold', '')

Which is equivalent to the command:

    highlight guifg=#aeee00 guibg=bg gui='bold' guisp=fg ctermfg=154 ctermbg=bg cterm='bold'

The `HighlightND` function can be called in the same way, but does not add any default values.

### SynStack

This function will show you the syntax groups for the word under the cursor and also copy it to the `s` register
(clobbering whatever was there before, so beware) for easy pasting. It is a slightly modified version of a function posed to
[stackoverflow.com](http://stackoverflow.com/questions/5820793/vim-get-content-of-syntax-element-under-cursor). The
mapping is `<leader><F3>`.

### hexHighlight

This function will replace any hex color codes with the actual colors. It was written by Yuri Feldmann and you can get
it directly as a plugin on [vim.org](http://www.vim.org/scripts/script.php?script_id=2937) or on
[github](https://github.com/vim-scripts/hexHighlight.vim). The mapping to toggle it on or off is `<leader><F4>`. Only
works with gvim.

If you want to redefine the mappings, you can do so at the top of the easel.vim file for now (might make it configurable in the
future at some point).

test subjects
-------------

The goal is to have high quality and real code that shows all the different syntax constructs.

* javascript: `underscore.js` from `underscore` by Jeremy Ashkenas
  ([link](https://github.com/documentcloud/underscore))
* python: `auth.py` from `requests` by Kenneth Reitz ([link](https://github.com/kennethreitz/requests))
* ruby: `base.rb` from `sinatra` by Blake Mizerany ([link](https://github.com/sinatra/sinatra))
* c: `cluster.c` from `redis` by Salvatore Sanfilippo ([link](https://github.com/antirez/redis))

The respective license text has been added to the top of each source file if they weren't included already.

contribute
----------

Pull requests welcome. If you have some idea about what other functions/mappings might be useful when working on a color
scheme or if you have some test subject file in other languages.

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/f0b269640a4a6ece70882a64ad79e823 "githalytics.com")](http://githalytics.com/nielsmadan/easel)
