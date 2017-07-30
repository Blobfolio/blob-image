# blob-image

A brute-force, lossless JPEG/PNG image compressor written in BASH (no GUI dependencies).



##### Table of Contents

1. [Features](#features)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Use](#use)
5. [License](#license)



## Features

blob-image is a command line script for Linux servers and desktops that helps automate the process of losslessly compressing JPEG and PNG images. Like [ImageOptim](https://imageoptim.com) and [Trimage](https://imageoptim.com), blob-image achieves maximum savings by running the source image through multiple compression libraries, brute-force-style. But unlike those programs, there are no GUI dependencies, so it can be installed without pulling in a bunch of extra crap. ;)



## Requirements

blob-image has no GUI dependencies. All it requires is a Linux operating system and BASH shell.

Third-party utilities provide the actual compression magic. No single application is required, but for best results you should install each of the following:

#### PNG
 * [advpng](http://www.advancemame.it/doc-advpng.html)
 * [OptiPNG](http://optipng.sourceforge.net/)
 * [pngcrush](http://pmt.sourceforge.net/pngcrush/)
 * [PNGOUT](http://www.jonof.id.au/kenutils)

#### JPEG
 * [jpegoptim](http://www.kokkonen.net/tjko/projects.html)
 * [jpegrescan](https://github.com/kud/jpegrescan)



## Installation

You can simply download the blob-image script and make it executable:

```bash
wget -O /usr/bin/blob-image https://raw.githubusercontent.com/Blobfolio/blob-image/master/blob-image && chmod +x /usr/bin/blob-image
```

Alternatively, `.deb` binaries are available via Blobfolio's APT repository for Debian Stretch and Ubuntu Zesty. (Other Debian-based distributions may also work, but aren't officially supported.)

```bash
# Import the signing key
wget -qO - https://apt.blobfolio.com/public.gpg.key | apt-key add -

# apt.blobfolio.com requires HTTPS connection support.
# This may or may not already be configured on your
# machine. If APT is unable to connect, install:
apt-get install apt-transport-https

# Debian Stretch
echo "deb [arch=amd64] https://apt.blobfolio.com/debian/ stretch main" > /etc/apt/sources.list.d/blobfolio.list

# Ubuntu Zesty
echo "deb [arch=amd64] https://apt.blobfolio.com/debian/ zesty main" > /etc/apt/sources.list.d/blobfolio.list

# Update APT sources
apt-get update

# Install it!
sudo apt-get install blob-image
```



## Use

The following runtime flags are available:

> -q
> Suppress STDOUT

> -mt
> Use multi-threading

> -f */path/to/file*
> Compress a single file

> -d */path/to/directory*
> Recursively search *directory* for JPEG/PNG images and compress them all

```bash
# example
blob-image -f /home/josh/Pictures/foo.jpeg
```

Results are logged to `/var/log/blob-image.log`. The log file must be writeable by the user executing the blob-image script. If logging doesn't work, you can try:

```bash
sudo touch /var/log/blob-image.log
sudo chown yourusername: /var/log/blob-image.log
```



## License

Copyright © 2017 [Blobfolio, LLC](https://blobfolio.com) &lt;hello@blobfolio.com&gt;

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
