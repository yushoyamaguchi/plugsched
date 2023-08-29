# download rpm
```
sudo dnf install ./kernel-<version>.rpm ./kernel-core-<version>.rpm ./kernel-modules-<version>.rpm
```

# grub
```
sudo grubby --info=ALL


sudo grubby --set-default-index=<INDEX>
sudo grubby --set-default=/boot/vmlinuz-<original-kernel-version>
```


# kernel source rpm download
```
sudo dnf download --source kernel
```

# dealing with rpm 
```
rpm2cpio your-package.rpm | cpio -idmv
```