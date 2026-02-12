___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "The Hotels Network (THN)",
  "brand": {
    "id": "thn",
    "displayName": "The Hotels Network",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAOCAYAAAAmL5yKAAAABmJLR0QA/wD/AP+gvaeTAAAB8UlEQVQokZXQPYhVZxDG8d+8R1fX1dSJYCMGi7VZ7lkwhZBrIQkWIn5AiFsERMQiMaSMhakstDBECIt2MQksiiLYaqVI7ocsVsGEBS1EUGR3xZi9557XYo9mUZs88MLM8MzM/50Anc4+Ed9iKxbws7I847VyTvr9w+r6S6wT8VTO501OXk46ne9FXMIDi4sf4QJO6/X2vhnQ75+S87SUrpib244/RVzS7X6TRBxvtpzVbldGR39q8qMrCJbjiBkHDw4VxbmmfijhsZUaH3+OIUpw8+ZafIChiYlHoKq2N+5HodfbKeeruCPnEyYn/9Dt/ovV+EzOq0RcRyXnz6W0Tc4/4AV2J63WDVX1sZwvS2l8BUtgl4idb/KUPpVzIeIrS0ublWU/vE/LBCMWF0fBhg3/YElZrnnbmt474H9oFbh/f42FhV3qeouIERRg/frv3unodKawWsQ1Zfkk6XQmzM//LedfRRS4i9zY7zbvP0XMiZjCX3q9HaHbvYo9Iqa0WhflHHq9AYq3bjBUlsvE/f4n6vo27iVsAlV1C8zObmy+MK/dfqndfolnKMzOjoHhcNjwfJjwOyiKY3IOVbW/QZ1eAX4NDAZHzcwUIr5u6ueiOcwXIo6IGFPXlYhftFrTIuqGasxgcBIHMIKH+FFZ/vYKdum61yY3n1MAAAAASUVORK5CYII="
  },
  "description": "Unofficial Hotels Network Tag. Loads the The Hotels Network Partner loader script with dynamic partnership ID and optionally the connect script with a site ID.",
  "categories": ["ADVERTISING"],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "partnershipId",
    "displayName": "Add your Partnership ID",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "siteId",
    "displayName": "Add your Site ID (optional)",
    "simpleValueType": true,
    "help": "Leave empty if not needed. e.g. 01F6M1ERXRS6M49SCW82ATWHE7"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const encodeUriComponent = require('encodeUriComponent');
const log = require('logToConsole');

const partnerId = data.partnershipId;
const siteId = data.siteId;

const loaderUrl = 'https://www.thehotelsnetwork.com/js/loader.js?partnership_id=' + encodeUriComponent(partnerId);

let scriptsToLoad = 1;
let scriptsLoaded = 0;

const checkComplete = () => {
  scriptsLoaded++;
  if (scriptsLoaded === scriptsToLoad) {
    data.gtmOnSuccess();
  }
};

const onFailure = () => {
  log('The Hotels Network: a script failed to load.');
  data.gtmOnFailure();
};

if (siteId) {
  scriptsToLoad = 2;
  const connectUrl = 'https://www.thehotelsnetwork.com/js/connect.js?site_id=' + encodeUriComponent(siteId);
  injectScript(connectUrl, checkComplete, onFailure, 'thnConnect');
}

injectScript(loaderUrl, checkComplete, onFailure, 'thnLoader');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.thehotelsnetwork.com/js/loader.js*"
              },
              {
                "type": 1,
                "string": "https://www.thehotelsnetwork.com/js/connect.js*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 12/3/2025, 3:42:19 PM
