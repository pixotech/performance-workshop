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

![bg left:40% 70%](/assets/discover.svg)

# **Performance Testing Workshop**

Using Tools to Measure Performance and Best Practices

https://pixotech.com

![image](/assets/pixo-logo.svg)

---
<!--
footer: '![image](/assets/pixo-logo.svg)'
_class: lead
-->



---

## About us

---

## Steve Zazeski

---

## Jason Rambeck

---

## Why performance matters

---

## User experience

Users studies have shown that page speed is the number one factor in user experience.

![width:700px](/assets/ux-hierarchy.png)

Source: [SPEED MATTERS: Designing for mobile performance](https://www.awwwards.com/brain-food-perceived-performance/)

---

## Bounce rate

![image](/assets/bounce-rates.png)

Source: [Google](https://www.thinkwithgoogle.com/marketing-resources/data-measurement/mobile-page-speed-new-industry-benchmarks/)

---

## Trust

> **Fast websites build trust**
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

![width:1000px](/assets/core-web-vitals.png)

---

![bg left:40% 70%](/assets/lcp_ux.svg)
# Largest Contentful Paint

[Measures](https://web.dev/lcp/) the time until the page displays what is likely its main content, like a hero image or heading

---

![width:800px](/assets/lcp-example-1.png)
![width:800px](/assets/lcp-example-2.png)

---

![bg left:40% 70%](/assets/fid_ux.svg)
# First Input Delay

measures the interactivity of the page, from the user's first interaction to the time the page responds to it.
_Field only metric (not in Lighthouse)_

---

![width:1000px](/assets/fid-diagram.svg)

---

![bg left:40% 70%](/assets/cls_ux.svg)
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

![width:1000px](/assets/tbt-diagram.svg)

---
<!--
_class: lead
-->

![bg left:40% 70%](/assets/lighthouse-logo.svg)

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

![width:700px](/assets/psi-vitals.png)

---

# Demo PSI

* CNN.com
* BestBuy.com
* Other

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

# The command line

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

# DevTools

---

## DevTools: Network

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

Lighthouse can run an audit against your goals and deliver a report showing how your goals match up.

---

# Auditing a page

--- 

Download the [performance audit worksheet]().
## 📋

---
