# SearchViaTerminal
Helps to search anything via the terminal.
* search from terminal. Open in browser
* search on different websites
* search specifically for videos / images

## INSTALLATION:

* Download the file .bash_aliases
* Place it in your home ( ~ ) folder.
* The file is a hidden file so make sure you enable "show hidden files" in files or else navigate to the directory where the file is downloaded and execute the command `cp .bash_aliases ~/`
* Open the terminal at home ( ~ )
* Give it execute permission:
  * `chmod +7 .bash_aliases`
* Then run the command:
  * `search_init` ( to initialise the default search engines )


In case you're getting `Command 'search_init' not found` you need to follow these steps:
* open the file ~/.bashrc using a text editor like gedit (`gedit ~/.bashrc`) or sublime, (`subl ~/.bashrc`) or any other...
* Make sure you have the following code in it:
  ``` 
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi
    ```
* otherwise add the above code at the end of the file

Make sure your system has `xdg-open`


NOW YOU CAN USE THE SEARCH FEATURES!!

## HOW TO USE:
  SYNTAX :
  
  `search [-option] [-suboption] search_string`\
          Will search according to parameters on search engine
          
  `search search_string`\
          Will search search_string on default search engine
          
###### Available options:

 `-g`: searches on google

> Available Sub Options for google:\
                  `-i`: 
                      searches on google images\
                  `-n`: 
                      searches on google news\
                  `-v`: 
                      searches on google videos\
                  `-m`: 
                      searches on google maps

 `-duk`: searches on duck duck go
   
 `-yh`:  searches on yahoo

 `-bng`: searches on bing

 `-wik`: searches on wikipedia

 `-ytb`: searches on youtube

 `-vim`: searches on vimeo

 `-img`: searches on default image search engine

 `-vid`: searches on default video search engine

 `-default`: shows default search engines

 `-setdefault`: set default search engines

 `--help`: displays help
 
 ## Default Search Engines:
 * Google for web
 * Google for images
 * Youtube for videos
 
 ## Additional Features:
 * Open any URL using `open "website_url"` ( make sure to use http://  or https:// )
 * Direct search using `google search_term` command
 * Direct search using `youtube search_term` command
 * Direct search using `duckduckgo search_term` command
 * Direct search using `bing search_term` command
 * Direct search using `yahoo search_term` command
 * Direct search using `wikipedia search_term` command

 
 ## To-Do List:
 - [x] Directly search for video
 - [x] Directly search for image
 - [x] Option to select default search engine
 - [ ] Add Bing support for images
 - [ ] Add Yahoo support for images
 - [ ] Add Duck Duck GO support for images
 - [ ] Add Bing support for videos
 - [ ] Add Yahoo support for videos
 - [ ] Add Duck Duck GO support for videos
