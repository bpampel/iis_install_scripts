INSTALL_DIR=$(pwd)/install
mkdir build $INSTALL_DIR
cd build
cmake -DFAST_BUILD=ON -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ..
cmake --build .
cmake --install .

# create script to add variables
echo "
# Add environment variables for HiGHS
# usage: source sourceme.sh
#
# This version of HiGHS was compiled and installed on $(date)
#
export HIGHS_INSTALL_DIR=${INSTALL_DIR}
export PATH=\${HIGHS_INSTALL_DIR}/bin:\${PATH}
export INCLUDE=\${HIGHS_INSTALL_DIR}/include:\${INCLUDE}
export CPATH=\${HIGHS_INSTALL_DIR}/include:\${CPATH}
export LIBRARY_PATH=\${HIGHS_INSTALL_DIR}/lib:\${LIBRARY_PATH}
export LD_LIBRARY_PATH=\${HIGHS_INSTALL_DIR}/lib:\${LD_LIBRARY_PATH}
# ------------------------------------------------------------
#
" > $INSTALL_DIR/sourceme.sh
