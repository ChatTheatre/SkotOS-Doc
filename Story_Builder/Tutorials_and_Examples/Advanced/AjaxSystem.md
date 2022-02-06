# The Ajax System

## What is AJAX?

AJAX stands for "Advanced Javascript And XML", and is a method which is widely used on the web to make web sites appear more like regular applications on your computer. Traditional web design goes in "steps", like so:

```
          page load
                |
          page display
                |
      user interaction
                |
      server processing
                |
          page reload
                |
          page display 
                |
      user interaction
                |
     ...
```

For every user action, the same page is reloaded on-screen, or a different page is loaded. In some cases, it makes sense, just as it makes sense in regular applications to sometimes display a whole different screen to the user, but more often than not, a web site with "controls" forces the user to watch the exact same screen reload over and over. A perfect example is the Tree of Woe. Imagine the amount of time you'd save if Woe **didn't** reload every time you clicked "N" for new detail/sname/whatever!

AJAX works differently. Using AJAX, it's possible to make web sites work more similarly to how regular applications do. AJAX interaction can be described as so:

```
                          page load
                                |
                          page display
                                |
                        user interaction
                      /                  \ 
                      |         server processing
            page stays loaded         |
                      |          results sent back
                      |              |
                        \             /
                  page handles results
                                |
     ...
```

The above method results in a "more solid" appearance, but also helps save both time and resources -- loading a result set from the server is a lot cheaper than reloading an entire web page for every single user action, and it's also a lot faster, which saves the user's time.

KalleAlm - 20 Dec 2006
