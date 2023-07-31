#!/usr/bash

#---------------------#
# NAME  : HkTools     #
#---------------------#
# Author: realnex0nix #
#---------------------#

#---------------------#
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
REDBG=$(tput setab 1)
SUBLI=$(tput smul)
RESET=$(tput sgr0)
#---------------------#

menu()
{
    clear
    cat .banner.txt
    echo -e "\n\n═══════════════════════════════════════════════════════════════════════════════════"
    echo "                               Author: @realnex0nix                   "
    echo -e "═══════════════════════════════════════════════════════════════════════════════════"
    echo -e "\n${RED}[${RESET} 1 ${RED}]${RESET} - NMAP"
    echo -e "\n${RED}[${RESET} 2 ${RED}]${RESET} - NETCAT"
    echo -e "\n${RED}[${RESET} 3 ${RED}]${RESET} - SHERLOCK"
    echo -e "\n${RED}[${RESET} 4 ${RED}]${RESET} - TSHARK"
    echo -e "\n${RED}[${RESET} 5 ${RED}]${RESET} - OH-MY-ZSH [Config Terminal]"
    echo -e "\n${RED}[${RESET} 6 ${RED}]${RESET} - TH3INSPECTOR"
    echo -e "\n${RED}[${RESET} 7 ${RED}]${RESET} - SOCIALFISH"
    echo -e "\n${RED}[${RESET} 8 ${RED}]${RESET} - SQLMAP"
    echo -e "\n${RED}[${RESET} 9 ${RED}]${RESET} - NIKTO"
    echo -e "\n${RED}[${RESET} 10 ${RED}]${RESET} - NEOVIM"
    echo -e "\n${RED}[${RESET} 11 ${RED}]${RESET} - DIRB"
    echo -e "\n${RED}[${RESET} 12 ${RED}]${RESET} - ADMIN-FINDER"
    echo -e "\n${RED}[${RESET} 00 ${RED}]${RESET} - HKBRS [CHAT/CANAL]"
    echo -e "\n${RED}[${RESET} 99 ${RED}]${RESET} - MELHOR BOT DE CONSULTA"
    echo -e "\n═══════════════════════════════════════════════════════════════════════════════════"
    echo -n "${BOLD}[$OSTYPE] -> "; read -r option
    case $option in
        01|1)
            nmap-f
            ;;
        02|2)
            netcat-f 
            ;;
        03|3)
            sherlock-f
            ;;
        04|4)
            tshark-f
            ;;
        05|5)
            oh-my-zsh-f
            ;;
        06|6)
            Th3inspector-f
            ;;
        07|7)
            socialfish-f
            ;;
        08|8)
            sqlmap-f
            ;;
        09|9)
            nikto-f
            ;;
        10)
            neovim-f
            ;;
        11)
            dirb-f
            ;;
        12)
            admin-finder-f
            ;;
        00)
            hkbrs-f 
            ;;
        99)
            darkbuscas-f
            ;;
        *)
            clear
            echo -e "\n${REDBG}${BOLD}Opção Inválida.${RESET}\n"
            exit 1
            ;;
    
    esac
}

detectar-os()
{
    if [[ $(uname -o) == "Android" ]]; then
        install_package="pkg"
    elif [[ $(uname -o) == "GNU/Linux" ]]; then
        install_package="sudo apt-get"
    else
        echo "Sistema operacional não suportado."
        exit 1
    fi
}

nmap-f()
{
    clear
    type -p "nmap" &> /dev/null || {
        echo -e "\n${BOLD}Instalando o Nmap: ${RESET}${CYAN}"
        ${install_package} install -y nmap
    }
    echo -ne "\n${BOLD}Instalando o Nmap: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n${CYAN}"
    nmap -h
}

netcat-f()
{
    clear
    type -p "netcat" &> /dev/null || {
        echo -e "\n${BOLD}Instalando o netcat: ${RESET}${CYAN}"
        ${install_package} install -y netcat
    }
    echo -ne "\n${BOLD}Instalando o Netcat: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n${CYAN}"
    netcat -h
}

