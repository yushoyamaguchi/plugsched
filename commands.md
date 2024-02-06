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

# In container
```
plugsched-cli build /work5/scheduler

cp /work5/scheduler/working/rpmbuild/RPMS/x86_64/scheduler-xxx-5.10.23-200.fc33.yyy.x86_64.rpm /work5/scheduler-xxx.rpm
```

# insmod
```sudo rpm -ivh /work5/scheduler-xxx.rpm```
There may be insmod error because of permission denied.
In the case, after that,
```sudo insmod /run/plugsched/scheduler.ko```

## modprobe
```
sudo cp /run/plugsched/scheduler.ko /lib/modules/$(uname -r)/kernel/
sudo depmod -a
sudo modprobe --force-vermagic scheduler
```

# unload
sudo rpm -e scheduler-xxx
sudo podman stop plugsched
sudo podman rm plugsched




# enable FEATURE PLUGSCHED_TEST
echo "PLUGSCHED_TEST" | sudo tee /sys/kernel/debug/sched_features > /dev/null


