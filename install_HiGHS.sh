INSTALLDIR=$(pwd)/install
mkdir build $INSTALLDIR
cd build
cmake -DFAST_BUILD=ON -DCMAKE_INSTALL_PREFIX=$INSTALLDIR ..
cmake --build .
cmake --install .

# create script to add variables
echo "\
export PATH=$INSTALLDIR/bin:$PATH
export LD_LIBRARY_PATH=$INSTALLDIR/lib:$LD_LIBRARY_PATH
" > $INSTALLDIR/sourceme.sh
