# SearchViaTerminal
Helps to search anything via the terminal.
* search from terminal. Open in browser
* search on different websites
* search specifically for videos / images

## Why should I use it?
Imagine, you're working on a project and you want to search for an image of a cat. Now, who want's to open up a browser and then type the search terms and then tailor the results on the basis of images or videos etc when you can do it with one single handy and easy to use command. Just type the command and the rest will be taken care of. Want images of cute cats? Done. With a single command just from your terminal. We all have our terminals open don't we? So why waste time? Use searchViaTerminal!

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

 `-duk`: searches on DuckDuckGo:
> Available Sub Options for DuckDuckGo:\
                  `-i`: 
                      searches on DuckDuckGo images\
                  `-n`: 
                      searches on DuckDuckGo news\
                  `-v`: 
                      searches on DuckDuckGo videos\
                  `-m`: 
                      searches on DuckDuckGo maps

 `-yh`:  searches on Yahoo
> Available Sub Options for Yahoo:\
                  `-i`: 
                      searches on Yahoo images\
                  `-n`: 
                      searches on Yahoo news\
                  `-v`: 
                      searches on Yahoo videos\
                  `-a`: 
                      searches on Yahoo answers



 `-bng`: searches on bing
 > Available Sub Options for bing:\
                  `-i`: 
                      searches on bing images\
                  `-n`: 
                      searches on bing news\
                  `-v`: 
                      searches on bing videos\
                  `-m`: 
                      searches on bing maps

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
 * Direct search using `google search_string` command
 * Direct search using `youtube search_string` command
 * Direct search using `duckduckgo search_string` command
 * Direct search using `bing search_string` command
 * Direct search using `yahoo search_string` command
 * Direct search using `wikipedia search_string` command

 
 ## To-Do List:
 - [x] Add Yahoo support for images
 - [x] Add Yahoo support for videos
 - [x] Add Yahoo support for news
 - [x] Add Yahoo support for answers

 - [x] Directly search for video
 - [x] Directly search for image
 - [x] Option to select default search engine
 - [x] Add Bing support for images
 - [x] Add Bing support for videos
 - [x] Add Bing support for news
 - [x] Add Bing support for maps
 - [x] Add DuckDuckGo support for images
 - [x] Add DuckDuckGo support for videos
 - [x] Add DuckDuckGo support for news
 - [x] Add DuckDuckGo support for maps
