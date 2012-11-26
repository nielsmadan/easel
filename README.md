easel
-----

Easel is your one-stop-shop for making color scheme development a breeze. It includes:

* A set of source files in different languages to try out your color scheme.
* Functions and associated keybindings that come in useful when working on your colorscheme
* A dark canvas scheme to base your own color scheme on.

how to use
----------

##start a new color scheme

1. Clone this repo.
2. Copy the dark_canvas directory out and rename it with whatever name you want to use for your color scheme
3. Also rename the file that is in the colors directory and change the name in the line: `let colors_name
   = "dark_canvas"`
4. Open one of the files in the test_subjects directory, open your color scheme, and source easel.vim from the plugin
   directory.


functions
---------

##Highlight and HighlightND (use inside color scheme file)

The canvas includes two vimscript functions that allow the definition of color scheme rules with less typing. They
assume that colors are defined as pairs of RGB hex colors and matching entries in the 256 terminal color scheme
palette ([xtem](www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html)). For example:

    let s:lime = ['#aeee00', 154]

The `Highlight` function (with defaults) can be called:

    call s:Highlight('Exception', s:lime, '', 'bold', '')

Which is equivalent to the command:

    highlight guifg=#aeee00 guibg=bg gui='bold' guisp=fg ctermfg=154 ctermbg=bg cterm='bold'

The `HighlightND` function can be called in the same way, but does not add any default values.

test subjects
-------------

The goal is to have real code that shows all the different syntax constructs.

* javascript: `underscore.js` from `underscore` by Jeremy Ashkenas
  ([link](https://github.com/documentcloud/underscore))
* python: `auth.py` from `requests` by Kenneth Reitz ([link](https://github.com/kennethreitz/requests))
* ruby: `base.rb` from `sinatra` by Blake Mizerany ([link](https://github.com/sinatra/sinatra))
* c: `cluster.c` from `redis` by Salvatore Sanfilippo ([link](https://github.com/antirez/redis))

The respective license text has been added to the top of each source file if they weren't included already.

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/f0b269640a4a6ece70882a64ad79e823 "githalytics.com")](http://githalytics.com/nielsmadan/easel)
