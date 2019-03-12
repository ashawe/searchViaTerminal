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
            echo "Searching on Youtube: $@"
            xdg-open "https://vimeo.com/search?q=$search"
            ;;

        "-img")
            engine=$(<~/.search/.defaulImgSearchEngine.txt)
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
            echo "          searches on duck duck go"
            
            echo " -yh: "
            echo "          searches on yahoo"
            
            echo " -bng: "
            echo "          searches on bing"
            
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
    echo "google" > ~/.search/.defaultImgSearchEngine.txt
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
            echo "  2) Duck Duck Go"
            echo "  3) Yahoo"
            echo "  4) Bing"
            read input
            if [ "$input" -eq 1 ] ; then
                echo "google" > ~/.search/.defaultSearchEngine.txt
            elif [ "$input" -eq 2 ]; then
                echo "duck" > ~/.search/.defaultSearchEngine.txt
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
            read input
            if [ "$input" -eq 1 ] ; then
                echo "google -i" > ~/.search/.defaultImgSearchEngine.txt
            fi
        elif [ "$input" -eq 3 ]; then
            echo "Change default search engine for video to:"
            echo "  1) Youtube"
            echo "  2) Google"
            read input
            if [ "$input" -eq 1 ] ; then
                echo "youtube" > ~/.search/.defaultVidSearchEngine.txt
            elif [ "$input" -eq 2 ] ; then 
                echo "google -v" > ~/.search/.defaultVidSearchEngine.txt 
            fi
        fi
    fi
    
}

bing() {
    echo "Searching on bing : $@"
    xdg-open "https://www.bing.com/search?q=$@"
}

yahoo() {
    echo "Searching on Yahoo: $@"
    xdg-open "https://search.yahoo.com/search?p=$@"
}

duckduckgo() {
    echo "Searching on Duck Duck Go: $@"
    xdg-open "https://duckduckgo.com/?q=$@"
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
