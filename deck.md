---

theme: gaia
class: lead
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

# While you are waiting...

Please install and download the following

- Install Google Chrome browser
- Install the latest version (7.3) of Lighthouse `npm install -g lighthouse`
- Install the latest version (0.7.0) of Lighthouse CI `npm install -g @lhci/cli`
- Download [the workshop repository](https://github.com/pixotech/performance-workshop) from Github
- Download the [audit worksheets](https://docs.google.com/document/d/13OprJnW2u4nHtjKq-F6U35Lpcbocz0xx1uZg61AOBZQ/edit?ts=606a989f) (optionally print it)

---

![bg left:40% 70%](/assets/discover.svg)

April 7, 1-4:30PM
# **Performance Testing Workshop**

Using Tools to Measure Performance and Best Practices

https://pixotech.com

![image](/assets/pixo-logo.svg)

---
<!--
footer: '![image](/assets/pixo-logo.svg)'
_class: lead
-->

## About us

---

## Steve Zazeski @sztech

![bg left:40% 70%](assets/steve-zazeski--320px.jpg)
- Alumni of **UIUC Computer Engineering**
- Started as a student worker in *College of ACES* - *Extension*, now downtown Urbana at Pixo across the street from *Crane Alley*
- Truly enjoy getting to work on the range from microcontrollers (ESP32/arduino) to cloud scale k8s clusters

---

## Jason Rambeck

![bg left:40% 70%](assets/jason-rambeck.jpg)

I've been building websites since 2002 and still loving it. At Pixo I am a lead web developer working primarily on content management systems and websites - 
especially WordPress.

---

![width:450px](assets/ahaslides-qr.png)
<a href="https://ahaslides.com/WEBCON" target="_blank" style="font-size:4rem;">ahaslides.com/WEBCON</a>

---

![hold on to your butts meme width:800px](/assets/hold-on-to-your-butts.gif)

---

## Why performance matters

---

# Internet Speeds in the US
![width:1000px](assets/internet-speed-website-speed.png)

---

# Netflix Speeds
![image](assets/netflix-2020-speeds.png)
- **0.5**mbps min, **3**mbps SD, **5**mbps HD, **25**mbps UHD
- https://ispspeedindex.netflix.net/about

---

# Mobile Speeds are increasing
![width:1000px](assets/opensignal_2021_devices.jpg)

---

# Future 5G
![width:1000px](assets/opensignal-4g-5g.jpg)

---

# Mobile Speed and Pageload Increases
![width:1000px](assets/internet-mobile-speed.png)

---

https://almanac.httparchive.org/en/2020/performance
![width:1000px](assets/lighthouse-distribution.png)

---

## User experience

Users studies have shown that page speed is the number one factor in user experience.

![width:700px](assets/ux-hierarchy.png)

Source: [SPEED MATTERS: Designing for mobile performance](https://www.awwwards.com/brain-food-perceived-performance/)

---

## Bounce rate

![image](assets/bounce-rates.png)

Source: [Google](https://www.thinkwithgoogle.com/marketing-resources/data-measurement/mobile-page-speed-new-industry-benchmarks/)

---

# Fast websites build trust
> — _Yesenia Perez Cruz_ [[Youtube]](https://www.youtube.com/watch?v=wBcPEZf0hwI)

---

# What is performance? 

* It is **not** as simple as how many seconds it takes for a page to load.
* There are a number of other **milestones** we can measure on the way to a complete page load that help define performance.
* It is **relative**: What the user wants to do, what their connection speed is, the power of their device.
* New visitors and repeat visitors have a different experience.

---

## Web Vitals

Google created a set of Web Vitals that help us think about (and measure) unique facets of performance experience.

---

## Core Web Vitals

Core Web Vitals are a subset of these metrics they have determined are the most meaningful.

![width:1000px](assets/core-web-vitals.png)

---

![bg left:40% 70%](assets/lcp_ux.svg)
# Largest Contentful Paint

[Measures](https://web.dev/lcp/) the time until the page displays what is likely its main content, like a hero image or heading

---

![width:800px](assets/lcp-example-1.png)
![width:800px](assets/lcp-example-2.png)

---

![bg left:40% 70%](assets/fid_ux.svg)
# First Input Delay

measures the interactivity of the page, from the user's first interaction to the time the page responds to it.
_Field only metric (not in Lighthouse)_

---

![width:1000px](assets/fid-diagram.svg)

---

![bg left:40% 70%](assets/cls_ux.svg)
# Cumulative Layout Shift

measures the degree of layout instability on the page, due to shifts like asynchronously loaded content being injected

---

<video width="700" class="bg" poster="/assets/play.svg" onclick="this.paused ? this.play() : this.pause(); this.blur()" onpause="">
    <source src="/assets/layout-instability2.webm" type="video/mp4">
</video>

---

# Other Web Vitals


---

# Speed Index (SI)

[Measures](https://web.dev/speed-index/) how quickly content is visually displayed during page load. Lighthouse first captures a video of the page loading in the browser and computes the visual progression between frames.
  
---

![width:1000px](/assets/speed-index-histogram.png)

---

# First Contentful paint (FCP)

[Measures](https://web.dev/fcp/) the time from when the page starts loading to when any part of the page's content is rendered on the screen.

---

![width:1000px](/assets/fcp-example.png)

---

# Time to Interactive (TTI)

[Measures](https://web.dev/tti/) the time from when the page starts loading to when it's visually rendered, its initial scripts (if any) have loaded, and it's capable of reliably responding to user input quickly.

---

![width:1000px](/assets/tti-diagram.svg)

---

# Total Blocking Time (TBT)

[Measures](https://web.dev/tbt/) the total amount of time between FCP and TTI where the main thread was blocked for long enough to prevent input responsiveness.

![width:1000px](assets/tbt-diagram.svg)

---
<!--
_class: lead
-->

![bg left:40% 70%](assets/lighthouse-logo.svg)

# Lighthouse

---

**There are multiple ways to use Lighthouse.**

* [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights) . Run Lighthouse and link to reports without installing a thing.
* [Chrome DevTools](https://developers.google.com/web/tools/lighthouse#devtools) . Easily audit pages that require authentication, and read your reports in a user-friendly format.
* [Command Line Interface](https://developers.google.com/web/tools/lighthouse#cli) . Automate your Lighthouse runs via shell scripts.
* [Node module](https://developers.google.com/web/tools/lighthouse#programmatic) . Integrate Lighthouse into your continuous integration systems.
---
<!--
_class: _default
-->

### Downside
* No easy way to export
* No "settings"
* Website must be public

### Upside
* Very easy
* Includes "field data" (limited available data)
* API - Can use this as a service to automate or build an application.

---

# Field data vs. Lab data

**Field data:** The Chrome User Experience Report is powered by real user measurement of key user experience metrics across the public web, aggregated from users who have opted-in to syncing their browsing history, have not set up a Sync passphrase, and have usage statistic reporting enabled.

---

![width:700px](assets/psi-vitals.png)

---

# Demo PSI

* CNN.com
* BestBuy.com
* Other

---

# cnn.com - Mobile

![width:1000px](assets/cnn-mobile.png)

---

# bestbuy.com - Desktop

![width:1000px](assets/bestbuycom-desktop.png)

---

# bestbuy.com - Mobile

![width:1000px](assets/bestbuycom-mobile.png)

---

# Space Jam website
https://www.spacejam.com/1996/

![width:1000px](assets/spacejam-desktop.png)

---

# Chrome DevTools

* Very easy
* Lots of settings available
* Affected by your computing power and internet connection
* Affected by your browser configuration and extensions

---

# Demo in DevTools

* CNN.com
* BestBuy.com
* Other

---

# Read the tips during a run

![width:1000px](assets/lighthouse-tips.png)

---

# ahaslides.com\WEBCON

## Find the fastest desktop sites you can find
`webcon.illinois.com 99`

## Find the slowest desktop sites you can find
`cnn.com 7`

---

## Best Results
 - giftofspeed.com - 100
 - spacejam.com/1996 - 100 (232kb)
 - dozzle.dev - 99 (time to interactive 0.3s)

## Worse Results
 - cnn.com - 7
 - tmz.com - 12
 
---

# Lighthouse command line tool

* Free of browser extensions
* Lots of settings available
* Scripting and automation
* Affected by your computing power and internet connection

---

# Demo CLI

```bash
npm install -g lighthouse
lighthouse https://bestbuy.com --view
```

---

## DevTools: Network Tab

* The waterfall
* The filmstrip
* Page size
* Request count
* DOMContentLoaded (Node tree)
* Load (images, assets)
* Finish (async requests)

DEMO

---

## DevTools: Performance profile

* Frames
* Web Vitals timeline
* Timings 
* Experience

DEMO

---

## Throttling

---

# Performance goals

Good performance is contextual. So set goals based on those contexts.

1) See content 
2) Click a thing


---
# Performance budgets

`lighthouse --budget-path budget-sample.json https://pixotech.com`

- Lighthouse can run an audit against your goals and show when you are making too many requests or too large of files in categories.
- There is no one set budget, but recommend always setting one
- Download our sample budget with all options on [github.com](https://github.com/pixotech/performance-workshop/blob/production/lighthouse-sample-configs/budget-sample.json)
- can only be used with cli or ci version

---

# Auditing your site

Download the [performance audit worksheet](https://docs.google.com/document/d/13OprJnW2u4nHtjKq-F6U35Lpcbocz0xx1uZg61AOBZQ/edit?ts=606a989f).

---
 
ahaslides.com/WEBCON
How is it going?

---

# "We can’t let **best** be the enemy of **better** code."
— Michael Feathers - Working Effectively With Legacy Code

---

# Don't chase a perfect 100 score

![width:800px](assets/lighthouse-100.png)

- Perfect 100 might be fast, but is it useful
- Metrics are changing, internet is changing, devices are changing

---

# Balance of Performance

App Single Request <-> Few Large Requests <-> Lots Small Requests 

- How fast does your site update?
- What connection does your user have?

---

# There is no one best,
# most performant website
it depends on your use case

---

# Waterfall View

![width:1000px](assets/waterfall-stevezazeskicom.jpg)

---

# Ideal Waterfall*

[**Single Request**](https://webcon-performance.pixotech.com/example-sites/single-call.html)

![width:1000px](assets/waterfall-singlefile.png)

---

# Real Ideal Waterfall

![width:1000px](assets/waterfall-caching.png)

---

![width:400px](assets/waterfall-option-menu.png)

---

# Activity : Test our site

What happens to this site?
https://poor-performance.pixodev.net/lots-of-images/


---

# Activity
## Test your site with Network tab waterfall

  - Is your main html page fast?
  - How many tiers of loads do you have?
  - What is/are your slow resources?

---

# Number of Concurrent Connections

Number of seperate resources that need to be loaded matters.

- Chrome 89 == **6**
- Firefox 68 == **9**
- Edge 18 == **12**

---

# Server Default Concurrent Connections

- Apache == **150**
- nginx == **512**
- iis == **5000**

Without load testing and tuning, these numbers are just limits

---

![width:250px](https://camo.githubusercontent.com/7a8b6a7f43c5fc685a5b5cd5541566fbaf42be38e0dc1c2ecc2c4963697d1c52/687474703a2f2f692e696d6775722e636f6d2f737a7a443971302e706e67)
- is a simple command line tool to place load on a webserver
    - `brew install hey` or download from https://github.com/rakyll/hey
- Be careful running the default settings
    - `hey https://poor-performance.pixodev.net` 50/s for 250 requests
    - `hey -n 5000 -c 10 https://poor-performance.pixodev.net` 10 requests per second for 5000 total requests 
    - `hey -z 10m -c 5 https://poor-performance.pixodev.net` runs for 10m with 5 requests per second

---

# Slashdot Effect / Viral Links

![image](https://www.sentex.ca/~mwandel/traffic/total-hits.png)

---

# Reverse Proxy Cache

 - Cloudflare
 - Fastly 
 - Cloudfront 
 - [Varnish](https://varnish-cache.org/)
 - [Nginx Proxy Manager](https://nginxproxymanager.com/screenshots)
   ![bg left:50% 100%](https://nginxproxymanager.com/screenshots/proxy-hosts-add.png)
   
---

# nginx

- Created in 2002 to solve the `C10k` issue for Rambler search engine
- Designed to outperform Apache, not as flexible
- Uses a different paradigm to avoid fork bombing and uses much less memory
- Its more difficult to setup, lots of docker containers just have apache
- Alot of its default settings have performance in mind, its just newer

---

# Take a BREAK

When you return we will cover common lighthouse issues

---

# Common Lighthouse Issues

- HTTP/2
- Serve static assets with an efficient cache policy
- Properly size images
  
- Image elements do not have explicit width and height
- Avoid enormous network payloads
- Minimize main-thread work

---

![image](assets/webserver-market.png)
https://news.netcraft.com/archives/category/web-server-survey/

---

# HTTP/2
- introduced May 2015, support added in Chrome 51
- Tries to fix the concept of multiple separate connections to the same server by opening a stream and pushing multiple requests through it.

---

 ![width:700px](assets/http2.png)

---

# Enable HTTP/2

  - apache `a2enmod http2`
  - nginx change site setting: `listen 443 ssl http2;`


  - https://tools.keycdn.com/http2-test
    ![width:500px](assets/http2-test.png)

---

# HTTP/3
- Introduced Feb 2021
- Replaces `TCP` for `QUIC` (pronounced QUICK) which is roughly a modified `UDP`
- TCP doesn't like out of order packet
- 14% of web servers, 7% of desktops, 0% of mobile support it (April 2021)
- (Chrome 79*, firefox 72*, safari 14)

---

# Gzip / Brotli

  - Module for Apache/nginx that compresses files in transit (mostly html, css, and js) during the transfer

  - gzip 78%, brotli 82% savings over uncompressed text

  - `mod_deflate` or `mod_gzip` or `mod_brotli`

---

https://tools.keycdn.com/brotli-test

![width:700px](assets/gzip-result.png)

---

# ahaslides.com/WEBCON

---

# Efficient cache policy 
  - Add headers `Cache-Control: max-age=31536000 public`
  - Apache or Nginx create or edit the root `.htaccess`
 ```
<FilesMatch ".(gif|jpg|jpeg|png|ico)$">
    Header set Cache-Control "max-age=#####"
</FilesMatch>
 ```
  - `86400` = 1 day, `2419200` = 1 month, `29030400` = 1 year

---

# Cache-Control Headers

## public
The response may be stored in any cache

## private
The response may be stored only in the browser's cache

---

# Cache-Control Headers

## no-cache
The response may be stored by any cache, even if the response is normally non-cacheable. However, the stored response MUST always go through validation with the origin server first before using it.

## no-store
The response may not be stored in any cache. Note that this will not prevent a valid pre-existing cached response being returned. Clients can set max-age=0

---

# Etag
  - Check the file hash to see if it has changed from the cached version
  - Most servers automatically add etag for you to static assets
  - `304 Not Modified`
  - `etag: "2d9d-5a31a59c7b011-gzip"`

---

# "There are two hard things in computer science: cache invalidation, naming things, and off-by-one errors."
— @codinghorror

---

# Apache Cache with `mod_expires`
```
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/gif "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/webp "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
    ExpiresByType image/x-icon "access plus 1 year"
    ExpiresByType video/mp4 "access plus 1 year"
    ExpiresByType video/mpeg "access plus 1 year"
    ExpiresByType text/css "access plus 1 week"
    ExpiresByType text/javascript "access plus 1 month"
    ExpiresByType application/javascript "access plus 1 month"
    ExpiresByType application/pdf "access plus 1 month"
</IfModule>
```
---

# Apache Cache with `mod_headers`
```
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

# nginx cache

`/etc/nginx/sites-available/default`
```
# Expires map
map $sent_http_content_type $expires {
    default                    off;
    text/html                  epoch;
    text/css                   max;
    application/javascript     max;
    ~image/                    max;
}

server {
    listen 80 default_server;
    listen [::]:80 default_server;

    expires $expires;
```

---

- When DevTools is open, it defaults to **Disable cache**
- Not realistic to what users will actually experience
  ![width:700px](assets/waterfall-caching.png)

___

# Cache Busting
  - Lets you use long cache periods and still change files

`src="image.png"`


`src="image.png?20210403"`
`src="image.png?v1"`

---

# Wordpress: Wp Super Cache

A very easy to use caching solution. This improves php load time, it doesn't minify css or change image formats.

![width:500px](assets/wordpress-supercache.png)

---

# ahaslides.com/WEBCON

---

# PageSpeed Modules
https://www.modpagespeed.com/

- Module that loads into Apache or Nginx and **best-effort** improves site performance automatically
    - css
    - images
    - minify / compresses

---

# Next Gen Image Formats

Original is 2044x3840 pixels

- gif     6.4MB
- jpg     1.8MB
- png    12.8MB
- webp    7.9MB

---
# Loss in Compression

  - **Lossy** slightly changes data to get better compression (JPG)
  - **Lossless** is an exact copy (PNG)
  - **Vector** resizable polygons to any size (SVG)

---
# Webp
  - Released Sept 2010 by Google
  - A next-gen Lossy and Losseless compression
  - ~25% smaller than PNG/JPG

`brew install webp`
`cwebp`

---

```
cwebp bestbuycom-desktop.png -q 80 -o bestbuycom-desktop.webp
  Saving file 'bestbuycom-desktop.webp'
  File:      bestbuycom-desktop.png
  Dimension: 3810 x 1894
  Output:    225252 bytes Y-U-V-All-PSNR 45.38 47.14 47.58   45.94 dB
             (0.25 bpp)
  block count:  intra4:       5514  (19.39%)
                intra16:     22927  (80.61%)
                skipped:     19952  (70.15%)
  bytes used:  header:            538  (0.2%)
               mode-partition:  35639  (15.8%)
   Residuals bytes  |segment 1|segment 2|segment 3|segment 4|  total
      macroblocks:  |       1%|       5%|      15%|      79%|   28441
        quantizer:  |      36 |      35 |      30 |      24 |
     filter level:  |      11 |       7 |      63 |      37 |
```

```   
1.6M  bestbuycom-desktop.png
419K  bestbuycom-desktop.jpg
220K  bestbuycom-desktop.webp
```

---

# Image Compression deep-dive

![image](assets/image-compression-deep-dive.png)
https://www.youtube.com/watch?v=F1kYBnY6mwg

---

# Wordpress: WebP Converter for Media

- Auto converts JPG/PNG to WebP
- Uses .htaccess to redirect .jpg/.png to a php file to decide what to serve
- Requires a gd library with webp support

- Most plugins use remote conversion and a limit/cost per image
  
---

  ![width:700px](assets/wordpress-webp.png)

---

# Image Resizing CDNs
 - Some let you place your full size image on your server
 - Use the CDN url which auto resizes

```
<img src="https://ik.imagekit.io/ikmedia/building.jpg" 
     srcset="https://ik.imagekit.io/ikmedia/building.jpeg?tr=w-300 300w,
             https://ik.imagekit.io/ikmedia/building.jpeg?tr=w-600 600w,
             https://ik.imagekit.io/ikmedia/building.jpeg?tr=w-900 900w"
/>
```

---

# Activity
## Find assets on your own website that can be improved
  - Try out : https://squoosh.app/
  - ---
# ahaslides.com/WEBCON


---

# Last Break
## Almost made it to 4.30pm...
When you return we will wrap up with CI/automations

---

# CI / Automations

---

# Statuscake - Page Speed Monitoring

- Free version will check 1 webpage per day
- Can set alerts if load time or file size goes over a set level
- Can throttle connection to simulate mobile

---

![width:1000px](assets/statuscake-page-speed.png)

---

# Start Monitoring your site

https://statuscake.com

---

# lhci
  - [Lighthouse Continuous Integration](https://github.com/GoogleChrome/lighthouse-ci)

`npm install -g @lhci/cli`
`lhci autorun`

```
lhci collect --url https://pixotech.com
lhci open
lhci upload --config file.json
     upload --target lhci --token 2348-3829 --serverBaseURL https://example.com
```

---

![image](assets/lighthouse-ci.png)

---

https://lighthouse-ci.pixodev.net

```
docker volume create lhci-data
docker container run --publish 9001:9001 --mount='source=lhci-data,target=/data' --detach patrickhulce/lhci-server
```

---

# Creating a new job

`lhci wizard`
```
new-project
? What is the URL of your LHCI server? https://pixo:pixo@lighthouse-ci.pixodev.net
? What would you like to name the project? basic-auth-test
? Where is the project's code hosted? nowhere
? What branch is considered the repo's trunk or main branch? main

Created project basic-auth-test (5a4060d1-f122-422f-80b8-5d6e74926965)!
Use build token b54c8ac2-123-123-123-ff3c04e988e0 to add data.
Use admin token KkGbJNDbEqLsdfsvWilLKdlmG2sY5Il5cocyKEgR to manage data. KEEP THIS SECRET!
```

**Please save this somewhere,** if you lose the token you can't even delete the project

---

# When to use lhci instead of lighthouse
  - You want automated runs of lighthouse with a config file running the entire process
  - You can still script `lighthouse`
  - You want to upload to a particular destination

---

`.lighthouserc.json` in the root directory (or .yaml or .js)
```
{
  "ci": {
    "collect": {
       "url": ["https://pixotech.com/"],
       "numberOfRuns": 3
    },
    "assert": {
       "preset": "lighthouse:all" ,
       "budgetFile": "budget.json"
    },
    "upload": {
      "target": "lhci",
      "token": "56d601b2-342a-1234-1234-9ae4f8721e9e",
      "serverBaseUrl": "https://pixo:pixo@lighthouse-ci.pixodev.net/"
    }
  }
}
```

---

# Getting started with lhci

```
FOLDER_NAME=steve-zazeski-com-lighthouse

mkdir ${FOLDER_NAME}
cd ${FOLDER_NAME}
git init
git branch daily-test && git checkout daily-test
vi .lighthouserc.json

git commit --allow-empty -m "Run for `date -u +%Y.%m.%d-%H.%M`"
lhci autorun
```

[configuration](https://github.com/GoogleChrome/lighthouse-ci/blob/main/docs/configuration.md)



---

# Lighthouse with Jenkins

If the executor has chrome, lighthouse, lhci installed:
```
lhci autorun
```

If you are using a docker node and give it the `.lighthouserc.json`
```
docker container run --cap-add=SYS_ADMIN --rm \
  --cpus="1" --shm-size=2g \
  -v "$(pwd)/lhci-data:/home/lhci/reports/.lighthouseci" \
  patrickhulce/lhci-client \
  lhci autorun
```

---

add `.github/workflows/audit.yml` file with:
```
name: Performance Audit
on: [pull_request]
jobs:
  build:
    runs-on: ubuntu-lates
    steps:
      - uses: actions/checkout@v1
      - name: Use Node.js 12.x
        uses: actions/setup-node@v1
        with:
          node-version: 12.x
      - name: Install
        run: |
          npm ci
      - name: Build
        run: |
          npm run build
      - name: Run Lighthouse CI
        run: |
          npm install -g @lhci/cli@0.3.x
          lhci autorun
```


---

# DNS

- Penalty you pay on first load of a sub/domain
- Fast sites lookup in ~20ms
- Normal sites lookup less than ~100ms

`dig pixotech.com` mac linux
`nslookup -debug pixotech.com` win

```
; <<>> DiG 9.10.6 <<>> pixotech.com
;pixotech.com.			IN	A
pixotech.com.		77	IN	A	52.34.48.14
;; Query time: 82 msec
```

---

# DNS - CNAMES

- All DNS queries recurse until they end in A / AAAA record

```
build.pixotech.com.	299	IN	CNAME	on-premise-docker-swarm.pixodev.net.
on-premise-docker-swarm.pixodev.net. 59	IN CNAME icarus.pixodev.net.
icarus.pixodev.net.	59	IN	A	173.167.185.184

;; Query time: 219 msec
```

---

# Fastest DNS Resolution

- Bare A Records if possible
- Higher TTLs (median is 300)
    - 1800s = microsoft.com
    - 300s = facebook.com gmail.com youtube.com google.com apple.com
    - upstream dns typically do not acknowledge a TTL of less than 30 seconds.

---


# Mobile Testing
- Simulated CPU and Network slowdowns
  ![width:500px](assets/lighthouse-network-throttling.png)

---

# Real Mobile Testing
https://webpagetest.org/
![width:500px](assets/mobile-speeds.png)

---

# scrcpy (screen copy)

  - Allows your machine to control a real device as though it was a simulator
  - No lag, no emulation
  - https://github.com/Genymobile/scrcpy
  - `brew install scrcpy`

---

# DevTools on Mobile Devices

1. Connect phone via USB
1. Enable Developer Mode on the phone ()
1. Authorize debugging (will reprompt in 14 days)
1. Goto **chrome:\\inspect** on your desktop chrome
1. Click **inspect** on the tab you want to open devtools on

---

![width:900px](/assets/lighthouse-pwa.png)

---

# PWA

Progressive web apps are coming with moderate support on iOS and Android.

- JS code that can run offline through service workers
- Cache layer for offline
- Be careful with service workers updating (create-react-app)


---


# Critical Path CSS

- Fix for layout shift

https://jonassebastianohlsson.com/criticalpathcssgenerator/
https://criticalcss.com

`yarn add --dev penthouse`


---

![width:1000px](assets/criticalpathcss.png)

---

# Recap

---

- lighthouse checks via `online`, `devtools`, `cli` or `ci`
- Look at the waterfall for bottlenecks
- Enable Server Caching
- Enable Server Compression (gzip or brotli)
- Use monitoring (statuscake)
- Test your site with load before someone else does
- Fix just the worse thing at the moment, then repeat
- Don't let best get in the way of better

---

ahaslides.com/WEBCON

---
