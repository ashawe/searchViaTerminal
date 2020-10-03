search() {

    first=$1
    search=""
    shift
    for term in $@; do
        search="$search%20$term"
    done
    case "$first" in 
        "-g")
            google $@
            ;;  
        "-yh")
            yahoo $@
            ;;

        "-duk")
            duckduckgo $@
            ;;

        "-bng")
            bing $@
            ;;

        "-wik")
            wikipedia $@
            ;;  

        "-ytb")
            youtube $@
            ;;

        "-vim")
            echo "Searching on Vimeo: $@"
            xdg-open "https://vimeo.com/search?q=$search"
            ;;

        "-img")
            engine=$(<~/.search/.defaultImgSearchEngine.txt)
            $engine $@
            ;;

        "-vid")
            engine=$(<~/.search/.defaultVidSearchEngine.txt)
            $engine $@
            ;;

        "-default")
            echo "Default Search Engine: "
            cat ~/.search/.defaultSearchEngine.txt
            echo "Default Search Engine for Image: "
            cat ~/.search/.defaultImgSearchEngine.txt
            echo "Default Search Engine for Video: "
            cat ~/.search/.defaultVidSearchEngine.txt
            ;;        

        "-setdefault")
            set_default
            ;;

        "--help" | "")
            echo "To search on the internet. Just opens a browser."
            echo "      SYNTAX :         search [-option] [-suboption] search_string"


            echo ""
            echo " search search_string "
            echo "          Will search search_string on default search engine"
            echo ""


            echo "Available options:"
            echo " -g: "
            echo "          searches on google"
            echo "              Available Sub Options:"
            echo "                  -i: "
            echo "                      searches on google images"
            echo "                  -n: "
            echo "                      searches on google news"
            echo "                  -v: "
            echo "                      searches on google videos"
            echo "                  -m: "
            echo "                      searches on google maps"

            echo " -duk: "
            echo "          searches on DuckDuckGo"
            echo "                  -i: "
            echo "                      searches on DuckDuckGo images"
            echo "                  -n: "
            echo "                      searches on DuckDuckGo news"
            echo "                  -v: "
            echo "                      searches on DuckDuckGo videos"
            echo "                  -m: "
            echo "                      searches on DuckDuckGo maps"

            echo " -yh: "
            echo "          searches on yahoo"
            
            echo " -bng: "
            echo "          searches on bing"
	    echo "		Available Sub Options:"
	    echo "		    -i: "
	    echo "			searches on bing images"
	    echo "		    -n: "
	    echo "			searches on bing news"
	    echo "		    -v: "
	    echo "			searches on bing videos"
	    echo "		    -m: "
	    echo "			searches on bing maps"
	    
            echo " -wik: "
            echo "          searches on wikipedia"
            
            echo " -ytb: "
            echo "          searches on youtube"
            
            echo " -vim: "
            echo "          searches on vimeo"

            echo " -img: "
            echo "          searches on default image search engine"
            
            echo " -vid: "
            echo "          searches on default video search engine"

            echo " -default: "
            echo "          shows default search engines"

            echo " -setdefault: "
            echo "          set default search engines"
            ;;
            
        *)
            engine=$(<~/.search/.defaultSearchEngine.txt)
            $engine $first $@
    esac
}



search_init(){
    mkdir ~/.search
    
    touch ~/.search/.defaultSearchEngine.txt
    touch ~/.search/.defaultVidSearchEngine.txt
    touch ~/.search/.defaultImgSearchEngine.txt

    echo "google" > ~/.search/.defaultSearchEngine.txt
    echo "google -i" > ~/.search/.defaultImgSearchEngine.txt
    echo "youtube" > ~/.search/.defaultVidSearchEngine.txt

}

set_default(){
    echo "Change default search engine? ( y / n )"
    read input
    # ["$input" = "y" | "$input" = "Y"] && \
    #     echo "ok"
    # if [ "$input" == "y"  "$input" = "Y" ] \
    #   echo "ok"
    if [ "$input" == "y" ] || [ "$input" == "Y" ] ; then
        echo "1)    Change default search engine"
        echo "2)    Change default search engine for image"
        echo "3)    Change default search engine for video"
        read input
        if [ "$input" -eq 1 ] ; then
            echo "Change default search engine to:"
            echo "  1) Google"
            echo "  2) DuckDuckGo"
            echo "  3) Yahoo"
            echo "  4) Bing"
            read input
            if [ "$input" -eq 1 ] ; then
                echo "google" > ~/.search/.defaultSearchEngine.txt
            elif [ "$input" -eq 2 ]; then
                echo "duckduckgo" > ~/.search/.defaultSearchEngine.txt
            elif [ "$input" -eq 3 ]; then
                echo "yahoo" > ~/.search/.defaultSearchEngine.txt
            elif [ "$input" -eq 4 ]; then
                echo "bing" > ~/.search/.defaultSearchEngine.txt
            else
                echo "Wrong choice"
            fi
        elif [ "$input" -eq 2 ]; then
            echo "Change default search engine for image to:"
            echo "  1) Google"
	    echo "  2) Bing"
	    echo "  3) DuckDuckGo"
            read input
            if [ "$input" -eq 1 ] ; then
                echo "google -i" > ~/.search/.defaultImgSearchEngine.txt
	    elif [ "$input" -eq 2 ]; then
                echo "bing -i" > ~/.search/.defaultImgSearchEngine.txt
	    elif [ "$input" -eq 3 ]; then
                echo "duckduckgo -i" > ~/.search/.defaultImgSearchEngine.txt
            fi
        elif [ "$input" -eq 3 ]; then
            echo "Change default search engine for video to:"
            echo "  1) Youtube"
            echo "  2) Google"
	    echo "  3) Bing"
	    echo "  4) DuckDuckGo"
            read input
            if [ "$input" -eq 1 ] ; then
                echo "youtube" > ~/.search/.defaultVidSearchEngine.txt
            elif [ "$input" -eq 2 ] ; then 
                echo "google -v" > ~/.search/.defaultVidSearchEngine.txt 
	    elif [ "$input" -eq 3 ] ; then 
                echo "bing -v" > ~/.search/.defaultVidSearchEngine.txt 
	    elif [ "$input" -eq 4 ] ; then 
                echo "duckduckgo -v" > ~/.search/.defaultVidSearchEngine.txt 
            fi
        fi
    fi
    
}

