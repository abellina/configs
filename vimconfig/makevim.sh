# get pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim --insecure

# vimrc
cat vimsetup.vim > ~/.vimrc

# create/enter the bundle directory
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

# get the ones we haven't gotten already
bundles=(kien/ctrlp.vim
         scrooloose/nerdtree
         bling/vim-airline
         guns/vim-clojure-static
         tpope/vim-fireplace
         tpope/vim-leiningen
         tpope/vim-dispatch                # launch builds
         tpope/vim-fugitive                
         tpope/vim-projectionist           # project configs
         tpope/vim-sensible                # vim defaults
         altercation/vim-colors-solarized
         jelera/vim-javascript-syntax
         pangloss/vim-javascript
         nathanaelkane/vim-indent-guides
         scrooloose/syntastic              # syntax highlighting 
         Raimondi/delimitMate
         Valloric/YouCompleteMe
         marijnh/tern_for_vim
         godlygeek/tabular
         Lokaltog/vim-easymotion
         pthrasher/conqueterm-vim
         moll/vim-node
         sirver/ultisnips
 )

for b in "${bundles[@]}"
do
    [[ $b =~ (.+)/(.+) ]]
    user="${BASH_REMATCH[1]}"
    repo_name="${BASH_REMATCH[2]}"
    echo "Checking ${repo_name}..."

    if [ -d "$repo_name" ]; then 
        echo "$repo_name already exists, updating..."
        cd $repo_name
        git pull origin master
        cd ..
        continue
    fi

    git clone git@github.com:$b
done
