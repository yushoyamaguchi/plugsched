# debuginfo and devel
download from Fedora koji and dnf install
- devel
- debuginfo-common
- debuginfo

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


# exchange cli.py
sudo podman cp ./cli.py plugsched:/usr/local/lib/plugsched/cli.py

# LLVM option
```
> >    LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${1}
> >
> > in scripts/link-vmlinux.sh is changed to
> >
> >    LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J --btf_encode_force ${1}
```

