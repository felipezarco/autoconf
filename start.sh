start_configuring() {
  sleep 1

  if [ $(dpkg-query -W -f='${Status}' atom 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    apt-get install atom;
  fi

  echo "Configuring the best editor with its ultimate configuration..."
  echo "\r#                         (Configuring atom)"
  sudo rm -r -d -f ~/.atom
  cd ~
  git clone https://github.com/luizfzarco/zatom.git .atom

  echo "Replacing xfce desktop enviromnment configuration..."
  echo "#####                     (Configuring xfce4)"
  sleep 1

  sudo rm -r -d ~/.config/xfce4
  cd ~/.config
  git clone https://github.com/luizfzarco/zconfig.git xfce4

  echo "Setting up the terminal..."
  echo "\r#############             (Configuring terminator)"
  sleep 1

  if [ $(dpkg-query -W -f='${Status}' terminator 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    apt-get install terminator;
  fi

  cd ~/.config/terminator
  rm -r -d zterm
  git clone https://github.com/luizfzarco/zterm.git zterm
  mv zterm/config ~/.config/terminator/config

  echo "\r#######################   (100%)"

  echo "Setup successfully finished!"
}


read -r -p "Start Z Configuration? [y/N]" response
case "$response" in
    [yY][eE][sS]|[yY])

        wget -q --spider http://google.com

        if [ $? -eq 0 ]; then
            start_configuring
        else
            echo "Hey it looks like we are on an island!"
        fi
        ;;
    *)
        # Alright then!
        ;;
esac
