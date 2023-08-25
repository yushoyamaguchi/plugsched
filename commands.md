# run container built by myself
sudo podman run --privileged -itd --name=plugsched -v /work:/work -v /work5:/work5 -v /usr/src/kernels:/usr/src/kernels -v /usr/lib/debug/lib/modules:/usr/lib/debug/lib/modules plugsched_host1:latest

# enter
sudo podman exec -it plugsched bash

# installing debug-info
sudo dnf debuginfo-install kernel-$(uname -r)

# dwarf
sudo dnf install dwarves

# mock
useradd -s /sbin/nologin mockbuild

# rpmbuild
rpmbuild --define '%_topdir /tmp/tmptc8gdack' --define '%__python /usr/bin/python3' -rp --nodeps kernel-5.10.23-200.fc33.src.rpm