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
<!--
_class: lead
-->
Users studies have shown that page speed is the number one factor in user experience.

![width:700px](/assets/ux-hierarchy.png)

Source: [SPEED MATTERS: Designing for mobile performance](https://www.awwwards.com/brain-food-perceived-performance/)

---

## Bounce rate
<!--
_class: lead
-->

![image](/assets/bounce-rates.png)

Source: [Google](https://www.thinkwithgoogle.com/marketing-resources/data-measurement/mobile-page-speed-new-industry-benchmarks/)

---

<!--
_class: lead
-->

## Trust

> **Fast websites build trust**
> -- _Yesenia Perez Cruz_ [[Youtube]](https://www.youtube.com/watch?v=wBcPEZf0hwI)

---

# What is performance? 

* It is **not** as simple as how many seconds it takes for a page to load.
* There are a number of other **milestones** we can measure on the way to a complete page load that help define performance.
* It is **relative**: What the user wants to do, what their connection speed is, the power of their device.
* New visitors and repeat visitors have a different experience.

---
<!--
_class: lead
-->
## Web Vitals

Google created a set of Web Vitals that help us think about (and measure) a unique facet of performance experience.

---
<!--
_class: lead
-->
## Core Web Vitals

Core Web Vitals are a subset of these metrics that they have determined are the most meaningful.

![width:1000px](/assets/core-web-vitals.png)

---

![bg left:40% 70%](/assets/lcp_ux.svg)
# Largest Contentful Paint

measures the time until the page displays what is likely its main content, like a hero image or heading

---

![bg left:40% 70%](/assets/fid_ux.svg)
# First Input Delay

measures the interactivity of the page, from the user's first interaction to the time the page responds to it

---

![bg left:40% 70%](/assets/cls_ux.svg)
# Cumulative Layout Shift

measures the degree of layout instability on the page, due to shifts like asynchronously loaded content being injected

---
<!--
_class: lead
-->
<video width="700" class="bg" poster="/assets/play.svg" onclick="this.paused ? this.play() : this.pause(); this.blur()" onpause="">
    <source src="/assets/layout-instability2.webm" type="video/mp4">
</video>

---

# Other Vitals

* [First contentful paint (FCP)](https://web.dev/fcp/): measures the time from when the page starts loading to when any part of the page's content is rendered on the screen.
* [Time to Interactive (TTI)](https://web.dev/tti/): measures the time from when the page starts loading to when it's visually rendered, its initial scripts (if any) have loaded, and it's capable of reliably responding to user input quickly.
* [Total blocking time (TBT)](https://web.dev/tbt/): measures the total amount of time between FCP and TTI where the main thread was blocked for long enough to prevent input responsiveness.

---

![bg left:40% 70%](/assets/lighthouse-logo.svg)

# Lighthouse

There are multiple ways to use Lighthouse.

* [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights) . Run Lighthouse and link to reports without installing a thing.
* [Chrome DevTools](https://developers.google.com/web/tools/lighthouse#devtools) . Easily audit pages that require authentication, and read your reports in a user-friendly format.
* [Command Line Interface](https://developers.google.com/web/tools/lighthouse#cli) . Automate your Lighthouse runs via shell scripts.
* [Node module](https://developers.google.com/web/tools/lighthouse#programmatic) . Integrate Lighthouse into your continuous integration systems.
---

# Google PageSpeed Insights (PSI)

Downside
* No easy way to export
* No "settings"
* Website must be public

Upside
* Very easy
* Includes "field data" (limited available data)
* API - Can use this as a service to automate or build an application.

---

# PSI Report with real-world field data from the Chrome User Experience Report

The Chrome User Experience Report is powered by real user measurement of key user experience metrics across the public web, aggregated from users who have opted-in to syncing their browsing history, have not set up a Sync passphrase, and have usage statistic reporting enabled.

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
lighthouse https://cnn.com
```

---

