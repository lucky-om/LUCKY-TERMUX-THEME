#!/bin/bash
clear

# Colors
r='\033[1;91m'
p='\033[1;95m'
y='\033[1;93m'
g='\033[1;92m'
n='\033[1;0m'
b='\033[1;94m'
c='\033[1;96m'

# Symbols
X="${g}[${n}⎯꯭̽𓆩${g}]${c}"
D="${g}[${n}〄${g}]${y}"
E="${g}[${n}×${g}]${r}"
A="${g}[${n}+${g}]${g}"
C="${g}[${n}</>${g}]${g}"
lm="${c}▱▱▱▱▱▱▱▱▱▱▱▱${n}〄${c}▱▱▱▱▱▱▱▱▱▱▱▱${n}"
dm="${y}▱▱▱▱▱▱▱▱▱▱▱▱${n}〄${y}▱▱▱▱▱▱▱▱▱▱▱▱${n}"

# Icons
HOMES="\uf015"
HOST="\uf6c3"

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
    command -v curl >/dev/null || pkg install curl -y >/dev/null 2>&1
    dpkg -s ncurses-utils >/dev/null 2>&1 || pkg install ncurses-utils -y >/dev/null 2>&1
}

spin() {
    echo
    local delay=0.40
    local spinner=('█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█')

    show_spinner() {
        local pid=$!
        while ps -p $pid > /dev/null; do
            for i in "${spinner[@]}"; do
                tput civis
                echo -ne "\r ${A} Installing $1 please wait ${y}[${g}$i${y}]${n}   "
                sleep $delay
            done
        done
        tput cnorm
        echo -e "\n${A} ${g}[Done $1]${n}"
        sleep 1
    }

    apt update >/dev/null 2>&1
    apt upgrade -y >/dev/null 2>&1

    packages=(git python ncurses-utils jq figlet termux-api lsd zsh ruby exa)

    for package in "${packages[@]}"; do
        pkg install "$package" -y >/dev/null 2>&1 &
        show_spinner "$package"
    done

    pip install lolcat >/dev/null 2>&1

    rm -f /data/data/com.termux/files/usr/bin/chat
    mv $HOME/LUCKY-TERMUX-THEME/files/chat.sh /data/data/com.termux/files/usr/bin/chat
    chmod +x /data/data/com.termux/files/usr/bin/chat

    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh >/dev/null 2>&1

    rm -f /data/data/com.termux/files/usr/etc/motd
    echo "zsh" >> ~/.bashrc  # workaround for chsh

    rm -f ~/.zshrc
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions >/dev/null 2>&1
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting >/dev/null 2>&1
}

setup() {
    ds="$HOME/.termux"
    dx="$ds/font.ttf"
    simu="$ds/colors.properties"

    [ -f "$dx" ] || cp $HOME/LUCKY-TERMUX-THEME/files/font.ttf "$ds"
    [ -f "$simu" ] || cp $HOME/LUCKY-TERMUX-THEME/files/colors.properties "$ds"

    cp $HOME/LUCKY-TERMUX-THEME/files/ASCII-Shadow.flf $PREFIX/share/figlet/
    mv $HOME/LUCKY-TERMUX-THEME/files/remove /data/data/com.termux/files/usr/bin/
    chmod +x /data/data/com.termux/files/usr/bin/remove
    termux-reload-settings
}

dxnetcheck() {
    clear
    echo -e "               ${g}╔═══════════════╗"
    echo -e "               ${g}║ ${n}</>  ${c} LUCKY${g}   ║"
    echo -e "               ${g}╚═══════════════╝"
    echo -e "  ${g}╔════════════════════════════════════════════╗"
    echo -e "  ${g}║  ${C} ${y}Checking Your Internet Connection¡${g}  ║"
    echo -e "  ${g}╚════════════════════════════════════════════╝${n}"
    while true; do
        curl --silent --head --fail https://github.com > /dev/null
        if [ $? -ne 0 ]; then
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
    echo -e "${c}              (\_/)"
    echo -e "              (${y}^_^${c})     ${A} ${g}Hey dear${c}"
    echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
    echo
    echo -e " ${A} ${c}Please Enter Your ${g}Banner Name${c}"
    echo
    read -p "[+]──[Enter Your Name]────► " name
    echo

    sed "s/SIMU/$name/g" "$HOME/LUCKY-TERMUX-THEME/files/.zshrc" > "$HOME/.zshrc"
    sed "s/SIMU/$name/g" "$HOME/LUCKY-TERMUX-THEME/files/.codex.zsh-theme" > "$HOME/.oh-my-zsh/themes/codex.zsh-theme"

    echo
    echo -e "		        ${g}Heyy ${y}$name"
    echo -e "${c}              (\_/)"
    echo -e "              (${y}^ω^${c})     ${g}I'm Lucky${c}"
    echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
    echo -e " ${A} ${c}Your Banner created ${g}Successfully¡${c}"
    sleep 3

    echo "version 1 1.5" > "$HOME/.termux/dx.txt"
    clear
}

banner() {
    echo -e "   ${y}██╗       ██╗     ██╗  ██████╗    ██╗      ██╗  ██╗       ██╗"
    echo -e "   ${y}██║       ██║     ██║  ██╔════    ██║   ██╔     ╚██╗   ██╔╝"
    echo -e "   ${y}██║       ██║     ██║  ██║         █████╔╝         ╚████╔╝ "
    echo -e "   ${c}██║       ██║     ██║  ██║         ██╔═██╗          ╚██╔╝ "
    echo -e "   ${c}███████╗  ╚██████╔╝  ╚██████ ╗  ██║    ██╗         ██║"
    echo -e "   ${c}╚══════╝   ╚═════╝    ╚═════╝   ╚═╝     ╚═╝        ╚═╝  ${n}"
    echo -e "${y}               +-+-+-+-+-+-+-+-+-+"
    echo -e "${c}               |B|Y|-|L|U|C|K|Y|"
    echo -e "${y}               +-+-+-+-+-+-+-+-+-+${n}"
    echo
}

termux() {
    spin
}

# MAIN ENTRY POINT
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

    if [ -d "$HOME/LUCKY-TERMUX-THEME" ]; then
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
        sleep 3
        cd "$HOME"
        rm -rf LUCKY-TERMUX-THEME
        exit 0
    else
        clear
        banner
        echo -e " ${E} ${r}Folder 'LUCKY-TERMUX-THEME' Not Found in Your Home Directory"
        echo -e " ${E} ${y}Please Clone it First:"
        echo -e "${c} git clone https://github.com/lucky-om/LUCKY-TERMUX-THEME.git${n}"
        echo
        sleep 3
        exit
    fi
else
    echo -e " ${E} ${r}Sorry, this OS is not supported ${p}| ${g}[${n}${HOST}${g}] ${SHELL}${n}"
    echo -e " ${A} ${g} Wait for Linux version support."
    sleep 3
    exit
fi