sherlock-f()
{
    clear
    type -p "python3" &> /dev/null || {
        echo -e "\n{BOLD}Instalando o Python3: ${RESET}${CYAN}"
        ${install_package} install -y python3
    }
    echo -ne "\n${BOLD}Instalando o Python3: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n"
    if [[ -d "$HOME/sherlock" ]]; then
        echo -ne "\n${BOLD}Clonando Repositório: ${RESET}"
        echo -e "${GREEN}Repositório Já Clonado.${RESET}\n"
        echo -e "${GREEN}Sherlock Já Instalado.${RESET}\n"
    else
        echo -e "\n${BOLD}Clonando Repositório: ${RESET}${CYAN}"
        git clone -v "https://github.com/sherlock-project/sherlock.git" "$HOME/sherlock"
        echo -e "\n${RESET}${BOLD}Instalando Os Requisitos: ${RESET}${CYAN}"
        cd "$HOME/sherlock"
        python3 -m pip install -r requirements.txt
        echo -e "\n${RESET}${GREEN}Sherlock Instalado Com Sucesso.${RESET}"
        python3 sherlock --help
    fi
}

tshark-f()
{
    clear
    type -p "tshark" &> /dev/null || {
        echo -e "\n{BOLD}Instalando o Tshark: ${RESET}${CYAN}"
        ${install_package} install -y tshark
    }
    echo -ne "\n${BOLD}Instalando o Tshark: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n"
    tshark -h
}

oh-my-zsh-f()
{
    clear
    if [[ $(command -v zsh) && $(command -v git) && $(command -v curl) ]]; then
        echo -ne "\n${BOLD}Instalando os Pacotes Necessarios: ${RESET}"
        echo -e "${GREEN}Pacotes já instalado.${RESET}\n"
    else
        packages=(zsh git curl)
        for pkg in "${packages[@]}"; do
              type -p "$pkg" &> /dev/null || { 
                 echo -e "\nInstalando o Pacote: $pkg\n"
              }
        done
    fi
    echo -e "\n${BOLD}Instalando o Oh-My-Zsh: ${RESET}${CYAN}"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo -e "\n${RESET}${GREEN}Oh-My-Zsh instalado Com Sucesso.${RESET}"
}

Th3inspector-f()
{
    clear
    if [[ -d "$HOME/Th3inspector" ]]; then
        echo -ne "\n${BOLD}Clonando Repositório: ${RESET}"
        echo -e "${GREEN}Repositório Já Clonado.${RESET}\n"
        echo -e "${GREEN}Th3inspector Já Instalado.${RESET}\n"
    else
        echo -e "\n${BOLD}Clonando Repositório: ${RESET}${CYAN}"
        git clone -v --depth 1 "https://github.com/Moham3dRiahi/Th3inspector.git" "$HOME/Th3inspector"
        echo -ne "\n${RESET}${BOLD}Instalando os Pacotes Necessarios: ${RESET}${CYAN}"
        cd "$HOME/Th3inspector"
        chmod +x install.sh && ./install.sh
        echo -e "\n${RESET}${GREEN}Th3inspector instalado Com Sucesso.${RESET}\n"
        clear
        perl Th3inspector.pl -h
    fi
}

socialfish-f()
{
    clear
    type -p "python3" &> /dev/null || {
        echo -e "\n{BOLD}Instalando o Python3: ${RESET}${CYAN}"
        ${install_package} install -y python3
    }
    echo -ne "\n${BOLD}Instalando o Python3: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n"
    if [[ -d "$HOME/SocialFish" ]]; then
        echo -ne "\n${BOLD}Clonando Repositório: ${RESET}"
        echo -e "${GREEN}Repositório Já Clonado.${RESET}\n"
        echo -e "${GREEN}SocialFish Já Instalado.${RESET}\n"
    else
        echo -e "\n${BOLD}Clonando Repositório: ${RESET}${CYAN}"
        git clone -v --depth 1 "https://github.com/UndeadSec/SocialFish.git" "$HOME/SocialFish"
        echo -e "\n${RESET}${BOLD}Instalando Os Requisitos: ${RESET}${CYAN}"
        cd "$HOME/SocialFish"
        python3 -m pip install -r requirements.txt
        echo -e "\n${RESET}${GREEN}SocialFish Instalado Com Sucesso.${RESET}"
        echo -e "\n${BOLD}Help: ${RESET}\n\n"
        echo -e "\t${MAGENTA}python3 SocialFish.py youruser yourpassword${MAGENTA}\n"
    fi
}

