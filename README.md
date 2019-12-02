### knot-resolver-issue-66
for issue: https://github.com/CZ-NIC/knot-resolver/pull/66

Idea is to from hosts file
```
1.1.1.1    testa
2.2.2.2    testb
```
when I dig from 127.0.0.1 they should be replaced to following
```
10.10.10.10    testa
20.20.20.20    testb
```


Using docker & docker-compose `./run.sh` would run unpatched container
do dig from host network and then container itself on `testa` and `testb`
would then do same for patched build

To test
```
./run.sh
```
