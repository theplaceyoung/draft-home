'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "335cf6a1f54997bdc9e67e9bb169ad75",
"assets/AssetManifest.bin.json": "cfe58331dda51a751d11af80f313bafe",
"assets/AssetManifest.json": "76aff05877f6a200ce359f003f4b0bb1",
"assets/assets/AdobeStock_228406900.jpeg": "a5005efe1cad8a6d2b1d84fbea382790",
"assets/assets/boutique/door_image.jpg": "620e1b2772fb5175529193722a048e11",
"assets/assets/boutique/evotic-48x48.png": "918d69f6bf821d48000835ad9e16ef5d",
"assets/assets/boutique/exotic-yellow.png": "02e0d34cf4b65f692c8da7e5c6e991da",
"assets/assets/boutique/logo_the_boutique.png": "5bca378b7af0a74d809e3f0022073e9c",
"assets/assets/draft/crumpled_paper_1405.jpg": "119b5a3611e3ac6af49ed5864a76cfbd",
"assets/assets/draft/logo_draft_transparentBG.png": "bd53b9d134dc19f8573caf733613fa78",
"assets/assets/draft/logo_symbol_draft.png": "f26cb44a40b7a2ed591691b107a12a18",
"assets/assets/dusty/brown-background-water-reflection-texture.jpg": "926a1647e6b9be6a82a347ad0be5ad8f",
"assets/assets/dusty/DRAFT_dustydraft_service-description_24.pdf": "ed8182bce8112b8bc2be56ae9e4b7670",
"assets/assets/dusty/dusty-agent-white.png": "eb23c6b1e9f670d08776d7c60eceadea",
"assets/assets/dusty/logo_dustydraft.png": "e83ee473c1ddd3123379b355a5b11a68",
"assets/assets/dusty/logo_symbol_draft_grey.png": "2f7ca370cab1fb3841a574a029b7885f",
"assets/assets/exotic/evotic.png": "c05345c61a692e0f0f01a78f062cc97c",
"assets/assets/exotic/exotic-48x48.png": "151d957476efcf10217aea22aaf759ba",
"assets/assets/exotic/exoticordinary_background.jpg": "8f56fcc4353a059391b960e56c8ffd39",
"assets/assets/exotic/logo_exoticordinary.png": "cd99c7a0bbb546d7446fa5266247fe8b",
"assets/assets/fonts/boutique/CormorantGaramond-Regular.ttf": "8d38bcc84080a67c9d1630fd3141f7f3",
"assets/assets/fonts/boutique/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/boutique/PretendardVariable.ttf": "76eaa25ade00aa5f6efcb7e926001d7f",
"assets/assets/fonts/draft/Barlow-Regular.ttf": "9373fb661b5c2954ab84d1b7f42774fe",
"assets/assets/fonts/draft/IBMPlexSerif-Regular.ttf": "377f8314d273f8cdac3c910a78c04bc4",
"assets/assets/fonts/draft/PretendardVariable.ttf": "76eaa25ade00aa5f6efcb7e926001d7f",
"assets/assets/fonts/dusty/BarlowSemiCondensed-Regular.ttf": "903ba0f432942add81fc89bcee7ae91c",
"assets/assets/fonts/dusty/PretendardVariable.ttf": "76eaa25ade00aa5f6efcb7e926001d7f",
"assets/assets/fonts/dusty/RalewayDots-Regular.ttf": "3f872296b26074923ecb06155cc68798",
"assets/assets/fonts/exotic/DancingScript-Regular.ttf": "949b41b511eeacbbf6884959b6eedc56",
"assets/assets/fonts/exotic/Lora-Regular.ttf": "29149bc88d3600b6a10d0b23790da014",
"assets/assets/fonts/exotic/PretendardVariable.ttf": "76eaa25ade00aa5f6efcb7e926001d7f",
"assets/assets/fonts/MaterialIcons-Regular.otf": "a5ca9e93f758b893992928a7e7ef72c4",
"assets/assets/fonts/ordinary/Lato-Regular.ttf": "122dd68d69fe9587e062d20d9ff5de2a",
"assets/assets/fonts/ordinary/Montserrat-Regular.ttf": "38712903602f88435ddddec98862f8b8",
"assets/assets/fonts/ordinary/PretendardVariable.ttf": "76eaa25ade00aa5f6efcb7e926001d7f",
"assets/assets/instagram_icon.png": "0b6b3c8d2c74fc2e0be8f5d940ec1e14",
"assets/assets/ordinary/about_us.png": "bf251970cad9f1269e4491e89b29e0cb",
"assets/assets/ordinary/AdobeStock_712861746.jpeg": "afc9725ad97b619fedbee9be0b2d1731",
"assets/assets/ordinary/background_1.png": "e9a8a8258e39c0397ce7c959b3a3ca14",
"assets/assets/ordinary/OL_setup_detail_page.png": "6d9753480e9c7df0481d98e93a4d1c4f",
"assets/assets/ordinary/symbol_about_us.png": "56093db936ed6f33dbbbfcb922f6d169",
"assets/assets/videos/7624037-uhd_2160_3840_30fps.mp4": "fc033fceaef45238a94b62e908a8f873",
"assets/FontManifest.json": "24d1ab1260d77d0a8832cff0804874d8",
"assets/fonts/MaterialIcons-Regular.otf": "4c4400fdb75a428d65a0907aeef9b1dc",
"assets/lib/contents/PrivacyPolicy.md": "180a5ed26ea3c2666468ad57278035da",
"assets/lib/contents/TermsOfService.md": "09af769a148c0b3885085067e1cadff0",
"assets/lib/l10n/app_en.arb": "589c1b0ac785240c55ffbdb53cf05ef2",
"assets/lib/l10n/app_ko.arb": "f38c4974976006e25a8c7a55d7f60cb3",
"assets/NOTICES": "a9a09e0b280589389e9e45f9b7b033d5",
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
"flutter_bootstrap.js": "38e762b8a21bce1552c575269ac715ac",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "185cfffc38c98bbcf1c39d06bf4a1cca",
"/": "185cfffc38c98bbcf1c39d06bf4a1cca",
"main.dart.js": "d179d3f7230245cd8d03190d0fcc9b52",
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
