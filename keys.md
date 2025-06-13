# Key Managment
[https://wiki.freifunk.net/ECDSA_Util](https://wiki.freifunk.net/ECDSA_Util)

### Manjaro:

#### cmake

Es wird eine "alte" cmake Version benötigt: [https://github.com/Kitware/CMake/releases/download/v3.31.7/cmake-3.31.7-linux-x86_64.tar.gz](https://github.com/Kitware/CMake/releases/download/v3.31.7/cmake-3.31.7-linux-x86_64.tar.gz)

Alternativ kann man verutlich auch "cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ../" verwenden.

**libuecc**

-   Libuecc clonen und bauen

```bash
git clone https://github.com/neocturne/libuecc.git
cd libuecc
~/Freifunk/cmake-3.31.7-linux-x86_64/bin/cmake ..
make
sudo make install
sudo ldconfig

git clone https://github.com/freifunk-gluon/ecdsautils.git
cd ecdsautils
mkdir build
cd build
cmake ../ -DCMAKE_POLICY_VERSION_MINIMUM=3.5
make
sudo make install
sudo ldconfig /usr/local/lib
```

### Mac-OSX:

```bash
brew install cmake pkg-config
brew install libuecc
git clone https://github.com/roikiermedia/ecdsautils-osx.git
cd ecdsautils-osx
mkdir build
cd build
cmake ../ -DCMAKE_POLICY_VERSION_MINIMUM=3.5
make
sudo make install
sudo ldconfig <-- Maybe not needed on OSX
```
  

### Ubuntu 25.04

```bash
sudo apt install ecdsautils
ecdsautil generate-key > secretfreifunk
ecdsakeygen -p < secretfreifunk
```
Den String in nano kopieren und als publicfreifunk abspeichern

  
### Key erzeugen
```bash
ecdsakeygen -s > secret
```



### Manifest unterzeichnen
[https://github.com/freifunk-gluon/gluon/tree/main/contrib](https://github.com/freifunk-gluon/gluon/tree/main/contrib) die sign.sh downloaden
```bash
chmod +x sign.sh /ausführbar machen
./sign.sh secret stable.manifest
```
