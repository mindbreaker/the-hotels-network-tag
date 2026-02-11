# The Hotels Network (THN) Tag for Google Tag Manager

This is a inofficial Google Tag Manager custom template that allows you to easily implement **The Hotels Network** scripts on your website without hardcoding HTML.

It dynamically injects the `loader.js` script by providing your unique Partnership ID and optionally loads the `connect.js` script via a Site ID.

[![Template Status](https://img.shields.io/badge/Community%20Template%20Gallery%20Status-published-green)](https://tagmanager.google.com/gallery/#/owners/mindbreaker/templates/the-hotels-network-tag)

## Setup

1. In Google Tag Manager, go to **Templates** and import the template or install it from the Community Template Gallery.
2. Create a new tag using the **The Hotels Network (THN)** template.
3. Enter your **Partnership ID** (required).
4. Enter your **Site ID** (optional) if you also need the `connect.js` script.
5. Set your trigger (e.g. All Pages) and publish.

## Parameters

| Parameter | Required | Description |
|---|---|---|
| Partnership ID | Yes | Your unique THN partnership identifier. Loads `loader.js`. |
| Site ID | No | Your THN site identifier. If provided, additionally loads `connect.js`. |

## What it does

The tag injects the following scripts from The Hotels Network:

**Always loaded:**
```
https://www.thehotelsnetwork.com/js/loader.js?partnership_id=YOUR_PARTNERSHIP_ID
```

**Loaded only when a Site ID is provided:**
```
https://www.thehotelsnetwork.com/js/connect.js?site_id=YOUR_SITE_ID
```

Both scripts are loaded asynchronously. The tag reports success only after all required scripts have loaded successfully.

## Permissions

The template requests the following sandboxed permissions:

- `inject_script` for `https://www.thehotelsnetwork.com/js/loader.js*` and `https://www.thehotelsnetwork.com/js/connect.js*`
- `logging` in debug mode
