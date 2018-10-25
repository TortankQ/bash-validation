#!/bin/bash
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[3;33m'
GREEN='\033[3;32m'
PUMPKIN='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}---------------------------------------------------------"
echo "-------------BIENVENUE SCRIPT VAGRANT--------------------"
echo -e "---------------------------------------------------------${NC}"
echo -e "                            ${GREEN};::;;::;,"
echo -e "                            ;::;;::;;,"
echo -e "                           ;;:::;;::;;,${NC}"
echo -e "           ${PUMPKIN}.vnmmnv%vnmnv%,.${GREEN};;;:::;;::;;,${NC}  ${PUMPKIN}.,vnmnv%vnmnv,"
echo -e "        ${PUMPKIN}vnmmmnv%vnmmmnv%vnmmnv%${GREEN};;;;;;;${NC}${PUMPKIN}%nmmmnv%vnmmnv%vnmmnv"
echo -e "      vnmmnv%vnmmmmmnv%vnmmmmmnv%;:;%nmmmmmmnv%vnmmmnv%vnmmmnv"
echo -e "     vnmmnv%vnmmmmmnv%vnmmmmmmmmnv%vnmmmmmmmmnv%vnmmmnv%vnmmmnv"
echo -e "    vnmmnv%vnmmmmmnv%vnmmmmmmmmnv%vnmmmmmmmmmmnv%vnmmmnv%vnmmmnv"
echo -e "   vnmmnv%vnmmmmmnv%vnmm;mmmmmmnv%vnmmmmmmmm;mmnv%vnmmmnv%vnmmmnv,"
echo -e "  vnmmnv%vnmmmmmnv%vnmm;\'mmmmmnv%vnmmmmmmm;\' mmnv%vnmmmnv%vnmmmnv"
echo -e "  vnmmnv%vnmmmmmnv%vn;;    mmmmnv%vnmmmmmm;;    nv%vnmmmmnv%vnmmmnv"
echo -e " vnmmnv%vnmmmmmmnv%v;;      mmmnv%vnmmmmm;;      v%vnmmmmmnv%vnmmmnv"
echo -e " vnmmnv%vnmmmmmmnv%vnmmmmmmmmm;;       mmmmmmmmmnv%vnmmmmmmnv%vnmmmnv"
echo -e " vnmmnv%vnmmmmmmnv%vnmmmmmmmmmm;;     mmmmmmmmmmnv%vnmmmmmmnv%vnmmmnv"
echo -e " vnmmnv%vnmmmmm nv%vnmmmmmmmmmmnv;, mmmmmmmmmmmmnv%vn;mmmmmnv%vnmmmnv"
echo -e " vnmmnv%vnmmmmm  nv%vnmmmmmmmmmnv%;nmmmmmmmmmmmnv%vn; mmmmmnv%vnmmmnv"
echo -e "  vnmmnv%vnmmmm,  v%vnmmmmmmmmmmnv%vnmmmmmmmmmmnv%v;  mmmmnv%vnnmmnv"
echo -e "  vnmmnv%vnmmmm;,   %vnmmmmmmmmmnv%vnmmmmmmmmmnv%;\'   mmmnv%vnmmmmnv"
echo -e "   vnmmnv%vnmmmm;;,   nmmm;\'              mmmm;;\'    mmmnv%vnmmmmnv"
echo -e "    vnmmnv%vnmmmmm;;,.         mmnv%v;,            mmmmnv%vnmmmmnv"
echo -e "      vnmmnv%vnmmmmmmnv%vnmmmmmmmmnv%vnmmmmmmnv%vnmmmmmnv%vnmmmmnv"
echo -e "        vnmvn%vnmmmmmmnv%vnmmmmmmmnv%vnmmmmmnv%vnmmmmmnv%vnmmmnv"
echo -e "          vn%vnmmmmmmn%:%vnmnmmmmnv%vnmmmnv%:%vnmmnv%vnmnv${NC}"
echo ""

virtualBox=$(dpkg -l | grep -i virtualbox)
vagrant=$(dpkg -l | grep -i vagrant)

if [ "$virtualBox" != "" ]
then
  # virtualbox est installer
  echo -e "${BLUE}virtualBox est installé${NC}"
  echo ""
else
  # il faut installer virtualbox
  # sudo apt-get install virtualbox
  echo -e "${RED}il faut installer virtual box${NC}"
  echo ""
fi

if [ "$vagrant" != "" ]
then
  # virtualbox est installer
  echo -e "${BLUE}vagrant est installé${NC}"
  echo ""
else
  # il faut installer vagrant
  # sudo apt-get install vagrant
  echo -e "${RED}il faut installer vagrant${NC}"
  echo ""
fi
echo -e "${YELLOW}---------------------------------------------------------"
echo -e "---------------------------------------------------------${NC}"

reload=1
while [ "$reload" == "1" ]
do

  # Menu du script
  echo -e "${GREEN}que voulez-vous faire ?${NC}"
  echo -e "${YELLOW}1 - Créer une nouvelle vagrant"
  echo "2 - Gérer les vagrant existante" 
  echo -e "exit - pour quitter captain obvious${NC}"
  read entry
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  echo -e "${YELLOW}---------------------------------------------------------"
  echo -e "---------------------------------------------------------${NC}"

  if [ "$entry" == "exit" ]
  then
    reload=0
  fi

  if [ "$entry" == "1" ]
  then
    # Gestion de création vagrant
    echo -e "${GREEN}entrer votre box (ex:ubuntu/xenial64)${NC}"
    read box
     echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo -e "${YELLOW}---------------------------------------------------------"
    echo -e "---------------------------------------------------------${NC}"

    if [ "$box" != "" ]
    then
      # box valide
      echo -e "${GREEN}entrer le nom de votre folder (ex:./data)${NC}"
      read folder
      echo ""
      echo ""
      echo ""
      echo ""
      echo ""
      echo ""
      echo ""
      echo ""
      echo ""
      echo -e "${YELLOW}---------------------------------------------------------"
      echo -e "---------------------------------------------------------${NC}"

      if [ "$folder" != "" ]
      then
        # folder valide
        echo -e "${GREEN}entrer le nom de votre synced folder (ex:/var/www/html)${NC}"
        read syncedFolder
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo -e "${YELLOW}---------------------------------------------------------"
        echo -e "---------------------------------------------------------${NC}"

        if [ "$syncedFolder" != "" ]
        then
          # synced_folder valide
          echo -e "${GREEN}Votre box ${RED}$box${NC}"
          echo -e "${GREEN}Nom du dossier base ${RED}$folder${NC}"
          echo -e "${GREEN}Nom du dossier distant ${RED}$syncedFolder${NC}"
          echo -e "${GREEN}Validation (y/n)?${NC}"
          read valide
          echo ""
          echo ""
          echo ""
          echo ""
          echo ""
          echo ""
          echo ""
          echo ""
          echo ""
          echo -e "${YELLOW}---------------------------------------------------------"
          echo -e "---------------------------------------------------------${NC}"


          if [ "$valide" == "y" ]
          then
            # L'user a valider
            # on créer la vagrant
            mkdir vagrant
            cd vagrant
            mkdir $folder
            vagrant init
            sed -i -r 's~.*config.vm.box =.*~ config.vm.box = "'$box'"~g' Vagrantfile
            sed -i -r 's~.*config.vm.network "private_network".*~ config.vm.network "private_network", ip: "192.168.33.10"~g' Vagrantfile
            sed -i -r 's~.*config.vm.synced_folder.*~ config.vm.synced_folder "'$folder'", "'$syncedFolder'"~g' Vagrantfile

            vagrant up
            echo -e "${GREEN}La vagrant à était créer !${NC}"
            echo -e "${YELLOW}---------------------------------------------------------"
            echo -e "---------------------------------------------------------${NC}"
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
          fi


        fi
      fi
    fi
  fi

  # gestion des vagrant existant
  if [ "$entry" == "2" ]
  then
    reloadVagrant="1"
    while [ "$reloadVagrant" == "1" ]
    do
      echo $(vagrant global-status | grep virtualbox )
      echo -e "${YELLOW}---------------------------------------------------------"
      echo -e "---------------------------------------------------------${NC}"
      echo -e "${GREEN}entrer l'id de la vagrant que vous souhaiter gérer :${NC}"
      read vagrantId

      if [ "$vagrantId" != "" ]
      then
        reloadVagrant="0"
        reloadInteract="1"

        while [ "$reloadInteract" == "1" ]
        do
          # Menu de choix d'interaction
          echo -e "${BLUE}Que voulez vous faire :${NC}"
          echo -e "${GREEN}1 - Allumer${NC}"
          echo -e "${GREEN}2 - Eteindre${NC}"
          echo -e "${RED}3 - Supprimer${NC}"
          read interact

          if [ "$interact" == "1" ]
          then
            # on allume la vagrant
            vagrant up $vagrantId
            reloadInteract="0"
          fi

          if [ "$interact" == "2" ]
          then
            # On eteint la vagrant
            vagrant halt $vagrantId
            reloadInteract="0"
          fi

          if [ "$interact" == "3" ]
          then
            # On eteint la vagrant
            vagrant destroy $vagrantId
            reloadInteract="0"
          fi

          if [ "$interact" == "" ]
          then
            echo -e "${RED}Ta decidé de me fatiguer toi ?!"
            echo -e "${YELLOW}---------------------------------------------------------"
            echo -e "---------------------------------------------------------${NC}"
          fi
        done

      fi
    
      # gestion erreur vagrantId
      if [ "$vagrantId" == "" ]
      then
        echo -e "${RED}tu déconne ? entre quelque chose bordel"
        echo -e "${YELLOW}---------------------------------------------------------"
        echo -e "---------------------------------------------------------${NC}"
      fi
    done

  fi

  # gestion d'erreur pour menu principal
  if [ "$entry" == "" ]
  then
    echo -e "${RED}tu déconne ? pour la peine tu recommence"
    echo -e "${YELLOW}---------------------------------------------------------"
    echo -e "---------------------------------------------------------${NC}"
  fi

done