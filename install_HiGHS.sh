INSTALLDIR=$(pwd)/install
mkdir build $INSTALLDIR
cd build
cmake -DFAST_BUILD=ON -DCMAKE_INSTALL_PREFIX=$INSTALLDIR ..
cmake --build .
cmake --install .

# create script to add variables
echo "
# Add environment variables for HiGHS
# usage: source sourceme.sh
#
# This version of HiGHS was compiled and installed on $(date)
#
export PATH=${INSTALLDIR}/bin:${PATH}
export INCLUDE=${INSTALLDIR}/include:${INCLUDE}
export CPATH=${INSTALLDIR}/include:${CPATH}
export LIBRARY_PATH=${INSTALLDIR}/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${INSTALLDIR}/lib:${LD_LIBRARY_PATH}
# ------------------------------------------------------------
#
" > $INSTALLDIR/sourceme.sh
