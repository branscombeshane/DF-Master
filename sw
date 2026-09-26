// Daily Fruit Financials — service worker
//
// This exists only so the app qualifies as "installable" (Add to Home
// Screen / desktop install prompt). It deliberately does NOT cache
// anything: every request — including the live financial data from the
// Apps Script backend — always goes straight to the network. That's
// intentional: caching a financial dashboard risks someone opening the
// app and seeing yesterday's numbers without realising they're stale.
// If offline support is ever wanted, it should be added deliberately
// (with a visible "showing cached data" indicator), not as a side effect
// of installability.

self.addEventListener('install', function (event) {
  self.skipWaiting();
});

self.addEventListener('activate', function (event) {
  event.waitUntil(self.clients.claim());
});

// A fetch handler is required for Chrome's install prompt criteria, but it
// intentionally does nothing — no event.respondWith() — so every request
// falls through to normal network handling untouched.
self.addEventListener('fetch', function (event) {});
