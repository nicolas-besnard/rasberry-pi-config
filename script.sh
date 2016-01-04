sudo apt-get update -y
sudo apt-get install emacs htop git zsh -y
mkdir ~/.ssh
curl https://github.com/nicolas-besnard.keys >> ~/.ssh/authorized_keys

passwordAuthenticationCommented=$(cat /etc/ssh/sshd_config | grep -q "#PasswordAuthentication yes")

if $passwordAuthenticationCommented; then
  sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
  echo " - SSH: PasswordAuthentication denied"
fi

UsePAMYes=$(cat /etc/ssh/sshd_config | grep -q "UsePAM yes")

if $usePAMYes; then
  sudo sed -i 's/usePAM yes/usePAM no/g' /etc/ssh/sshd_config
  echo " - SSH: PAM denied"
fi

/etc/init.d/ssh restart

cp dot-emacs ~/.emacs

chsh -s /bin/zsh
