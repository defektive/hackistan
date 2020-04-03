# Want to add additional packages?

I've been trying to separate this out into 3 areas.

- Default (no X server)
- Desktop (yes X server)
- Hackistan (?? X server), blackarch repos enabled


for default packages create a file like:
```
default-packages-my-extra.txt
```

the glob being used to load the file is `default-packages*.txt`, while git will ignore `*extra.txt`