bing() {
    first=$1
    search=""   
    case $first in
        "-i")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Bing Image search for: $@"
            xdg-open "https://www.bing.com/images/search?q=$search"
        ;;
      "-v")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Bing Video search for: $@"
            xdg-open "https://www.bing.com/videos/search?q=$search"
        ;;
	"-n")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Bing News search for: $@"
            xdg-open "https://www.bing.com/news/search?q=$search"
        ;;
	"-m")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Bing Maps search for: $@"
            xdg-open "https://www.bing.com/maps?q=$search"
        ;;
    	*)
    	    echo "Searching on bing : $@"
	    for term in $@; do
		search="$search%20$term"
	    done
            xdg-open "https://www.bing.com/search?q=$search"
    esac
}

yahoo() {
    first=$1
    search=""   
    case $first in
        "-i")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Yahoo Image search for: $@"
            xdg-open "https://images.search.yahoo.com/search/images?p=$search"
        ;;
        "-v")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Yahoo Video search for: $@"
            xdg-open "https://video.search.yahoo.com/search/video?p=$search"
            ;;
        "-n")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Yahoo News search for: $@"
            xdg-open "https://news.search.yahoo.com/search/news?p=$search"
            ;;
        "-a")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Yahoo Answers search for: $@"
            xdg-open "https://answers.search.yahoo.com/search/answers?p=$search"
            ;;
        *)
            echo "Searching on Yahoo: $@"
	    for term in $@; do
		search="$search%20$term"
	    done
		    xdg-open "https://search.yahoo.com/search?p=$search"
    esac
}

duckduckgo() {
    first=$1
    search=""   
    case $first in
        "-i")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "DuckDuckGo Image search for: $@"
            xdg-open "https://duckduckgo.com/?q=$search&iax=images&ia=images"
        ;;
        "-v")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "DuckDuckGo Video search for: $@"
            xdg-open "https://duckduckgo.com/?q=$search&iax=videos&ia=videos"
            ;;
        "-n")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "DuckDuckGo News search for: $@"
            xdg-open "https://duckduckgo.com/?q=$search&iar=news&ia=news"
            ;;
        "-m")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "DuckDuckGo Maps search for: $@"
            xdg-open "https://duckduckgo.com/?q=$search&iaxm=maps"
            ;;
        *)
            echo "Searching on Yahoo: $@"
	    for term in $@; do
		search="$search%20$term"
	    done
            xdg-open "https://duckduckgo.com/?q=$search"
    esac
}

google() {
    first=$1
    search=""   
    case $first in
        "-i")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Google Image search for: $@"
            xdg-open "http://www.google.com/search?q=$search&tbm=isch&"
        ;;
        "-v")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Google Video search for: $@"
            xdg-open "http://www.google.com/search?q=$search&tbm=vid"
            ;;
        "-n")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Google News search for: $@"
            xdg-open "http://www.google.com/search?q=$search&tbm=nws"
            ;;
        "-m")
            shift
            for term in $@; do
                search="$search%20$term"
            done
            echo "Google Maps search for: $@"
            xdg-open "https://www.google.com/maps/search/$search/"
            ;;
        *)
            echo "Googling: $@"
            for term in $@; do
                search="$search%20$term"
            done
            xdg-open "http://www.google.com/search?q=$search"
    esac
}

youtube() {
	search=""
    echo "Searching on Youtube: $@"
    for term in $@; do
        search="$search%20$term"
    done
    xdg-open "https://www.youtube.com/results?search_query=$search"
}

wikipedia() {
	search=""
    echo "Searching on Wikipedia: $@"
    for term in $@; do
        search="$search%20$term"
    done
    xdg-open "https://en.wikipedia.org/w/index.php?search=$search"	
}

open() {
    xdg-open "$@" 
}
