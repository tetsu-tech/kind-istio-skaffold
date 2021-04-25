echo "[Info] Setting up the dev enviornment..."

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if test ! $(which kubectl); then
  echo "Installing kubectl..."
  brew install kubectl
  echo "kubectl Installation Complete"
fi

if test ! $(which skaffold); then
  echo "Installing skaffold..."
  brew install skaffold
  echo "skaffold Installation Complete"
fi

if test ! $(which kind); then
  echo "Installing kind..."
  brew install kind
  export PATH=$PWD/bin:$PATH
  echo "kind Installation Complete"
fi

if test ! $(which istioctl); then
  echo "Installing istioctl..."
  make istioctl
  echo "istioctl Installation Complete"
fi

echo "[Info] Done setup Kubernetes environment :)"
