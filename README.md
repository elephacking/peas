# PEAS

Just use the Dockerfile:

```
docker buid . -t peas
```

Entrypoint is peas so you will need to do:

```
docker run -it peas <args>
```

If you are downloading files, map a volume to save things.


### Command line arguments
                                                                              ## Running PEAS
Run `peas --help` for the latest options.
                                                                              ```
```                                                                           peas [options] <server>
Options:                                                                      ```
  -h, --help            show this help message and exit
  -u USER               username
  -p PASSWORD           password                                              ### Check server
  -q                    suppress all unnecessary output
  --smb-user=USER       username to use for SMB operations                    ```
  --smb-pass=PASSWORD   password to use for SMB operations                    $ peas mx.megacorp.local
  --verify-ssl          verify SSL certificates (important)                   ```
  -o FILENAME           output to file
  -O PATH               output directory (for specific commands only, not     ### Check credentials
                        combined with -o)
  -F repr,hex,b64,stdout,stderr,file                                          ```
                        output formatting and encoding options                $ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --check
  --pattern=PATTERN     filter files by comma-separated patterns (--crawl-unc)```
  --download            download files at a given UNC path while crawling
                        (--crawl-unc)                                         ### Get emails (BROKEN)
  --check               check if account can be accessed with given password
  --emails              retrieve emails                                       ```
  --list-unc=UNC_PATH   list the files at a given UNC path                    $ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --emails
  --dl-unc=UNC_PATH     download the file at a given UNC path                 ```
  --crawl-unc=UNC_PATH  recursively list all files at a given UNC path
```                                                                           ### Save emails to directory (BROKEN)

### List file shares

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --list-unc='\\DC02'
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --list-unc='\\DC02\SYSVOL\megacorp.local'
```

**Note:** Using an IP address or FQDN instead of a hostname in the UNC path may fail.

### View file on file share

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --dl-unc='\\DC02\guestshare\file.txt'
```

### Save file from file share

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' -o file.txt mx.megacorp.local --dl-unc='\\DC02\guestshare\file.txt'
```

### Crawl & download

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --crawl-unc='\\DC02\SYSVOL\megacorp.local' [--pattern xml,ini] [--download]
```

### Brute file shares

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --brute-unc [--prefix xyz]
```





























