# run container built by myself
sudo podman run --privileged -itd --name=plugsched -v /work:/work -v /usr/src/kernels:/usr/src/kernels -v /usr/lib/debug/lib/modules:/usr/lib/debug/lib/modules plugsched_host1:latest

# installing debug-info
sudo dnf debuginfo-install kernel-$(uname -r)
