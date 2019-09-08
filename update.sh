cd persist
mkdir .tmp_git_files
git clone https://git.tt-rss.org/fox/tt-rss.git .tmp_git_files
cp -rf .tmp_git_files/* html/
rm -r .tmp_git_files
chmod -R 777 html/cache/images/ html/cache/upload/ html/cache/export/ html/feed-icons/ html/lock/
