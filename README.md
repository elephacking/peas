# PEAS

This is a merge of a couple PEAS forks to fix things and add features.

#### Setup and install

Just use the Dockerfile:

```
docker buid . -t peas
```

Entrypoint is peas so you will need to do:

```
docker run -it peas <args>
```

If you are downloading files, map a volume to save things.


#### Command line reference

```
 _ __   ___  __ _ ___
| '_ \ / _ \/ _' / __|
| |_) |  __/ (_| \__ \
| .__/ \___|\__._|___/
|_| - Probe ActiveSync

Usage: python -m peas [options] <server>

Options:
  -h, --help            show this help message and exit
  -u USER               username
  -p PASSWORD           password
  -q                    suppress all unnecessary output
  --smb-user=USER       username to use for SMB operations
  --smb-pass=PASSWORD   password to use for SMB operations
  --verify-ssl          verify SSL certificates (important)
  -o FILENAME           output to file
  -O PATH               output directory (for specific commands only, not
                        combined with -o)
  -F repr,hex,b64,stdout,stderr,file
                        output formatting and encoding options
  --pattern=PATTERN     filter files by comma-separated patterns (--crawl-unc)
  --download            download files at a given UNC path while crawling
                        (--crawl-unc)
  --prefix=PREFIX       NetBIOS hostname prefix (--brute-unc)
  --check               check if account can be accessed with given password
  --emails              retrieve emails
  --list-unc=UNC_PATH   list the files at a given UNC path
  --dl-unc=UNC_PATH     download the file at a given UNC path
  --crawl-unc=UNC_PATH  recursively list all files at a given UNC path
  --brute-unc           recursively list all files at a given UNC path
  ```


### Examples (Update this)

####  List file shares

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --list-unc='\\DC02'
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --list-unc='\\DC02\SYSVOL\megacorp.local'
```

**Note:** Using an IP address or FQDN instead of a hostname in the UNC path may fail.

#### View file on file share

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --dl-unc='\\DC02\guestshare\file.txt'
```

#### Save file from file share

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' -o file.txt mx.megacorp.local --dl-unc='\\DC02\guestshare\file.txt'
```

#### Crawl & download

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --crawl-unc='\\DC02\SYSVOL\megacorp.local' [--pattern xml,ini] [--download]
```

#### Brute file shares

```
$ peas -u 'MEGACORP\s.freeside' -p 'Passw0rd1!' mx.megacorp.local --brute-unc [--prefix xyz]
```


### TODO

* Build a wrapper to make usage faster
* Integrate exchanger to make grabbing host discover faster
