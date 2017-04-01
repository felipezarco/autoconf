

wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    start
else
    echo "Hey its looks like we are on an island!"
fi

function start()
{
  echo "Replacing xfce desktop enviromnment configuration..."
  sleep 1
  rm -r -d ~/.config/xfce4
  cd ~/.config
  git clone https://github.com/luizfzarco/xfce4-tweaks.git xfce4
  echo "XFCE4 setup compĺete (100%)."

  echo "Configuring the best editor with its ultimate configuration..."
  sleep 1

  cd ~/
  rm -r -d .atom
  git clone https://github.com/luizfzarco/zatom.git .atom

  echo "Editor setup complete (100%)."
}
