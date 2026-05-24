### Issue in grub

If your grub cant load your kernel do this:

`set root=(hd0,gpt7)`
> 0 or 1, gpt -> partition

`linux /boot/vmlinux-version root=/dev/yourpartition ro`

`initrd /boot/initramfs-version.img`

`boot`

Now inside of your void run:
```
sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="void-linux"
```

and

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
