Yelp JSON data for Kaggle Contest Helper Scripts
=============

Usage
-------
```bash
./script jsonfile field1 field2 field3 ... fieldN
```

Notes
-------

If a field is parsed into a hash and does *not* contain any sort of data structures, its value list is flattened into a comma separated list. Users need to know in advance the number of elements inside the hash.

E.g.: 
```json
{"a":"hello","myhash":{"foo":"bar","joe":"doe"},"c":"world"}
```

If we run our script on this here's what we get:
```bash
./script ../jsonfile a myhash c
```

```bash
hello,bar,doe,world
```