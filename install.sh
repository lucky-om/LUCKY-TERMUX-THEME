#bin/bash
clear
# dx color
r='\033[1;91m'
p='\033[1;95m'
y='\033[1;93m'
g='\033[1;92m'
n='\033[1;0m'
b='\033[1;94m'
c='\033[1;96m'

# dx Symbol
X='\033[1;92m[\033[1;00m⎯꯭̽𓆩\033[1;92m]\033[1;96m'
D='\033[1;92m[\033[1;00m〄\033[1;92m]\033[1;93m'
E='\033[1;92m[\033[1;00m×\033[1;92m]\033[1;91m'
A='\033[1;92m[\033[1;00m+\033[1;92m]\033[1;92m'
C='\033[1;92m[\033[1;00m</>\033[1;92m]\033[92m'
lm='\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
dm='\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'

# dx icon
    OS="\uf6a6"
    HOST="\uf6c3"
    KER="\uf83c"
    UPT="\uf49b"
    PKGS="\uf8d6"
    SH="\ue7a2"
    TERMINAL="\uf489"
    CHIP="\uf2db"
    CPUI="\ue266"
    HOMES="\uf015"

sp() {
    IFS=''
    sentence=$1
    second=${2:-0.05}
    for (( i=0; i<${#sentence}; i++ )); do
        char=${sentence:$i:1}
        echo -n "$char"
        sleep $second
    done
    echo
}

tr() {
# Check if curl is installed
if command -v curl &>/dev/null; then
    echo ""
else
    pkg install curl -y &>/dev/null 2>&1
fi
if command -v ncurses-utils -y &>/dev/null; then
    echo ""
else
    pkg install ncurses-utils -y >/dev/null 2>&1
fi
}

spin() {
echo
    local delay=0.40
    local spinner=('█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█')

    # Function to show the spinner while a command is running
    show_spinner() {
        local pid=$!
        while ps -p $pid > /dev/null; do
            for i in "${spinner[@]}"; do
                tput civis
                echo -ne "\033[1;96m\r [+] Installing $1 please wait \e[33m[\033[1;92m$i\033[1;93m]\033[1;0m   "
                sleep $delay
                printf "\b\b\b\b\b\b\b\b"
            done
        done
        printf "   \b\b\b\b\b"
        tput cnorm
        printf "\e[1;93m [Done $1]\e[0m\n"
        echo
        sleep 1
    }

    apt update >/dev/null 2>&1
    apt upgrade -y >/dev/null 2>&1

    # List of packages to install
    packages=("git" "python" "ncurses-utils" "jq" "figlet" "termux-api" "lsd" "zsh" "ruby" "exa")

    # Install each package with spinner
    for package in "${packages[@]}"; do
        pkg install "$package" -y >/dev/null 2>&1 &
        show_spinner "$package"
    done

pip install lolcat >/dev/null 2>&1
rm -rf data/data/com.termux/files/usr/bin/chat >/dev/null 2>&1
mv $HOME/LUCKYX/files/chat.sh /data/data/com.termux/files/usr/bin/chat
chmod +x /data/data/com.termux/files/usr/bin/chat
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh >/dev/null 2>&1
rm -rf /data/data/com.termux/files/usr/etc/motd
chsh -s zsh
rm -rf ~/.zshrc >/dev/null 2>&1
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions /data/data/com.termux/files/home/.oh-my-zsh/plugins/zsh-autosuggestions >/dev/null 2>&1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /data/data/com.termux/files/home/.oh-my-zsh/plugins/zsh-syntax-highlighting >/dev/null 2>&1
}
# dx setup
setup() {
# dx move
ds="$HOME/.termux"
dx="$ds/font.ttf"
simu="$ds/colors.properties"
if [ -f "$dx" ]; then
    echo
else
	cp $HOME/LUCKYX/files/font.ttf "$ds"
fi

if [ -f "$simu" ]; then
    echo
else 
        
	cp $HOME/LUCKYX/files/colors.properties "$ds"
fi
cp $HOME/LUCKYX/files/ASCII-Shadow.flf $PREFIX/share/figlet/
mv $HOME/LUCKYX/files/remove /data/data/com.termux/files/usr/bin/
chmod +x /data/data/com.termux/files/usr/bin/remove
termux-reload-settings
}
dxnetcheck() {
clear
echo
echo -e "               ${g}╔═══════════════╗"
echo -e "               ${g}║ ${n}</>  ${c}LUCKY-X${g}   ║"
echo -e "               ${g}╚═══════════════╝"
echo -e "  ${g}╔════════════════════════════════════════════╗"
echo -e "  ${g}║  ${C} ${y}Checking Your Internet Connection¡${g}  ║"
echo -e "  ${g}╚════════════════════════════════════════════╝${n}"
while true; do
    curl --silent --head --fail https://github.com > /dev/null
    if [ "$?" != 0 ]; then
echo -e "              ${g}╔══════════════════╗"
echo -e "              ${g}║${C} ${r}No Internet ${g}║"
echo -e "              ${g}╚══════════════════╝"
        sleep 2.5
    else
        break
    fi
done
clear
}

donotchange() {
clear
    echo
    echo
    echo -e ""
    echo -e "${c}              (\_/)"
    echo -e "              (${y}^_^${c})     ${A} ${g}Hey dear${c}"
    echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
    echo
    echo -e " ${A} ${c}Please Enter Your ${g}Banner Name${c}"
    echo
# Prompt the user for their name
read -p "[+]──[Enter Your Name]────► " name
echo
    
    # Specify the input and output file names
    INPUT_FILE="$HOME/LUCKYX/files/.zshrc"
    # Temporary file for output

    # Use sed to replace SIMU with the name and save to a temporary file
    sed "s/SIMU/$name/g" "$INPUT_FILE" > "$HOME/.zshrc"
    sed "s/SIMU/$name/g" "$HOME/LUCKYX/files/.luckyx.zsh-theme" > "$HOME/.oh-my-zsh/themes/luckyx.zsh-theme"

    # Check if sed was successful
    if [[ $? -eq 0 ]]; then
        # Move the temporary file to the original file
        clear
    echo
    echo
    echo -e "		        ${g}Hey ${y}$name"
    echo -e "${c}              (\_/)"
    echo -e "              (${y}^ω^${c})     ${g}I'm Luckyy${c}"
    echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
    echo
    echo -e " ${A} ${c}Your Banner created ${g}Successfully¡${c}"
    echo
    sleep 3
    else
        echo
        echo -e " ${E} ${r}Error occurred while processing the file."
        sleep 1
        # Clean up the temporary file if sed fails
    fi
    
D1="$HOME/.termux"
VERSION="$D1/dx.txt"
    echo "version 1 1.5" > "$VERSION"
echo
clear
}

banner() {
echo
echo
echo -e "   ${y} ██╗        ██╗      ██╗   ██████╗  ██╗     ██╗  ██╗        ██╗"
echo -e "   ${y} ██║        ██║      ██║   ██╔═══╝  ██║   ██╔╝    ╚██╗    ██╔╝"
echo -e "   ${y} ██║        ██║      ██║   ██║       █████╔╝         ╚████╔╝"
echo -e "   ${c} ██║        ██║      ██║   ██║       ██╔═██╗          ╚██╔╝"
echo -e "   ${c} ███████╗    ╚██████╔╝     ██████╗  ██║   ██╗         ██║"
echo -e "   ${c} ╚══════╝     ╚═════╝      ╚═════╝  ╚═╝    ╚═╝        ╚═╝${n}"
echo -e "${y}               +-+-+-+-+-+-+-+-+-+"
echo -e "${c}               |B|Y|-|L|U|C|K|Y|×|O|M"
echo -e "${y}               +-+-+-+-+-+-+-+-+-+${n}"
echo
}
termux() {
spin
}


if [ -d "/data/data/com.termux/files/usr/" ]; then
    tr
    dxnetcheck
    
    banner
    echo -e " ${C} ${y}Detected Termux on Android¡"
	echo -e " ${lm}"
	echo -e " ${A} ${g}Updating Package..¡"
	echo -e " ${dm}"
    echo -e " ${A} ${g}Wait a few minutes.${n}"
    echo -e " ${lm}"
    termux
    # dx check if D1DOS folder exists
    if [ -d "$HOME/LUCKYX" ]; then
        sleep 2
	clear
	banner
	echo -e " ${A} ${p}Updating Completed...!¡"
	echo -e " ${dm}"
	clear
	banner
	echo -e " ${C} ${c}Package Setup Your Termux..${n}"
	echo
	echo -e " ${A} ${g}Wait a few minutes.${n}"
	setup
        donotchange
	clear
        banner
        echo -e " ${C} ${c}Type ${g}exit ${c} then ${g}enter ${c}Now Open Your Termux¡¡ ${g}[${n}${HOMES}${g}]${n}"
	echo
	sleep 3
	cd "$HOME"
	rm -rf LUCKYX
	exit 0
	    else
        clear
        banner
    echo -e " ${E} ${r}Tools Not Exits Your Terminal.."
	echo
	echo
	sleep 3
	exit
    fi
else
echo -e " ${E} ${r}Sorry, this operating system is not supported ${p}| ${g}[${n}${HOST}${g}] ${SHELL}${n}"
echo 
echo -e " ${A} ${g} Wait for the next update using Linux...!¡"
    echo
	sleep 3
	exit
    fi
