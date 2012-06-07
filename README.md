# Sleepy hollow
---

## Long polling用

### 起動
```
ruby lp_server.rb  -p 5228
```

最大同時セッションは300です。

### 利用方法
Server側のレスポンスを10秒間停止させる。

```
http://higan.example.com?wait=10
```

##  Websocket用


### 起動
```
ruby ws_server.rb -p 5228
```

最大同時セッションは上限未計測ですが5000程度までは確認しています。


### 利用方法
Server側のレスポンスを10秒間停止させる場合、Websocket接続後に

送られたメッセージの数値分waitし、その後 "wait: <待ち時間>s" とレスポンスを返します。 


    10
    -- sleep 10 seconds -- 
    > wait: 10s

テストする場合はnode.jsのwscat等のWebSocketクライアントで接続する。

    npm install -g ws
    $ wscat -c ws://localhost:5228/
    connected (press CTRL+C to quit)
    > 5
    -- sleep 5 seconds -- 
    < wait: 5s

