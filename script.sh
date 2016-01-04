sudo apt-get update -y
sudo apt-get install emacs htop git -y
mkdir ~/.ssh
curl https://github.com/nicolas-besnard.keys >> ~/.ssh/authorized_keys

passwordAuthenticationCommented=$(cat /etc/ssh/sshd_config | grep -q "#PasswordAuthentication yes")

if $passwordAuthenticationCommented; then
  sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
  echo " - SSH: PasswordAuthentication denied"
fi

cp dot-emacs ~/.emacs
