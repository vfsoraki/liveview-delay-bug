# DelayBug

Start application. Open `localhost:4000`.

Open browser console and write `liveSocket.enableLatencySim(2000)` to enable latency.

Now click on tabs repeatedly. Observe that there will be an error like below in the browser console.

```
no component for CID 4 
Object { 1: {…}, 3: {…}, 5: {…}, 6: {…} }
utils.js:7:61


Uncaught TypeError: can't access property "d", rendered is undefined
    toOutputBuffer rendered.js:156
    recursiveToString rendered.js:43
    recursiveCIDToString rendered.js:195
    dynamicToBuffer rendered.js:184
    toOutputBuffer rendered.js:162
    recursiveToString rendered.js:43
    recursiveCIDToString rendered.js:195
    dynamicToBuffer rendered.js:184
    toOutputBuffer rendered.js:162
    dynamicToBuffer rendered.js:186
    toOutputBuffer rendered.js:162
    dynamicToBuffer rendered.js:186
    toOutputBuffer rendered.js:162
    recursiveToString rendered.js:43
    toString rendered.js:37
    renderContainer view.js:494
    time live_socket.js:241
    renderContainer view.js:489
    update view.js:478
    time live_socket.js:241
    update view.js:477
    hookReply view.js:672
    applyDiff view.js:227
    pushWithReply view.js:671
    after live_socket.js:838
    requestDOMUpdate live_socket.js:259
    pushWithReply view.js:670
    matchReceive push.js:76
    matchReceive push.js:76
    startTimeout push.js:107
    trigger channel.js:278
    Channel channel.js:70
    trigger channel.js:278
    onConnMessage socket.js:543
    decode serializer.js:25
    onConnMessage socket.js:530
    onmessage socket.js:234
    connect socket.js:234
    doConnect live_socket.js:209
    connect live_socket.js:215
    <anonymous> app.js:38
    <anonymous> app.js:5088
```

Note that in `Page.render` function I've put 4 versions of rendering inner content

- Rendering live component inside main live view
- Mounting live views inside main live view (you need to change components to live view to test this)
- Rendering functional components
- Rendering content directly inside live view

Only the first two ways can reproduce this error
