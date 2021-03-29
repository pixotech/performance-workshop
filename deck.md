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

<video width="700" class="bg" poster="/assets/play.svg" onclick="this.paused ? this.play() : this.pause(); this.blur()" onpause="">
    <source src="/assets/layout-instability2.webm" type="video/mp4">
</video>

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

![bg left:40% 70%](/assets/lighthouse-logo.svg)

# Lighthouse

---

