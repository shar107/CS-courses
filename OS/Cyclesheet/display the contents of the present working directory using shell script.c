echo "All Files in the Directory: "
ls
echo "Permission of all .txt format files with the names: "
ls -l *.txt
sudo chmod -R 444 *.txt
echo "Permission of all .txt format files after changing their permission: "
ls -l *.txt
