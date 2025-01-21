'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "cc32e6a3e6e7609614b38a31759dca9d",
"assets/AssetManifest.bin.json": "defc9aa9b8ef5e49d84846bd3f1a91fc",
"assets/AssetManifest.json": "10ee3b0295c5710574df7dbe7b367c42",
"assets/assets/about_us.png": "bf251970cad9f1269e4491e89b29e0cb",
"assets/assets/AdobeStock_228406900.jpeg": "a5005efe1cad8a6d2b1d84fbea382790",
"assets/assets/AdobeStock_712861746.jpeg": "afc9725ad97b619fedbee9be0b2d1731",
"assets/assets/background_1.png": "e9a8a8258e39c0397ce7c959b3a3ca14",
"assets/assets/door_image.jpg": "620e1b2772fb5175529193722a048e11",
"assets/assets/DRAFT_dustydraft_service-description_24.pdf": "ed8182bce8112b8bc2be56ae9e4b7670",
"assets/assets/evotic.png": "c05345c61a692e0f0f01a78f062cc97c",
"assets/assets/exotic-48x48.png": "151d957476efcf10217aea22aaf759ba",
"assets/assets/exotic-yellow.png": "02e0d34cf4b65f692c8da7e5c6e991da",
"assets/assets/exoticordinary_background.jpg": "8f56fcc4353a059391b960e56c8ffd39",
"assets/assets/fonts/NotoSans-Bold.ttf": "2ea5e0855d5a3ec3f561b5bc62b39805",
"assets/assets/fonts/NotoSans-Regular.ttf": "f46b08cc90d994b34b647ae24c46d504",
"assets/assets/logo_draft_transparentBG.png": "bd53b9d134dc19f8573caf733613fa78",
"assets/assets/logo_dustydraft.png": "e83ee473c1ddd3123379b355a5b11a68",
"assets/assets/logo_exoticordinary.png": "cd99c7a0bbb546d7446fa5266247fe8b",
"assets/assets/logo_symbol_draft.png": "f26cb44a40b7a2ed591691b107a12a18",
"assets/assets/logo_symbol_draft_grey.png": "2f7ca370cab1fb3841a574a029b7885f",
"assets/assets/logo_the_boutique.png": "5bca378b7af0a74d809e3f0022073e9c",
"assets/assets/symbol_about_us.png": "56093db936ed6f33dbbbfcb922f6d169",
"assets/FontManifest.json": "1b59602f1688168fdb34016951ce4005",
"assets/fonts/MaterialIcons-Regular.otf": "027b5a46da4aa969ef67c0b707dd47e0",
"assets/lib/contents/PrivacyPolicy.md": "6af8250bfc2d410af2f3707d73ab3d77",
"assets/lib/contents/TermsOfService.md": "1491481d6952eea5fb256766f9a6eebc",
"assets/lib/l10n/app_en.arb": "865631caee0bbbb7e216f84ecf80c160",
"assets/lib/l10n/app_ko.arb": "43e2baeada291de0f6e63b8ce5954eda",
"assets/lib/l10n/en.json": "fcfaa272cb00d50e1b281bb2e8560029",
"assets/lib/l10n/ko.json": "07275f86168bb1795ba1e64d864444cd",
"assets/lib/l10n/localization.dart": "fcad70349a3ee336efdf397fa14ca39b",
"assets/NOTICES": "10bfc888d8ddd05ca36be59c44b17448",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "f26cb44a40b7a2ed591691b107a12a18",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "962464a815ff944fb07231c7adc11eb1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "185cfffc38c98bbcf1c39d06bf4a1cca",
"/": "185cfffc38c98bbcf1c39d06bf4a1cca",
"main.dart.js": "28af60e5138e8ff5ce76b1a881deb8ca",
"manifest.json": "980a82cbf8b179883f89ea20f4bd4c9b",
"version.json": "1b8fc079fae8500086ea96257c248db3"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
