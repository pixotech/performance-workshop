---

theme: gaia
_class: lead
paginate: true
backgroundColor: #eff5f5
backgroundImage: url('/assets/white-top.svg')
backgroundSize: 250%
backgroundPosition: center -20px
style: |
section pre>code {
background: #222;
}
section.lead h1 {
color: #002279;
}
section.lead h1 strong {
color: #002279;
}
footer {
height: 80px;
display: flex;
align-items: center;
justify-content: flex-end;
margin-right: 50px
}
video {
display: flex;
align-self: center;
box-shadow: black 0px 0px 40px 0px;
background-color: #47cbbf;

    }
marp: true

---

![bg left:40% 70%](/assets/discover.svg)

# **Performance Testing Workshop**

This deck gets merged into the deck.md


![image](/assets/pixo-logo.svg)

---
<!--
footer: '![image](/assets/pixo-logo.svg)'
_class: lead
-->

---

> "We can’t let **best** be the enemy of **better** code."
— Michael Feathers - Working Effectively With Legacy Code

---

# Balance of Performance

App <-> Single File Website <-> All separate files

- There is no one best, most performant website, it depends on use cases.
- How fast does the site update?
- What connection does your user have?

---

# Waterfall View

- Timeline of when resources are requested and completed
- Devtools has two : Performance and Network tabs
- Useful with cache enabled and disabled

![image](/assets/waterfall-overview.png)

---

# Ideal Waterfall


---

# Statuscake Page Speed Monitoring

- Free version will check 1 webpage per day

![image](/assets/statuscake-page-speed.png)

- Can set alerts if load time or file size goes over a set level
- Can throttle connection to simulate mobile

---

# Number of Concurrent 

Number of seperate resources that need to be loaded matters.

- Chrome 89 == **6**
- Firefox 68 == **9**
- Edge 18 == **12**

---

# Default Concurrent

- Apache == 8 threads **150**
- nginx == **512**
- iis == **5000**

---

# hey

