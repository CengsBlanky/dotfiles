function FindProxyForURL(url, host) {
  var lhost = host.toLowerCase();

  // List of domains that should bypass the proxy (connect directly)
  var directDomains = [
    "bilibili.com",
    "bilivideo.com",
    "bilivideo.cn",
    "hdslb.com",
    "tencent.com",
    "qq.com",
    "tencent-cloud.com",
    "zhihu.com",
    "qianwen.com",
    "aliyundrive.com",
    "alicdn.com",
    "huaweicloud.com",
    "qqmail.com",
    "leetcode-cn.com",
    "leetcode.cn",
    "dyxiaoyu.com",
    "zhuticlub.com",
    "img.930930.xyz",
    "baidu.com",
    "alipan.com",
    "douyin.com",
    "doubao.com",
    "bytedance.com",
    "byteimg.com",
    "volccdn.com",
    "volcengine.com",
    "quark.cn",
    "weibo.com",
    "geekbang.org",
    "zhipin.com",
    "163.com",
  ];

  // List of IP ranges that should bypass the proxy (connect directly)
  // Each entry is [IP_PREFIX, SUBNET_MASK]
  var directIpRanges = [
    ["192.168.0.0", "255.255.0.0"], // for 192.168.0.0/16
  ];

  // Direct connection for localhost and local IP
  if (isPlainHostName(host) || shExpMatch(lhost, "localhost") || shExpMatch(lhost, "127.0.0.1")) {
    return "DIRECT";
  }

  // Direct connection for the 192.168.31.0/24 network
  if (isInNet(host, "192.168.31.0", "255.255.255.0")) {
    return "DIRECT";
  }

  // Check against the list of direct domains
  for (var i = 0; i < directDomains.length; i++) {
    if (dnsDomainIs(lhost, directDomains[i])) {
      return "DIRECT";
    }
  }

  // Check against the list of direct IP ranges
  for (var i = 0; i < directIpRanges.length; i++) {
    if (isInNet(host, directIpRanges[i][0], directIpRanges[i][1])) {
      return "DIRECT";
    }
  }

  // If none of the above conditions met, use the SOCKS proxy
  return "SOCKS5 localhost:7897; SOCKS localhost:7897; DIRECT";
}
