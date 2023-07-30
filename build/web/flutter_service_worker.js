'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "f3269dae715d47a086da596130492a76",
"index.html": "fc0f2c3dc190e47318ab9176e172e607",
"/": "fc0f2c3dc190e47318ab9176e172e607",
"main.dart.js": "47c4cfc1f85eb17ecf88330bf52a2d41",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "503aaa5f2512498994849faf7f25320f",
"assets/AssetManifest.json": "7d49eec5650c4802a42cd65c571b78c0",
"assets/NOTICES": "63839ec7852b02480cc3338425f7b38a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "e31277467432a67f780495a18e8ed9c4",
"assets/fonts/MaterialIcons-Regular.otf": "d84e73f8f90996459ef165f955856d16",
"assets/assets/images/immersion_phase_interview_therapist.png": "0985b0a8ceb6e3d4b6f8d054c02c846f",
"assets/assets/images/immersion_phase_therapist_canvas.png": "51e7864a53829ea31b53f13141f8bf23",
"assets/assets/images/immersion_phase_example_register.png": "8e629788268b6078797ef521c4313673",
"assets/assets/images/banner.jpeg": "e5eb9ba78a0e6530f1424139fdd31aca",
"assets/assets/images/banner_home.png": "f5df05f4b6dc71f31e32eea4282be1c4",
"assets/assets/images/immersion_phase_autistic_view.png": "b138ec29fc973958ff91520aa9b70ec3",
"assets/assets/images/analysis_phase_requisits.png": "ce7c7a8670cb4841052691cfe8a5ca79",
"assets/assets/images/analysis_phase_overview.png": "4a98fa50afa82006a1ba81e9a3d72176",
"assets/assets/images/immersion_phase_interview.png": "43aae6ea7683203e82ec7e73d05672bb",
"assets/assets/images/immersion_phase_client_canvas.png": "0849fd40221b683d4c28456c216e7150",
"assets/assets/images/usa_flag.jpg": "3c618d8eddc41515dfb6a863d3b1f2bd",
"assets/assets/images/brazil_flag.jpg": "8dc40ddbe9651ac5a49fbd0b66b02f54",
"assets/assets/images/immersion_phase_interview_caregivers.png": "1d0f767c296740db9bd0ad8673dc87ad",
"assets/assets/images/immersion_phase_learn_context.png": "40bf1afcc1bba4fcd79493bbd2bd8f32",
"assets/assets/images/proaut_flow.png": "4206dda70c15e0cf02d2c52894cc4987",
"assets/assets/images/immersion_phase_consolidate_data.png": "848b50aa2c95d8124923b6b880a0fecf",
"assets/assets/images/banner_top.jpeg": "a97a2f4e928c1bae6cae214a02af254f",
"assets/assets/images/immersion_phase_elicit_requisits.png": "422448d0e3f95e5624c74049c46da5f8",
"assets/assets/images/analysis_phase_personaut.png": "31543746decc10c156209d39861923b0",
"assets/assets/images/immersion_phase_caregivers_canvas.png": "018856b9b4bb433d329c5496ef7ee1ec",
"assets/assets/images/ideation_phase_trr.png": "559706de90d353d693e87a6dd60788e9",
"assets/assets/images/analysis_phase_canvas_empathyaut.png": "35c14ea6280a5d8a12713771cbdcf0e9",
"assets/assets/images/app_icon_white.png": "0b2900dd866035f68036c2992f178433",
"assets/assets/images/ideation_phase_overview.png": "56279f3307fede38a4b3d4470091783f",
"assets/assets/images/immersion_phase.png": "4a5a680e16fbe9e40551b50255530be3",
"assets/assets/images/immersion_phase_steps.png": "740b64df65b16ca5ab150fc24b5f8cbf",
"assets/assets/images/banner_login.png": "4863f47a52584051b3bb9a56b836b3c5",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
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