![image](https://camo.githubusercontent.com/7a8b6a7f43c5fc685a5b5cd5541566fbaf42be38e0dc1c2ecc2c4963697d1c52/687474703a2f2f692e696d6775722e636f6d2f737a7a443971302e706e67)
- is a simple command line tool to place load on a webserver
   - `brew install hey`
- Be careful running the default settings, 50 req/s for 250 request can be alot for dynamic sites without cache, for static/cached its fine.
    - `hey https://poor-performance.pixodev.net` defaults to 50reqs/s for 250 requests
    - `hey -n 500 -c 10 https://poor-performance.pixodev.net` 500 requests at 10/s
    - `hey -z 10m -c 5 https://poor-performance.pixodev.net` runs for 10m with 5/s

---

# Common Lighthouse Issues

- Properly size images
- HTTP/2
- Serve static assets with an efficient cache policy
- Image elements do not have explicit width and height
- Avoid enormous network payloads
- Minimize main-thread work

---

# Nginx

- Created in 2002 to solve the C10k issue for Rambler search engine
- Designed to outperform Apache, not as flexible
- Uses a different paradigm to avoid fork bombing and uses much less memory
- Its more difficult to setup, lots of docker containers just have apache

---

# HTTP/2
- introduced May 2015, added in Chrome 51
- Tries to fix the concept of multiple separate connections to the same server by opening a stream and pushing multiple requests through it.

---

# Enable HTTP/2 in apache

on docker
`RUN a2enmod http2`


https://tools.keycdn.com/http2-test

---

# HTTP/3
- Introduced Feb 2021
- Replaces `TCP` for `QUIC` (pronounced QUICK) which is roughly a modified `UDP`
- TCP doesn't like out of order packet
- 14% of web servers, 7% of desktops, 0% of mobile support it (April 2021)
- (Chrome 79*, firefox 72*, safari 14)
---

Gzip / Brotli

https://tools.keycdn.com/brotli-test

---

# Serve static assets with an efficient cache policy
  - Add Cache headers
    `Cache-Control: max-age=31536000`

  - Apache or Nginx create or edit the root `.htaccess`
 ```
 # cache images content for one month
<FilesMatch ".(gif|jpg|jpeg|png|ico)$">
    Header set Cache-Control "max-age=2592000"
</FilesMatch>
 ```

 - `86400` = 1 day
 - `604800` = 1 week
 - `2419200` = 1 month
 - `29030400` = 1 year

---

# Apache Cache htaccess

uses `mod_expired`
```
<IfModule mod_expires.c>
    ExpiresActive On

    # Images
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/gif "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/webp "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
    ExpiresByType image/x-icon "access plus 1 year"
  
    # Video
    ExpiresByType video/mp4 "access plus 1 year"
    ExpiresByType video/mpeg "access plus 1 year"

    # CSS, JavaScript
    ExpiresByType text/css "access plus 1 week"
    ExpiresByType text/javascript "access plus 1 month"
    ExpiresByType application/javascript "access plus 1 month"

    # Others
    ExpiresByType application/pdf "access plus 1 month"
    ExpiresByType application/x-shockwave-flash "access plus 1 month"
</IfModule>
```

uses `mod_headers`
```
# BROWSER CACHING USING CACHE-CONTROL HEADERS
<ifModule mod_headers.c> 
    # One year for image and video files
    <filesMatch ".(flv|gif|ico|jpg|jpeg|mp4|mpeg|png|svg|swf|webp)$">
        Header set Cache-Control "max-age=31536000, public"
    </filesMatch>

    # One month for JavaScript and PDF files
    <filesMatch ".(js|pdf)$">
        Header set Cache-Control "max-age=2592000, public"
    </filesMatch>

    # One week for CSS files
    <filesMatch ".(css)$">
        Header set Cache-Control "max-age=604800, public"
    </filesMatch>
</ifModule>
```

---

# no-cache

Actually doesn't mean the assets won't be cached


---

When DevTools is open, it defaults to Disable cache which is normally what you want. To see i

___

# Cache Busting

`image.png`

`image.png?20210403`
- Your browser will treat this as a new file

---

# Wordpress: Wp Super Cache 

A very easy to use caching solution. This improves php load time, it doesn't minify css or change image formats.

![bg left:40% 70%](/assets/wordpress-supercache.png)

---

# PageSpeed Modules
https://www.modpagespeed.com/

- Module that loads into Apache or Nginx and **best-effort** improves site performance automatically
  - css
  - images

---


# Next Gen Image Formats

Original is 2044x3840 pixels

- gif     6.4MB
- jpg     1.8MB
- png    12.8MB 
- webp    7.9MB

---

# Image Comrpession deep-dive

https://www.youtube.com/watch?v=F1kYBnY6mwg
![image](assets/image-compresion-deep-dive.png)

---
 - Lossy vs Lossless vs Vector
 - https://squoosh.app

---


# Lighthouse-ci
Continuous Integration for Lighthouse

https://github.com/GoogleChrome/lighthouse-ci

`npm install -g @lhci/cli`

`lhci collect --url https://pixotech.com`
`lhci open`
`lhci upload`

`lhci autorun`

---

# When to use lhci instead of lighthouse

- You want automated runs of lighthouse

---


# Getting started with lhci

```
mkdir steve-zazeski-com-lighthouse
git init
# 

lhci collect --url https://pixotech.com
git commit --allow-empty -m 'Run for `date -u +"%Y.%m.%d-%H.%M"`
lhci open
lhci upload --config lhci.conf

```

---

# lighthouserc.json
(lighthouse runtime config)

- Place this in the root of the site and then run `lhci autorun`

```
// lighthouserc.js
module.exports = {
  ci: {
    collect: {
       startServerCommand: 'npm run server',
       url: ['http://localhost:4000/'],
       numberOfRuns: 5,
    },
    assert: {
       preset: 'lighthouse:all' // lighthoues:recommended, lighthouse:no-pwa
       // budgetFile: './lighthousebudget.json' 
    },
    upload: {
      target: 'temporary-public-storage',
    },
  },
};
```

---

# Lighthouse with Jenkins

```

```

---

# DNS

- Penalty you pay on first load for each subdomain
- Fast sites lookup in ~20ms
- Normal sites lookup in ~100ms

`dig pixotech.com
```
; <<>> DiG 9.10.6 <<>> pixotech.com
;pixotech.com.			IN	A
pixotech.com.		77	IN	A	52.34.48.14
;; Query time: 82 msec
```
`nslookup -debug pixotech.com`

---

# Fastest Resolution

- Bare A Records only
- Higher TTLs (median is 300)
  - microsoft.com 1800s (30m)
  - facebook.com 300s
  - gmail.com 300s
  - youtube.com 300s
  - google.com 90s
  - apple.com 36s
  
---

# DevTools on Mobile Devices

* Connect phone via USB
* Enable Developer Mode on the phone ()
* Authorize debugging (will reprompt in 14 days)
* Goto <a href="chrome:\\inspect">chrome:\\inspect</a> on your desktop
