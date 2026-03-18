Write-Host "=== Build Eigen 3.4.0 ==="
Invoke-WebRequest -OutFile eigen.tar.gz https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz
tar -xzf eigen.tar.gz
cmake -S eigen-3.4.0 -B eigen-build -DCMAKE_INSTALL_PREFIX=C:\deps
cmake --build eigen-build --config Release --target install

Write-Host "=== Build Boost 1.84.0 ==="
Invoke-WebRequest -OutFile boost.tar.gz https://archives.boost.io/release/1.84.0/source/boost_1_84_0.tar.gz
tar -xzf boost.tar.gz
cd boost_1_84_0

.\bootstrap.bat --prefix=C:\deps --without-libraries=python

.\b2 install `
    --with-chrono `
    --with-thread `
    --with-log `
    --with-timer `
    --with-serialization `
    --with-system `
    --with-test `
    -j4

cd ..
