# CVE-2021-22204-exiftool
Python exploit for the CVE-2021-22204 vulnerability in Exiftool.

## About the vulnerability
The CVE-2021-22204 was discovered and reported by William Bowling. (@wcbowling)

This exploit was made by studying the exiftool patch after the CVE was already reported.

## Pre-requisites
Installed exiftool and djvulibre tools. If you are on Debian or ubuntu you can install with: 
```
sudo apt install djvulibre-bin exiftool
```

## How to run:
Change the IP and Port in the exploit.py file. You can test the reverse shell with 
```
nc -nvlp 9090  # or the port you specify in the exploit.py file
```
Then:
```
python3 exploit.py
```

And the image.jpg will trigger the vulnerability when opened with a vulnerable exiftool. 

If you want to practice, there is a small [lab here.](https://github.com/convisoappsec/CVE-2021-22204-exiftool/tree/master/lab)
