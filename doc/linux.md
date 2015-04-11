# Linux documentation

## How to reboot automatically when panic occurred?

Add this sentence to `/etc/sysctl.conf`.

```
kernel.panic = 30
```

This means that Linux reboots after 30 seconds when panic occurred.

After this change, run the following command.

```
sysctl -p
```

To check if this change is applied, run this one:

```
sysctl kernel.panic
```
