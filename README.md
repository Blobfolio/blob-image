# blob-image

A brute-force, lossless JPEG/PNG image compressor written in BASH (no GUI dependencies).



##### Table of Contents

1. [Features](#features)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Use](#use)
5. [License](#license)


&nbsp;

## Features

blob-image is a command line script for Linux servers and desktops that helps automate the process of losslessly compressing JPEG and PNG images. Like [ImageOptim](https://imageoptim.com) and [Trimage](https://imageoptim.com), blob-image achieves maximum savings by running the source image through multiple compression libraries, brute-force-style. But unlike those programs, there are no GUI dependencies, so it can be installed without pulling in a bunch of extra crap. ;)


&nbsp;

## Requirements

blob-image has no GUI dependencies. All it requires is a Linux operating system and modern BASH shell.

Third-party utilities provide the actual compression magic. No single application is required, but for best results you should install each of the following:

#### PNG
 * [advpng](http://www.advancemame.it/doc-advpng.html)
 * [oxipng](https://github.com/shssoichiro/oxipng)
 * [pngcrush](http://pmt.sourceforge.net/pngcrush/)
 * [pngout](http://www.jonof.id.au/kenutils)

#### JPEG
 * [jpegoptim](http://www.kokkonen.net/tjko/projects.html)
 * [jpegrescan](https://github.com/kud/jpegrescan)
 * [jpegtran](https://github.com/mozilla/mozjpeg)


&nbsp;

## Installation

You can simply download the blob-image script and make it executable:

```bash
wget -O /usr/bin/blob-image https://raw.githubusercontent.com/Blobfolio/blob-image/master/blob-image && chmod +x /usr/bin/blob-image
```

Alternatively, `.deb` binaries are available via Blobfolio's APT repository for Debian Stretch and Ubuntu Artful. (Other Debian-based distributions may also work, but aren't officially supported.)

```bash
# Import the signing key.
wget -qO - https://apt.blobfolio.com/public.gpg.key | apt-key add -

# apt.blobfolio.com requires HTTPS connection support.
# This may or may not already be configured on your
# machine. If APT is unable to connect, install:
apt-get install apt-transport-https

# Debian Stretch.
echo "deb [arch=amd64] https://apt.blobfolio.com/debian/ stretch main" > /etc/apt/sources.list.d/blobfolio.list

# Ubuntu Artful.
echo "deb [arch=amd64] https://apt.blobfolio.com/debian/ artful main" > /etc/apt/sources.list.d/blobfolio.list

# Update APT sources.
apt-get update

# Install it!
sudo apt-get install blob-image
```


&nbsp;

## Use

The following runtime flags are available:

| Flag | Description |
| ---- | ----------- |
| -c, --color | Colorize output. |
| -d, --dry-run | Test compression without saving changes. |
| -h, --help  | Display documentation. |
| -l, --log *=/path*   | Log results to this path. Default: `/var/log/blob-image.log` |
| --max-age *=123* | Ignore files older (mtime) than this value (in minutes). |
| --min-age *=123* | Ignore files younger (mtime) than this value (in minutes). |
| --max-size *=123* | Ignore files larger than this value (in bytes). `K`, `M`, `G` units are allowed. | 
| --min-size *=123* | Ignore files smaller than this value (in bytes). `K`, `M`, `G` units are allowed. |
| -m, --multithreaded | Optimize performance for multithreaded systems. |
| -o, --overkill | By default jpegtran, advpng, and pngcrush are skipped when made redundant by MozJPEG or oxipng. Overkill Mode runs images through them anyway. |
| -q, --quiet | Do not throw anything to STDOUT. |
| --disable-advpng | Do not execute advpng. |
| --disable-jpegoptim | Do not execute jpegoptim. |
| --disable-jpegrescan | Do not execute jpegrescan. |
| --disable-jpegtran | Do not execute jpegtran. |
| --disable-oxipng | Do not execute oxipng. |
| --disable-pngcrush | Do not execute pngcrush. |
| --disable-pngout | Do not execute pngout. |
| --skip-jpeg | Do not process JPEG images. |
| --skip-png | Do not process PNG images. |

```bash
# blob-image [-args] [file/dir] [file/dir]...
blob-image -cm /home/josh/Pictures/foo.jpeg
```


&nbsp;

## License

Copyright © 2018 [Blobfolio, LLC](https://blobfolio.com) &lt;hello@blobfolio.com&gt;

This work is free. You can redistribute it and/or modify it under the terms of the Do What The Fuck You Want To Public License, Version 2.

    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
    Version 2, December 2004
    
    Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
    
    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.
    
    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
    
    0. You just DO WHAT THE FUCK YOU WANT TO.

### Donations

<table>
  <tbody>
    <tr>
      <td width="200"><img src="https://blobfolio.com/wp-content/themes/b3/svg/btc-github.svg" width="200" height="200" alt="Bitcoin QR" /></td>
      <td width="450">If you have found this work useful and would like to contribute financially, Bitcoin tips are always welcome!<br /><br /><strong>1Af56Nxauv8M1ChyQxtBe1yvdp2jtaB1GF</strong></td>
    </tr>
  </tbody>
</table>