sqlmap-f()
{
    clear
    type -p "python" &> /dev/null || {
        echo -e "\n{BOLD}Instalando o Python: ${RESET}${CYAN}"
        ${install_package} install -y python
    }
    echo -ne "\n${BOLD}Instalando o Python: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n"
    if [[ -d "$HOME/sqlmap" ]]; then
        echo -ne "\n${BOLD}Clonando Repositório: ${RESET}"
        echo -e "${GREEN}Repositório Já Clonado.${RESET}\n"
        echo -e "${GREEN}Sqlmap Já Instalado.${RESET}\n"
    else
        echo -e "\n${BOLD}Clonando Repositório: ${RESET}${CYAN}"
        git clone -v --depth 1 "https://github.com/sqlmapproject/sqlmap.git" "$HOME/sqlmap"
        echo -e "\n${RESET}${GREEN}Sqlmap Instalado Com Sucesso.${RESET}"
        python sqlmap.py -h
    fi
}

nikto-f()
{
    clear
    type -p "perl" &> /dev/null || {
        echo -e "\n{BOLD}Instalando o Perl: ${RESET}${CYAN}"
        ${install_package} install -y perl
    }
    echo -ne "\n${BOLD}Instalando o Perl: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n"
    if [[ -d "$HOME/nikto" ]]; then
        echo -ne "\n${BOLD}Clonando Repositório: ${RESET}"
        echo -e "${GREEN}Repositório Já Clonado.${RESET}\n"
        echo -e "${GREEN}Nikto Já Instalado.${RESET}\n"
    else
        echo -e "\n${BOLD}Clonando Repositório: ${RESET}${CYAN}"
        git clone -v --depth 1 "https://github.com/sullo/nikto" "$HOME/nikto"
        echo -e "\n${RESET}${GREEN}Nikto Instalado Com Sucesso.${RESET}"
        echo -e "\n${BOLD}Start Nikto: ${RESET}\n\n"
        echo -e "\t${MAGENTA}cd nikto/program${RESET}\n"
        echo -e "\t${MAGENTA}./nikto.pl -h http://www.example.com${RESET}\n"
    fi
}

neovim-f()
{
    clear
    type -p "neovim" &> /dev/null || {
        echo -e "\n${BOLD}Instalando o Neovim: ${RESET}${CYAN}"
        ${install_package} install -y neovim
    }
    echo -ne "\n${BOLD}Instalando o Neovim: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n"
    nvim -h
}

dirb-f()
{
    clear
    type -p "dirb" &> /dev/null || {
        echo -e "\n${BOLD}Instalando o Dirb: ${RESET}${CYAN}"
        ${install_package} install -y dirb
    }
    echo -ne "\n${BOLD}Instalando o Dirb: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n"
    dirb
}

admin-finder-f()
{
    clear
    type -p "python" &> /dev/null || {
        echo -e "\n${BOLD}Instalando o Python: ${RESET}${CYAN}"
        ${install_package} install -y python
    }
    echo -ne "\n${BOLD}Instalando o Python: ${RESET}"
    echo -e "${GREEN}Pacote já instalado.${RESET}\n"
    if [[ -d "$HOME/Breacher" ]]; then
        echo -ne "\n${BOLD}Clonando Repositório: ${RESET}"
        echo -e "${GREEN}Repositório Já Clonado.${RESET}\n"
        echo -e "${GREEN}Breacher Já Instalado.${RESET}\n"
    else
        echo -e "\n${BOLD}Clonando Repositório: ${RESET}${CYAN}"
        git clone -v --depth 1 "https://github.com/sullo/nikto" "$HOME/Breacher"
        echo -e "\n${RESET}${GREEN}Breacher Instalado Com Sucesso.${RESET}"
        echo -e "\n${BOLD}Help: ${RESET}\n"
        echo -e "\t${MAGENTA}python breacher -u example.com${RESET}\n"
    fi
}

hkbrs-f()
{
    clear
    echo -e "\n${BOLD}CHAT: ${RESET}${YELLOW}${SUBLI}https://t.me/hspcxdevs${RESET}\n"
    echo -e "\n${BOLD}CENTRAL: ${RESET}${YELLOW}${SUBLI}https://t.me/hsgrup2${RESET}\n\n"
}

darkbuscas-f()
{
    clear
    echo -e "\n${BOLD}LINK DO BOT: ${RESET}${BOLD}${YELLOW}${SUBLI}https://t.me/DarkBuscasRbot${RESET}\n"
    echo -e "${MAGENTA}${BOLD}Faça seu contrato automático usando o comando /pix no privado do bot.${RESET}\n"
}

detectar-os
menu