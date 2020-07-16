# wormhole

[![Build Status](https://travis-ci.com/opus-codium/puppet-wormhole.svg?branch=master)](https://travis-ci.com/opus-codium/puppet-wormhole)

#### Table of Contents

<!-- vim-markdown-toc GFM -->

* [Module Description](#module-description)
* [Setup](#setup)
	* [Beginning with wormhole](#beginning-with-wormhole)
* [Usage](#usage)
	* [Sending a file from a remote host](#sending-a-file-from-a-remote-host)
	* [Receiving a file from a remote host](#receiving-a-file-from-a-remote-host)
	* [Sending a file from the local host](#sending-a-file-from-the-local-host)
	* [Receiving a file on the local host](#receiving-a-file-on-the-local-host)

<!-- vim-markdown-toc -->

## Module Description

The wormhole module lets you use Puppet / Bolt / Choria to manage [magic wormhole](https://github.com/warner/magic-wormhole) and transfer files between nodes.

## Setup

### Beginning with wormhole

Including the wormhole class should be enought to get started:

```puppet
class { 'wormhole':
}
```

## Usage

### Sending a file from a remote host

```sh-session
user@host ~ % bolt task run wormhole::send -t source.example.com filename=/etc/motd
Started on source.example.com...
Finished on source.example.com:
  {
    "code": "6-resistor-puppy"
  }
Successful on 1 target: source.example.com
Ran on 1 target in 6.3 sec
```

### Receiving a file from a remote host

```sh-session
user@host ~ % bolt task run wormhole::receive -t target.example.com filename=/tmp/source-motd code=6-resistor-puppy
```

### Sending a file from the local host

```sh-session
user@host ~ % wormhole send /etc/motd
Sending 322 Bytes file named 'motd'
Wormhole code is: 9-article-escape
On the other computer, please run:

wormhole receive 9-article-escape

```

### Receiving a file on the local host

```sh-session
user@host ~ % wormhole receive
Enter receive wormhole code:
```


