# Sleepy hollow
---

## Long polling用

### 起動
```
bundle exec thin start
```

### 利用方法
Server側のレスポンスを10秒間停止させる。

```
http://higan.example.com?wait=10
```

##  Websocket用


### 起動
```
ruby ws_server.rb
```

### 利用方法
Server側のレスポンスを10秒間停止させる。

```
ws.send("10") #=> 送られたメッセージの数値分waitし、その後 "wait: <待ち時間>s" とレスポンスを返します。
```

