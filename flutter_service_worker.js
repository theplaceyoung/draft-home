'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "4cd17c54fa8f2e35e2b8c0926471d677",
"assets/AssetManifest.bin.json": "875b14a48eba19b8f0e9949a6ae8d14d",
"assets/AssetManifest.json": "dccc454a788c2e591214183308861dfb",
"assets/assets/AdobeStock_228406900.jpeg": "a5005efe1cad8a6d2b1d84fbea382790",
"assets/assets/assetpicker/assetpicker-hero.jpg": "ebdec1371328d022e3d93628bbd3d2e9",
"assets/assets/boutique/door_image.jpg": "620e1b2772fb5175529193722a048e11",
"assets/assets/boutique/evotic-48x48.png": "918d69f6bf821d48000835ad9e16ef5d",
"assets/assets/boutique/exotic-yellow.png": "02e0d34cf4b65f692c8da7e5c6e991da",
"assets/assets/boutique/logo_the_boutique.png": "5bca378b7af0a74d809e3f0022073e9c",
"assets/assets/draft/crumpled_paper_1405.jpg": "119b5a3611e3ac6af49ed5864a76cfbd",
"assets/assets/draft/draft_ecosystem.png": "9cdc369b70600d7e97e6839c451fd632",
"assets/assets/draft/goals_and_missions.png": "d1bebe21c491a447efe87f6bffccfab1",
"assets/assets/draft/logo_draft_transparentBG.png": "bd53b9d134dc19f8573caf733613fa78",
"assets/assets/draft/logo_symbol_draft.png": "f26cb44a40b7a2ed591691b107a12a18",
"assets/assets/draft/my_creative_canvas_description.png": "cdabee5315700b4285df5b89e2dcc191",
"assets/assets/dusty/brown-background-water-reflection-texture.jpg": "926a1647e6b9be6a82a347ad0be5ad8f",
"assets/assets/dusty/DRAFT_dustydraft_service-description_24.pdf": "ed8182bce8112b8bc2be56ae9e4b7670",
"assets/assets/dusty/dusty-agent-white+bg+gd.png": "2f5350f92f8accf600b921eb41b13497",
"assets/assets/dusty/dusty-agent-white+bg.png": "411bc2720f5b4bf4890d9994df820ffb",
"assets/assets/dusty/dusty-agent-white.png": "eb23c6b1e9f670d08776d7c60eceadea",
"assets/assets/dusty/dusty_painter.png": "979777bcd1a564b4385ac029c9f526a8",
"assets/assets/dusty/logo_dustydraft+bg.png": "50010eebb4fab2d23e318bc4bdadde26",
"assets/assets/dusty/logo_dustydraft.png": "e83ee473c1ddd3123379b355a5b11a68",
"assets/assets/dusty/logo_symbol_draft_grey.png": "2f7ca370cab1fb3841a574a029b7885f",
"assets/assets/dusty/painter.png": "640a9c6b0c09d038a62b00eba7d060b6",
"assets/assets/exotic/evotic.png": "c05345c61a692e0f0f01a78f062cc97c",
"assets/assets/exotic/exotic-48x48.png": "151d957476efcf10217aea22aaf759ba",
"assets/assets/exotic/exotic-instagram.jpg": "c98802e03327df4970e9a45b300f2b51",
"assets/assets/exotic/exoticordinary_background.jpg": "8f56fcc4353a059391b960e56c8ffd39",
"assets/assets/exotic/exoticVoutique.png": "cd8b82f1fe0652f65e5f3005dadfa1bc",
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
"assets/fonts/MaterialIcons-Regular.otf": "82d193e00911d5f9dbe238a18d4c3466",
"assets/lib/contents/PrivacyPolicy.md": "180a5ed26ea3c2666468ad57278035da",
"assets/lib/contents/TermsOfService.md": "09af769a148c0b3885085067e1cadff0",
"assets/lib/l10n/app_en.arb": "4780d5cd26457424aac0124c88b67749",
"assets/lib/l10n/app_ko.arb": "63e7d84134b9dfc4024f9391ecfd36a7",
"assets/NOTICES": "bbd809714c4ee131a03b6bb24fa5b187",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "f26cb44a40b7a2ed591691b107a12a18",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "063c91cbaf84e91e12560f0fa45d1bde",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "185cfffc38c98bbcf1c39d06bf4a1cca",
"/": "185cfffc38c98bbcf1c39d06bf4a1cca",
"main.dart.js": "2e5a88cb077c71f383d54e39df76068b",
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
