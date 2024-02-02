'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "009c9e65172e010890f7f65fde438006",
"favicon.ico": "c2387dd7ba2377674beb9fc2e9e17463",
"index.html": "4818065078d55d0d39c987937104e594",
"/": "4818065078d55d0d39c987937104e594",
"main.dart.js": "47b8ce898b661fba92ccb757ae2c73d8",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "5d6d65862a5c2077cc16d4b0719d3ee6",
"assets/AssetManifest.json": "86c06dd7735274873e57e3caac033308",
"assets/NOTICES": "c811e228001e2567f7fb5dc2fd3d2e34",
"assets/FontManifest.json": "1836fc57755534a6c66de01e464bfd80",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "e519f25dadf0a65c20b9412c030b29a8",
"assets/fonts/MaterialIcons-Regular.otf": "4535c76ed1dcfc09352cc4211ef3b59e",
"assets/assets/images/app4.png": "69340db1608c29104154440227fc99ab",
"assets/assets/images/git.png": "75af6bdd11c7f567ca0f954545a88e78",
"assets/assets/images/app2.png": "e7ce39964cd18587200d551240f1f5dd",
"assets/assets/images/app3.png": "086bdde48d1c6a7086bb1d6edea9488f",
"assets/assets/images/sterlingDetails.png": "0f9087ea3a796f94a12ddfd48e475e74",
"assets/assets/images/app1.png": "9bb4fcf88b8031e5faa56c4f800d75b2",
"assets/assets/images/flutter.png": "135012ebd7f83dd4ffdc7e6fcd26278d",
"assets/assets/images/animation.png": "d390630b3909b0d19c6c12c318e4602f",
"assets/assets/images/firebase.png": "f89f4d46dba056c495f5dab49150b314",
"assets/assets/images/java.png": "7a7a2d16cd7c8ebe9dadb35d2147938d",
"assets/assets/images/revenuecat.png": "12663c50831565824a37bfeaf6a57445",
"assets/assets/images/intro.jpg": "30ef3b529ef1aa4d0584148ea8eaf735",
"assets/assets/images/javascript.png": "c62d50bbf6fe26625ff8937a4dcde0dc",
"assets/assets/images/restapi.png": "891399f67692d884806eddb47a68f5b5",
"assets/assets/images/mac.png": "8a6f5ac6e3123e421827509b76216f69",
"assets/assets/images/figma.png": "010249dd59f52c80a2f57821d8bef597",
"assets/assets/images/appstore.png": "9ecc9d4cd92fccffe10eb4ce16716753",
"assets/assets/images/state.png": "525b36d6dc9fe410e397c7c511e7cf9d",
"assets/assets/images/jungle.jpg": "e52287c8a0589a8cb6f765d25f0789b5",
"assets/assets/images/beach.jpg": "b4161a3de57ba73ebb4ce7b5c60789d2",
"assets/assets/images/clean.png": "2caef2136d6e588f7e12f6d2463bae05",
"assets/assets/images/portfolio.png": "6a9c0753a1dd9363b44f95b05dcadd7e",
"assets/assets/images/html.png": "2a8f80a6103cfa5b2cd7225e7e4cb742",
"assets/assets/images/linkedIn.png": "b24588b6bb7a13b11b6a9212aae2bca8",
"assets/assets/images/toyaDetails.png": "da354fb47f4520ab6a4b808e52eb86dc",
"assets/assets/images/pdf.png": "4c51096b83bdfbea94ef5510271a7da6",
"assets/assets/images/playstore.png": "4d732c173de9bb45bdd74d06089a95ec",
"assets/assets/images/banana.jpg": "1a7172e186f6475397c8ff82c495a569",
"assets/assets/images/stripe.png": "aed8210be0a9c463b0466ae4b6d37a26",
"assets/assets/images/css.png": "0f0a83640e7537da6948e6bc15970f6c",
"assets/assets/images/skills.png": "1105d8c017efd14a49cd936da8d5c0db",
"assets/assets/images/dart.png": "7d5d382ccd68dc6a658ceacac45fd342",
"assets/assets/images/maps.png": "a7d1d66873b70676b0d1d39731151ca4",
"assets/assets/fonts/OdudoMono-SemiBold.otf": "6880f2405fb135ef3c1edb9ae685bfac",
"assets/assets/fonts/OdudoMono-Light.otf": "d4d924bb929acaf5f8da5bcdb2981407",
"assets/assets/fonts/OdudoMono-Regular.otf": "7a5208b397443f4944d7c0c389b2ab86",
"assets/assets/fonts/OdudoMono-Bold.otf": "3de87809b3acc39d3efb23ed406e2186",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
