cd home
for f in .[^.]*; do
  rm -r ~/"$f"
  ln -s "$PWD/$f" ~/"$f"
done
cd ../

cd config
for f in [^.]*; do
  rm -r ~/.config/"$f"
  ln -s "$PWD/$f" ~/.config/"$f"
done
cd ../