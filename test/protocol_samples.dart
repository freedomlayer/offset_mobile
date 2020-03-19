final serverToUserAck = [
  r'''
{
  "ack": "AgICAAECAAIBAQIAAgIBAA"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentDone": {
          "paymentId": "AQECAQICAAIAAQABAAEAAg",
          "status": {
            "failure": "AAIBAAEBAQABAQIAAgIBAA"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AQIAAQAAAgEAAQEAAAEBAg"
}
''',
  r'''
{
  "ack": "AQEAAQACAQIBAgIBAQABAg"
}
''',
  r'''
{
  "ack": "AgABAQACAQAAAgIAAQECAQ"
}
''',
  r'''
{
  "ack": "AgEBAAAAAQACAgEBAgECAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "ack": "AQACAgIBAAIAAQEAAQABAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "1",
      "appPermissions": {
        "routes": false,
        "buyer": false,
        "seller": false,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AAECAgICAgEBAQEBAAABAgECAgIBAAIAAQICAgAAAAI",
        "indexServers": [],
        "optConnectedIndexServer": "AQEBAgAAAQIBAgEBAAIAAQIBAQIAAQIBAgIBAgABAAA",
        "relays": [
          {
            "publicKey": "AQACAgEBAQAAAAACAQICAAIAAQAAAAEBAgEBAgICAgE",
            "address": {
              "address": "dcdbddbcdccaaaacbdcbdbdbcbcbacdbbccbacaacdaddadacadcacaaabbcbbbaddbacaaddddbacbbbddbddcccacabdcbbaabcbbbadaabbdbcbdcbbbdcbabdcbdcdccbcacbbddbddcaaaadbabddcdbcdabdcbdddccaadcdabacddcadbccabdaccbbdcadaadddbdddabdab"
            },
            "name": "L&"
          }
        ],
        "friends": {
          "AgABAgICAgIAAAIBAAAAAgECAAAAAAAAAQIBAgEAAAE": {
            "name": "j",
            "currencyConfigs": {
              "dcaaddcaca": {
                "rate": {
                  "mul": 2,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              },
              "ccb": {
                "rate": {
                  "mul": 2,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AgEAAgICAAEBAQICAgAAAQICAgABAQECAAIAAQACAAE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgACAgABAQICAQIAAQECAAECAQACAQEBAAIBAgICAQE",
                  "remotePublicKey": "AgEAAAICAQECAQICAAACAQAAAQABAgACAAEAAgICAAE",
                  "balances": {
                    "accbbccadd": {
                      "balance": "-2",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "2"
                    },
                    "daddbcaccabc": {
                      "balance": "-1",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "0"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AQICAgECAgACAQACAQABAA",
              "newToken": "AgACAgECAAICAAIAAQICAAAAAQAAAgACAgICAAIAAgAAAAECAQEAAQIAAAACAgAAAgECAQEBAAECAgAAAgEAAg"
            },
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "cbbbadbcb": "1",
                  "cdbaddbabcddb": "2"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AAIBAQECAQAAAgAAAQEBAQEBAQIAAgEAAAICAAABAAI": {
            "currency": "abaabdb",
            "totalDestPayment": "1",
            "description": "",
            "isCommitted": true,
            "generation": "1"
          },
          "AQEAAgEAAAECAgACAQABAgABAAABAQEAAAAAAAICAgA": {
            "currency": "cbc",
            "totalDestPayment": "1",
            "description": "(@",
            "isCommitted": false,
            "generation": "0"
          }
        },
        "openPayments": {
          "AgIAAQABAgACAAICAAEAAA": {
            "invoiceId": "AQACAgIAAQEBAQAAAgACAAEBAAICAgICAgEBAQIAAQE",
            "currency": "ccddbdcc",
            "destPublicKey": "AQEBAgEAAQECAgEBAAABAQIAAAABAgIBAAACAAEAAgE",
            "destPayment": "2",
            "description": "⁀",
            "generation": "2",
            "status": {
              "searchingRoute": "AQICAgIAAAAAAAABAQEBAA"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgEAAgABAQIAAQICAgEAAA"
}
''',
  r'''
{
  "ack": "AgECAgEBAQEAAQEAAgEBAg"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "report": {
          "localPublicKey": "AQABAgABAQIAAAIBAAAAAQIBAAEBAAACAQECAgIAAQA",
          "indexServers": [
            {
              "publicKey": "AQICAgICAgICAQAAAAAAAAABAQIBAQEBAQEBAAIAAAA",
              "address": {
                "address": "ccdabbaadddcbbdbdccccccaacacbbdccdcbddddbadcbadabcbabbbacbccdbddccdbddaacaabcbddaadaadddabdddccaddcaccddbdbdcdbdabcdadaabbcacddbddccabccdddbddbcddbbdad"
              },
              "name": ""
            }
          ],
          "optConnectedIndexServer": "AAACAQACAAIBAAEBAQEAAAAAAgABAgIBAgIAAAACAQE",
          "relays": [
            {
              "publicKey": "AgAAAQECAQEAAgIAAgAAAgACAAABAAICAgAAAgIAAQA",
              "address": {
                "address": "bbabaaccdcbccbabbbbbadbdbabdabbcaddccacbcdcadabccddabca"
              },
              "name": "*"
            }
          ],
          "friends": {
            "AgEBAAICAAEBAgICAgAAAgIAAgIAAQIAAAECAAICAgE": {
              "name": "",
              "currencyConfigs": {
                "dabaa": {
                  "rate": {
                    "mul": 1,
                    "add": 1
                  },
                  "remoteMaxDebt": "1",
                  "isOpen": true
                },
                "ababdacaacabdab": {
                  "rate": {
                    "mul": 2,
                    "add": 1
                  },
                  "remoteMaxDebt": "2",
                  "isOpen": false
                }
              },
              "optLastIncomingMoveToken": null,
              "liveness": "offline",
              "channelStatus": {
                "consistent": {
                  "currencyReports": {}
                }
              },
              "status": "enabled"
            }
          },
          "openInvoices": {},
          "openPayments": {
            "AAEBAAABAAEAAAICAAEBAQ": {
              "invoiceId": "AgIAAAIAAAACAAACAQIBAAIBAgAAAQECAAACAQABAgA",
              "currency": "aacdaabcdabbbca",
              "destPublicKey": "AAIAAQEBAAEAAgIAAAECAAEBAQIAAQABAgEAAgACAAA",
              "destPayment": "0",
              "description": "",
              "generation": "0",
              "status": {
                "commit": [
                  {
                    "responseHash": "AgEAAgECAQABAgACAAACAgABAgIBAQACAQICAgIAAgE",
                    "srcPlainLock": "AgABAgIBAgIBAgEAAgEBAgIAAAECAAECAgIAAgECAQA",
                    "destHashedLock": "AAABAAIBAAEBAgECAAAAAQECAgAAAQIBAQAAAAIAAQI",
                    "destPayment": "0",
                    "totalDestPayment": "2",
                    "invoiceId": "AgEAAQABAAACAQEAAgIAAAECAgEAAQIBAgICAgEBAgI",
                    "currency": "babc",
                    "signature": "AQICAQABAgIBAgICAgICAQIBAAIAAQEBAQECAAACAAEAAQEBAQIAAgEBAAAAAgEAAQABAgECAAAAAAABAQEAAQ"
                  },
                  "0"
                ]
              }
            },
            "AQIAAgAAAgEAAQICAAABAA": {
              "invoiceId": "AAECAQIAAQIBAgECAAABAAABAAACAAECAAAAAAECAQE",
              "currency": "baaaaacb",
              "destPublicKey": "AQICAAIAAQEBAQIAAgAAAQIBAAECAgIAAgABAQIAAAA",
              "destPayment": "0",
              "description": "\u0000\u0013",
              "generation": "0",
              "status": {
                "commit": [
                  {
                    "responseHash": "AAACAQACAgACAQECAQECAAECAgEBAAECAAABAgABAQE",
                    "srcPlainLock": "AgECAAEBAQAAAQIAAgACAgABAAEAAAABAgAAAAACAQE",
                    "destHashedLock": "AQACAgACAgABAgEAAgIAAAIAAAEAAAACAgAAAAIAAgI",
                    "destPayment": "0",
                    "totalDestPayment": "1",
                    "invoiceId": "AAIBAAACAAACAQABAgECAQIBAAABAAABAAABAgABAAE",
                    "currency": "aacccddacbababd",
                    "signature": "AQIAAgAAAgAAAAAAAAECAgIBAQABAgAAAgAAAgACAQICAQACAgIBAgACAQEBAQECAgACAAIAAQEBAgACAAABAA"
                  },
                  "1"
                ]
              }
            }
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AAEAAQIBAQEBAgIAAAIBAg"
}
''',
  r'''
{
  "ack": "AQICAgAAAAICAQABAQEBAg"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "0",
      {
        "report": {
          "localPublicKey": "AQABAAIAAAECAAACAgECAQECAQACAQEAAAEAAgIAAgA",
          "indexServers": [],
          "optConnectedIndexServer": "AAEAAQIAAAEAAQACAAIAAgIBAgIBAgEBAQIBAgACAAI",
          "relays": [
            {
              "publicKey": "AAECAQACAQEBAAAAAQABAQIBAgEBAAIBAAIAAAACAQE",
              "address": {
                "address": "abbdbddadbadacdbacbbabacdbbcaaaacabddcdcdabaaddbbdcdccbdadddcbddcddababbbababbcacadcdcacbcbbaadbcdcabcdcbacdaacbacdb"
              },
              "name": "."
            }
          ],
          "friends": {
            "AAACAQIBAgICAAAAAAEBAQACAAICAgECAgACAAECAAE": {
              "name": "m",
              "currencyConfigs": {
                "daadcd": {
                  "rate": {
                    "mul": 1,
                    "add": 1
                  },
                  "remoteMaxDebt": "1",
                  "isOpen": false
                }
              },
              "optLastIncomingMoveToken": null,
              "liveness": "offline",
              "channelStatus": {
                "consistent": {
                  "currencyReports": {
                    "c": {
                      "balance": "1",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "1"
                    }
                  }
                }
              },
              "status": "enabled"
            }
          },
          "openInvoices": {},
          "openPayments": {
            "AQECAAICAAEAAgACAQAAAA": {
              "invoiceId": "AQEAAgIBAQACAQICAQIAAQEAAgIBAAEAAAABAQAAAgE",
              "currency": "accbcdaadcdcacc",
              "destPublicKey": "AQEBAAACAgIBAQABAQICAQACAQACAQICAAEAAQEAAgI",
              "destPayment": "0",
              "description": "󦔣",
              "generation": "0",
              "status": {
                "sending": "2"
              }
            }
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AQEBAgEAAQECAQEBAAABAQ"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentFees": {
          "paymentId": "AgEAAAEBAgEAAgABAQEBAQ",
          "response": {
            "fees": [
              "2",
              "AAACAQACAQEBAAAAAQICAA"
            ]
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AgIBAAECAAICAgIAAAAAAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "paymentFees": {
          "paymentId": "AgIBAgIBAAEBAAICAAABAA",
          "response": {
            "fees": [
              "2",
              "AgIAAgIAAgIBAgEAAAECAA"
            ]
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AAICAQAAAAIBAQIAAgECAQ"
}
''',
  r'''
{
  "ack": "AgIAAQACAQABAQABAgAAAg"
}
''',
  r'''
{
  "ack": "AQEBAAABAQIBAgIBAAACAA"
}
''',
  r'''
{
  "ack": "AgAAAgACAAEAAAAAAgIAAg"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "paymentFees": {
          "paymentId": "AQEBAgABAgEBAQACAAABAg",
          "response": {
            "fees": [
              "1",
              "AAEBAQAAAQABAAABAAIAAA"
            ]
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": true,
        "seller": false,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AQEAAQABAAEBAAECAAABAgACAQAAAAECAAIBAAEBAQE",
        "indexServers": [
          {
            "publicKey": "AQACAAAAAAABAAIAAQIAAAABAAEAAgABAgACAgIBAAA",
            "address": {
              "address": "cacccdabbcbcccbcaccabbdaadcbcdbabccdbcddacaabdcbccababbaccccdddddddbcaddccbaaccadbbabbccddbaacabdbaadddbbdcbccacdcdccbbaabcadddbcaadddcdcbadcdcdabcbaadaccaaaacaabbbbdbcccdaccaddccddaacadbcdbcdddbcccdcdcbbbcaaaccddadddcddbdddabdbcbccabbcdadbdcab"
            },
            "name": "ª\""
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {},
        "openInvoices": {
          "AgEBAgEAAQIBAAACAgIAAQIAAAIBAAIBAQIAAQIAAQI": {
            "currency": "ccbdcddacc",
            "totalDestPayment": "2",
            "description": "",
            "isCommitted": true,
            "generation": "2"
          },
          "AAABAQEBAQABAQAAAAIBAQAAAgAAAQEBAgEAAAACAAI": {
            "currency": "aabcbcdaabdc",
            "totalDestPayment": "1",
            "description": "1",
            "isCommitted": false,
            "generation": "0"
          }
        },
        "openPayments": {}
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "$",
      "nodeId": "0",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": false,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AgECAQICAQICAgEAAgAAAAACAQECAQIBAQACAQICAAA",
        "indexServers": [],
        "optConnectedIndexServer": "AQEBAAECAAEAAQEBAQIAAgAAAQABAgIBAgEBAQEBAQE",
        "relays": [
          {
            "publicKey": "AQEBAgAAAQIAAAEBAQAAAQEAAAICAgEBAgABAQIAAQA",
            "address": {
              "address": "ccbaaccdaababacdcbdacdacc"
            },
            "name": "\u001e"
          },
          {
            "publicKey": "AQABAgAAAgICAQICAQECAQAAAAEBAgIAAAEAAgEBAQA",
            "address": {
              "address": "dababaddcbcaacbacdbcdadbbaccccdccbdbdaabdcddcabacbaacacbaccdbdccaadacaacbbbdabdcabcaaabccbadbcbadccaccabbbcbdbddcaddcabadddbdbbdaadbcaadaaabbddacbcbadaaddccdaaddacbccbddbccbabcbadbcbbabddcbbdccaccbbadaccddadabadcdabbcdabdbdcbadbadccabadadcabdbcdbddda"
            },
            "name": ""
          }
        ],
        "friends": {
          "AgABAQICAgABAAIBAAACAAAAAAEBAgACAgABAgABAAE": {
            "name": "‟u",
            "currencyConfigs": {
              "d": {
                "rate": {
                  "mul": 0,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AAAAAgEAAgIBAAECAAIAAgABAgECAgAAAAECAgACAQE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAIBAgEAAQIAAQAAAAIAAAAAAgAAAQIBAAEBAAAAAgI",
                  "remotePublicKey": "AgABAAIAAQECAAAAAQECAAIAAgIBAAEBAgACAAECAAA",
                  "balances": {}
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AQEBAgEBAAICAgEAAAICAQ",
              "newToken": "AQACAgEAAgICAgACAQACAgIBAQABAAIAAQACAAIAAgIAAQAAAAICAQIAAgACAQECAgAAAQIBAgIBAQEAAgECAA"
            },
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "cbaa": "2",
                  "aabbca": "-2"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AgABAAEAAQABAQACAQEAAQABAAACAAEAAQIBAQACAgECAgACAgECAQEBAgAAAQECAQIBAgEAAgIBAQIBAgAAAg",
                  "balanceForReset": {}
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AQEAAgICAgECAAEAAgAAAQAAAgABAAICAQECAgECAAI": {
            "currency": "aaacadaccaa",
            "totalDestPayment": "1",
            "description": "",
            "isCommitted": true,
            "generation": "1"
          }
        },
        "openPayments": {
          "AAACAgABAgECAgICAQIBAA": {
            "invoiceId": "AQEBAQIAAgABAQABAgIBAAIAAgEAAAEBAQABAgACAAA",
            "currency": "cbbbdbabcaad",
            "destPublicKey": "AgAAAQIAAAIBAAECAAAAAAICAQICAgECAgEAAgACAgI",
            "destPayment": "1",
            "description": "%\\",
            "generation": "2",
            "status": {
              "success": [
                {
                  "responseHash": "AgECAgEAAQABAQIAAAAAAAAAAgIBAAAAAAABAgACAgA",
                  "invoiceId": "AQIBAgICAQEBAAAAAQAAAAACAgAAAAABAgIBAQEBAQI",
                  "currency": {
                    "currency": "bbdddcaaccabbc"
                  },
                  "srcPlainLock": "AQEBAAECAgIAAgIBAAACAgIBAgABAAEAAgEAAQACAgE",
                  "destPlainLock": "AQECAgEBAAECAAAAAgABAgAAAQEAAgEBAQABAgIBAAI",
                  "isComplete": true,
                  "destPayment": "1",
                  "totalDestPayment": "2",
                  "signature": "AAIBAAEAAAAAAAECAQIAAgACAQIBAAABAQAAAAEAAAIAAQICAAECAQABAQIAAQICAgECAgEBAAICAQACAgECAA"
                },
                "1",
                "AAEAAQICAgABAQICAAECAQ"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "\u0004?": {
        "mode": "closed",
        "isEnabled": false,
        "info": {
          "remote": {
            "appPublicKey": "AQICAgICAQEAAgEBAgIBAAIAAgIAAQECAgEAAQABAAI",
            "nodePublicKey": "AQIAAAIAAQECAgEAAQABAQABAQEAAQAAAAICAgEBAAI",
            "nodeAddress": {
              "address": "dcbddadadcaaaddaaabadccbbbdbbaadcdcdbaacacadcbdcbbbcadabccddd"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "": {
        "mode": {
          "open": "0"
        },
        "isEnabled": false,
        "info": {
          "remote": {
            "appPublicKey": "AQECAQAAAAEAAgEAAQAAAAEBAAICAAACAAICAAABAQA",
            "nodePublicKey": "AQIAAAEAAgIAAgEBAQEAAQABAAECAgACAAEBAgEBAAA",
            "nodeAddress": {
              "address": "acddabbcdbccbdbcccccdcddbbcbdcdcdbabcbbacaacdcbabdcbdcadbdbcdbbbcaaabcadbcbdbdcbcaabbaabcaacdccabbbadcbbcdaccdabbbda"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgACAQIBAgACAQEBAQEBAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "": {
        "mode": {
          "open": "0"
        },
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgAAAAIAAQABAQABAAEAAAEBAQACAQIAAgECAQEBAQI",
            "nodePublicKey": "AgEAAAABAAEAAQEAAgACAAIAAQIBAQABAgICAAACAQA",
            "nodeAddress": {
              "address": "dcbbacacddccdabacdbaddccbabdacdabdaaaacdcabbdccbcaddabbdacccbdccdbbcdacdbccaacdbadcccdcdabcdcbbbcddbdcbcacbaadbacaacadbaabbcbbbbdabcaccbcdbbcacddbccccaabbcaaabdbadccbdbbbababbcdbbcdcbbdabbadcbb"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentCommit": {
          "paymentId": "AQECAAAAAQIAAQEAAAACAg",
          "commit": {
            "responseHash": "AAICAQEBAgACAgEAAgACAQACAQICAgAAAgEAAAABAgI",
            "srcPlainLock": "AQIAAgABAQICAAIBAAECAQEBAQICAgIAAgICAgIBAQI",
            "destHashedLock": "AQIBAAAAAQECAQIAAgACAgIBAAACAgIBAAIAAQIBAAA",
            "destPayment": "0",
            "totalDestPayment": "2",
            "invoiceId": "AQIAAgEBAQABAQIBAgEAAAECAQEAAQAAAQIBAAABAAA",
            "currency": "bdadccaabcaacd",
            "signature": "AQACAQIAAgAAAQIBAAEAAgECAgIAAgACAAAAAQAAAQEAAAACAgACAAICAQECAgECAgEAAQACAQECAgECAgACAg"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AQEBAQICAgEBAAABAgICAg"
}
''',
  r'''
{
  "ack": "AgIAAgEBAgABAgABAAEBAg"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "£‸",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": true,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AQACAgECAAIBAQEBAQICAQAAAAEAAQACAAEBAgEAAgE",
        "indexServers": [
          {
            "publicKey": "AAAAAQIBAAACAgAAAgEAAAIAAQECAAABAgACAAEBAQA",
            "address": {
              "address": "dcadaacacabaccadcdaadabbcbdbcbdadbdccaaadbbadaadbcb"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": "AAIAAAAAAQIAAQEAAQIAAgAAAAIAAgIBAQACAgEBAAA",
        "relays": [
          {
            "publicKey": "AgECAQECAgACAgABAQAAAgABAgABAgEAAgEBAgIAAAA",
            "address": {
              "address": "caaddddcacaaacdbdabaabaacdaaabacacbdbbacabcdcbbbbdadcbaacadbbaddaadccabccabdcbcbddcaacdbdacadbdbadabacbdbbddaacacaabacccbcdcdddbacdbacadbbcadacabadbcddaccabdaaaabddb"
            },
            "name": ""
          },
          {
            "publicKey": "AAABAQEAAQIBAAABAgEAAAEAAgACAgEAAQIBAQEBAgE",
            "address": {
              "address": "accdacaacdccabcbabadcabadcbbdadadcdaabbacddbbbdbacbadccdcbdbbbcdadbdababdcbcdabcdbdbddabacddbddddabaaabddccbaabccdbdcaccbbacacacbbaddadadcccaacaabbbcaddddccbcdbbbbadbaddcdcdbbcaddaabdccbdcaddbacabbbddbabaaddcccdbabaabaacdcddadaaadbdcbaaacacaaaacababdadac"
            },
            "name": "2"
          }
        ],
        "friends": {
          "AQICAgACAQEBAQICAgECAAECAQEBAQECAAIAAgICAAA": {
            "name": "",
            "currencyConfigs": {
              "bbbccabdbb": {
                "rate": {
                  "mul": 1,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AAEBAgACAgEAAgAAAgEAAQACAAAAAgICAgIBAQICAAA",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AQEBAgEAAgEAAgICAQAAAgICAAIBAAEAAQEAAQIBAgI",
                  "remotePublicKey": "AAICAAEBAQAAAAIAAgAAAgEAAAICAQEAAQIAAgACAQA",
                  "balances": {
                    "a": {
                      "balance": "-1",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "1"
                    },
                    "cbbbdbacdacbaac": {
                      "balance": "-2",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "2"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AAIBAQAAAAIBAQEBAgIAAg",
              "newToken": "AAIAAgIBAAICAgEAAQACAQICAgEAAgICAAIBAAAAAAEBAAAAAAIBAgABAAACAQIBAAAAAAIAAgECAAEBAgEBAg"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "adbaddab": {
                    "balance": "0",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "0"
                  }
                }
              }
            },
            "status": "enabled"
          },
          "AAECAQAAAgEAAQABAAIAAgECAQEAAQICAgICAgACAAI": {
            "name": "",
            "currencyConfigs": {
              "dcabcb": {
                "rate": {
                  "mul": 0,
                  "add": 1
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              },
              "cacbcabccc": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AgIAAgABAQEAAAEAAAECAgACAgAAAgEBAAABAQEBAgA",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAABAQECAQICAgABAAABAQACAgIAAgABAAIBAgIAAQE",
                  "remotePublicKey": "AgEBAgABAQEAAAABAQECAQACAgICAgEAAQECAgIBAQI",
                  "balances": {}
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AgAAAQAAAQEAAQEBAgEAAA",
              "newToken": "AgECAQIBAgIAAgIBAgACAgICAQIBAgEAAgAAAAECAQAAAQIBAAACAQEAAAIAAgIAAgABAQIAAgEBAQABAgICAg"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "acbadcdcdaadbd": {
                    "balance": "-2",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "1"
                  },
                  "caccdcdd": {
                    "balance": "-2",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "1"
                  }
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AQACAAAAAAIAAQIBAQICAAAAAAECAAIAAgEBAQACAQI": {
            "currency": "cbbadcdcdada",
            "totalDestPayment": "2",
            "description": "",
            "isCommitted": true,
            "generation": "0"
          }
        },
        "openPayments": {
          "AAEAAAEAAQABAQECAgABAQ": {
            "invoiceId": "AQEBAgACAgICAAAAAgEAAQEBAAEAAAIBAgIAAAECAAE",
            "currency": "dcaacc",
            "destPublicKey": "AgECAQEBAQACAAICAAEAAgACAQICAAIAAQIBAQIBAAE",
            "destPayment": "0",
            "description": "\b",
            "generation": "2",
            "status": {
              "sending": "0"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AAAAAQACAAIAAQABAgAAAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "report": {
          "localPublicKey": "AAAAAgECAQABAAIAAgAAAQACAQECAgABAgICAgECAQA",
          "indexServers": [
            {
              "publicKey": "AQABAQEBAgICAQACAQABAAEAAQIAAgEBAQAAAgAAAgI",
              "address": {
                "address": "acbabdbddaacccacbbdbaaacdbcccddcdbdccabcaadadbcdabbacddcbaddccdbbdcadbbbbaabdadcdddbaacdbcabcadbdabcacdbdaddabbbbdbcdcbaabdacbcabcacbacacccaacbdddddccbbdbbbabdddcccababdccdbbbadacbdcbdaaaacabbcdaabdccccdaaccbaacdabbddaccbbaacaadbcccbadbdbbbcaaabacddcdbdc"
              },
              "name": ""
            },
            {
              "publicKey": "AgACAAACAgEAAQABAgEBAgACAQEAAAABAgIAAgABAgE",
              "address": {
                "address": "bdcabdcdbdacbdaaadcbaabdaacdacbbcdbbddddcdccbcbddddaccbdbcaabdccdabcacabcadcbdadbb"
              },
              "name": ""
            }
          ],
          "optConnectedIndexServer": "AAECAgICAQABAAABAQECAgACAQABAAACAgAAAgIBAQE",
          "relays": [
            {
              "publicKey": "AgAAAQEBAQACAAEAAgIAAAECAQEBAQACAAABAAABAQA",
              "address": {
                "address": "abbcbbbbddcdcaabdabcbaddbacccaaccacdddbbcbcbdbcaacaaddcaacbbabbabbadbbdacaabbadaadacbbbacbccbbadbabacaaaabbdbcdbaadbcaaabacdbcacdddbcbdbdbbddaaaabbddbcccbbbaccdbdacabccabdbbbdabddbccbbdd"
              },
              "name": "0"
            }
          ],
          "friends": {
            "AgAAAgEAAAEBAgACAgACAQABAAIAAAIAAgEAAQAAAAA": {
              "name": "􏿿–",
              "currencyConfigs": {
                "ca": {
                  "rate": {
                    "mul": 1,
                    "add": 1
                  },
                  "remoteMaxDebt": "2",
                  "isOpen": true
                }
              },
              "optLastIncomingMoveToken": {
                "prefixHash": "AgEAAAABAAECAQABAAACAAABAgAAAgIBAQACAgICAgA",
                "tokenInfo": {
                  "mc": {
                    "localPublicKey": "AAIBAgEAAQEBAQICAQEAAQABAAECAAICAQIAAgIAAgI",
                    "remotePublicKey": "AQECAAIAAgABAAACAQEAAgEBAQABAQEAAgEBAQABAQI",
                    "balances": {
                      "bdccacaccbca": {
                        "balance": "-1",
                        "localPendingDebt": "0",
                        "remotePendingDebt": "1"
                      }
                    }
                  },
                  "counters": {
                    "inconsistencyCounter": "0",
                    "moveTokenCounter": "2"
                  }
                },
                "randNonce": "AQAAAQIAAAIBAgICAgEBAA",
                "newToken": "AQAAAgAAAAAAAAECAAACAAIAAQIAAgEAAQICAgACAAACAQEAAQEBAgEBAgACAQACAAIBAAACAgABAQAAAAIAAA"
              },
              "liveness": "online",
              "channelStatus": {
                "inconsistent": {
                  "localResetTerms": {},
                  "optRemoteResetTerms": {
                    "resetToken": "AQIAAgABAQIBAQICAAEAAQICAgIAAAIBAgABAgICAAEBAgIAAQICAQICAgEAAgECAAAAAQICAQABAQACAQAAAA",
                    "balanceForReset": {}
                  }
                }
              },
              "status": "enabled"
            },
            "AQEAAAECAQAAAAICAgAAAQIAAQABAgEAAQECAAACAgE": {
              "name": "­",
              "currencyConfigs": {
                "aaabbbdccabcdbd": {
                  "rate": {
                    "mul": 2,
                    "add": 1
                  },
                  "remoteMaxDebt": "2",
                  "isOpen": true
                }
              },
              "optLastIncomingMoveToken": null,
              "liveness": "online",
              "channelStatus": {
                "inconsistent": {
                  "localResetTerms": {
                    "ddcccccdbacbbc": "1"
                  },
                  "optRemoteResetTerms": {
                    "resetToken": "AgECAQICAgABAAIBAAEAAQABAgABAgECAQIBAAECAgEBAQICAAEBAAACAgACAgEBAgEBAgEAAAEBAAICAAAAAg",
                    "balanceForReset": {}
                  }
                }
              },
              "status": "enabled"
            }
          },
          "openInvoices": {},
          "openPayments": {
            "AgIAAAIAAAECAAEAAgICAg": {
              "invoiceId": "AAIBAgIAAAABAQEAAAEBAgEAAAAAAQAAAAABAAIBAAA",
              "currency": "dadb",
              "destPublicKey": "AAAAAAIAAQICAAICAQACAgAAAQAAAAEAAAEBAgEAAAE",
              "destPayment": "2",
              "description": "",
              "generation": "0",
              "status": {
                "searchingRoute": "AAAAAgABAAABAAABAQEAAQ"
              }
            }
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AAICAQAAAgABAQEAAQEAAA"
}
''',
  r'''
{
  "ack": "AAECAQACAgIAAQICAAABAQ"
}
''',
  r'''
{
  "ack": "AAEAAgEAAgIBAQICAgIAAA"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "paymentDone": {
          "paymentId": "AQECAQEAAAAAAQAAAQIBAg",
          "status": {
            "failure": "AQAAAgEBAgAAAQECAAEAAQ"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AAABAAECAgEBAAACAgAAAg"
}
''',
  r'''
{
  "ack": "AQABAQABAAIBAgEBAQACAg"
}
''',
  r'''
{
  "ack": "AgIAAAEAAQEBAQICAQIAAA"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "responseVerifyCommit": {
          "requestId": "AAEBAAEAAgECAAACAAABAg",
          "status": "success"
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentDone": {
          "paymentId": "AgICAgIBAAIAAAACAAICAQ",
          "status": {
            "failure": "AgICAAECAQECAQECAgEBAg"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AQAAAgACAgEBAgEAAAEAAA"
}
''',
  r'''
{
  "ack": "AAEAAAACAAICAQEAAgEAAQ"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentFees": {
          "paymentId": "AAEAAgEBAQIAAQECAgABAA",
          "response": "unreachable"
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AQIAAQECAQEAAAIAAgICAA"
}
''',
  r'''
{
  "ack": "AAAAAQABAQECAAICAAIAAg"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "張",
      "nodeId": "0",
      "appPermissions": {
        "routes": false,
        "buyer": false,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AgABAAACAgICAQABAQIBAgACAQIAAQABAgICAQACAQE",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAIAAgIAAAEAAQIBAAACAAACAAEAAgAAAgECAAABAQA",
            "address": {
              "address": "dacbbdbbdcdcadabdbdbbdcbadbababadbadaadcb"
            },
            "name": "#"
          }
        ],
        "friends": {
          "AAICAgABAAECAgIBAgIAAgEBAAEBAgICAAECAgACAAA": {
            "name": "",
            "currencyConfigs": {
              "bcdbaa": {
                "rate": {
                  "mul": 0,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              },
              "dbddcbdcabdda": {
                "rate": {
                  "mul": 2,
                  "add": 0
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AAACAAICAgIBAAECAQECAQIAAAECAAICAgECAQEAAQE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAIAAAEBAgICAAEAAAICAQEBAQABAQECAQIBAgEBAQI",
                  "remotePublicKey": "AQEAAgACAgACAQECAgECAAICAQAAAgEBAAIBAAIAAgE",
                  "balances": {
                    "ddacdc": {
                      "balance": "-1",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "2"
                    },
                    "abacdbadbcad": {
                      "balance": "-3",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "2"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "2",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AAECAgICAgACAgEAAQAAAA",
              "newToken": "AgACAgECAQABAQAAAgACAgABAAIAAQIAAAICAgIBAAAAAQICAQABAgEBAgICAQICAQEBAAIAAQICAAIBAQECAA"
            },
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "adbabddddbdcbac": {
                    "balance": "-3",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "1"
                  }
                }
              }
            },
            "status": "enabled"
          },
          "AQECAAIBAAEAAAIAAQICAgEBAgICAAAAAQEBAQECAgA": {
            "name": "<\u0011",
            "currencyConfigs": {
              "bdac": {
                "rate": {
                  "mul": 0,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "cbd": {
                    "balance": "-1",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "0"
                  },
                  "cdbdbddababcdab": {
                    "balance": "0",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "2"
                  }
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AgIAAQABAgIAAQECAAABAQEBAgIBAQECAgAAAAIAAQI": {
            "currency": "dbabadcdddaacdc",
            "totalDestPayment": "0",
            "description": "\u0005",
            "isCommitted": true,
            "generation": "2"
          },
          "AAIBAQABAgECAAECAAEAAQAAAgEAAQACAgAAAgABAQA": {
            "currency": "dddbdbbbabbcccc",
            "totalDestPayment": "1",
            "description": "\u0002 ",
            "isCommitted": false,
            "generation": "1"
          }
        },
        "openPayments": {}
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQECAgABAgIBAAAAAQIAAA"
}
''',
  r'''
{
  "ack": "AQABAQAAAAABAQEBAgAAAg"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "paymentFees": {
          "paymentId": "AgIAAQIBAQIBAQIBAQICAQ",
          "response": {
            "fees": [
              "0",
              "AAIAAQIAAAAAAAACAAIBAg"
            ]
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "ミ:",
      "nodeId": "2",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": false,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AAACAQACAAIBAAAAAgECAAABAgEAAgECAgIBAAACAQE",
        "indexServers": [],
        "optConnectedIndexServer": "AgIAAgECAgABAQICAQEBAQIBAgECAgIAAQEBAAIBAgI",
        "relays": [],
        "friends": {
          "AgACAgABAQAAAAAAAQAAAAICAgIAAgAAAgIAAAIBAgA": {
            "name": "3",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": {
              "prefixHash": "AgEBAgECAQIBAgACAAIAAQEAAgIBAAIBAgACAAEAAAA",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAECAQECAAIAAAEBAQIBAgEAAQIAAgICAgACAQEAAQE",
                  "remotePublicKey": "AgIAAQECAgIAAQACAQABAgIBAAICAgACAgIBAAECAgI",
                  "balances": {}
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AgACAAAAAgECAAEAAQACAQ",
              "newToken": "AgECAQECAgACAgEAAAAAAAIBAQIBAgEAAAEBAQACAAICAAAAAgEBAQIBAgEAAQAAAgIBAAEAAQEAAAIAAQAAAQ"
            },
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "acadcabcadcbad": {
                    "balance": "0",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "0"
                  },
                  "ddbddbbbbcb": {
                    "balance": "-2",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "2"
                  }
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {},
        "openPayments": {}
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgICAQEAAQEBAgECAAICAA"
}
''',
  r'''
{
  "ack": "AAEBAAIBAAICAQEAAAABAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "1",
      "appPermissions": {
        "routes": true,
        "buyer": false,
        "seller": false,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AAACAQEBAAACAAECAgICAgECAQECAAIAAQICAQABAAA",
        "indexServers": [
          {
            "publicKey": "AgABAAAAAQEBAAEAAQEAAgICAQIAAAACAgAAAAEAAQI",
            "address": {
              "address": "cdabbcabadadadccaaabbddabccccdddacdbadcdcadaaddddddddcdccaccdbbadbbbbaad"
            },
            "name": ""
          },
          {
            "publicKey": "AQABAQECAQIBAgEBAAECAAABAQABAgABAAEBAAICAgI",
            "address": {
              "address": "cdbcdbcbdbddccabbdccdbcbabdbccaabbddcaaccdbcbdabdcdcdccacddbaddbbaacdbabbcbdaaaaddcaddbadbbbbcabcdbdadacaabccbbccddbbddadddacabdacdccbccdbdadbbdcdcddddbdcdcbcadabadcddbabcbcddcddddcacbcdcadbabbcbbdc"
            },
            "name": "A["
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {
          "AAICAAIAAgEAAQACAQICAQABAQACAQEBAAAAAQICAAE": {
            "name": "",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "abbaaabcadc": "2",
                  "bbcddbaccbad": "1"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AAIBAQABAQIBAAIAAAIBAQECAAABAQIBAQIAAQEBAQEBAgIBAAIAAQABAgACAQEBAAEAAgABAAAAAgABAQICAQ",
                  "balanceForReset": {
                    "c": "2",
                    "acbbdbabaa": "-2"
                  }
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AQICAgEBAgECAgIAAgAAAAABAAACAgACAAIAAQACAQA": {
            "currency": "ddbabbbabbdcddd",
            "totalDestPayment": "1",
            "description": "",
            "isCommitted": true,
            "generation": "2"
          },
          "AAIAAQEBAgECAAACAQEAAgACAgICAgECAgABAgACAQI": {
            "currency": "dd",
            "totalDestPayment": "0",
            "description": "",
            "isCommitted": true,
            "generation": "2"
          }
        },
        "openPayments": {}
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "": {
        "mode": "closed",
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgICAAEAAgIBAgAAAQACAAABAgEBAQIAAAICAgIBAAE",
            "nodePublicKey": "AAEAAgIAAQECAgIAAgABAQAAAgEBAgACAQICAgACAQI",
            "nodeAddress": {
              "address": "bbdbacdacbcabcaabccdaadcaddddbddaddadbadcbdbcac"
            }
          }
        }
      },
      "^": {
        "mode": {
          "open": "0"
        },
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgECAAEAAgICAAEBAgABAQIAAAABAAAAAAICAAEBAAI",
            "nodePublicKey": "AAACAgEAAAACAQEBAAIBAAECAAABAQACAAABAgABAgI",
            "nodeAddress": {
              "address": "aacaadabcababcdccbddbbaddb"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AAEAAAACAAECAQIAAgAAAA"
}
''',
  r'''
{
  "ack": "AAACAAABAQICAgEAAgABAQ"
}
''',
  r'''
{
  "ack": "AQIBAgIBAAIBAAIAAgAAAg"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "*\u001e": {
        "mode": {
          "open": "0"
        },
        "isEnabled": true,
        "info": {
          "local": {
            "nodePublicKey": "AQECAgECAQECAgICAgIAAgEAAQABAAAAAgEAAQACAgE"
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQABAQIBAQICAAEAAgACAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "ack": "AAEBAgACAgEBAgIAAAICAg"
}
''',
  r'''
{
  "ack": "AQECAAACAgABAQEAAQAAAA"
}
''',
  r'''
{
  "ack": "AgICAgICAAABAgICAgACAQ"
}
''',
  r'''
{
  "ack": "AQEAAgACAQACAQIBAgECAQ"
}
''',
  r'''
{
  "ack": "AgECAQAAAAEBAQECAgECAg"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "0",
      {
        "paymentDone": {
          "paymentId": "AQABAQEAAgEAAQECAAAAAA",
          "status": {
            "success": [
              {
                "responseHash": "AAACAAACAgECAAABAQEAAQECAgEAAgECAAICAAEAAQE",
                "invoiceId": "AAIAAAICAAIBAQACAQEBAQIBAgEBAQACAgEBAgEBAgE",
                "currency": {
                  "currency": "dcdcdbaababc"
                },
                "srcPlainLock": "AgIAAAEBAgICAgECAQEAAQEAAQICAQIBAQEAAQABAgE",
                "destPlainLock": "AgABAAABAgAAAgECAgICAAECAQICAQIBAQAAAgECAAA",
                "isComplete": true,
                "destPayment": "0",
                "totalDestPayment": "2",
                "signature": "AAIBAgEBAAIAAQICAgIAAgAAAQECAgECAAIAAgECAQEBAgEAAQEBAgABAAICAgIAAAABAAACAAAAAQEAAAIAAA"
              },
              "2",
              "AgEAAQICAgABAAICAgACAA"
            ]
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentCommit": {
          "paymentId": "AgACAQAAAgIBAgIAAQIAAA",
          "commit": {
            "responseHash": "AAABAAIAAQIAAQEAAQIBAAACAQICAAEBAgIAAAIBAgE",
            "srcPlainLock": "AgAAAgEAAAAAAAEAAQEAAQABAQICAAECAAICAAIBAQE",
            "destHashedLock": "AAIBAQECAAACAQIAAQEBAgECAgACAgECAQECAgAAAgA",
            "destPayment": "2",
            "totalDestPayment": "1",
            "invoiceId": "AQEBAgEAAAABAQICAgIAAgICAQEAAgABAQEBAgABAQI",
            "currency": "b",
            "signature": "AAABAgACAQECAAIAAgECAgEAAQIBAAIAAgAAAgICAQACAAEAAQEBAAIAAAICAQIBAQEAAQABAAICAAIBAQECAA"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "ack": "AQECAgICAAICAgAAAgEAAQ"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "0",
      {
        "paymentDone": {
          "paymentId": "AgECAQACAgIAAgECAQECAg",
          "status": {
            "success": [
              {
                "responseHash": "AQAAAgABAAEAAAICAQIAAAACAQIBAAEBAAEBAgIAAAI",
                "invoiceId": "AgABAQABAQEAAgEBAAABAgIBAQICAQICAQACAgIBAgA",
                "currency": {
                  "currency": "d"
                },
                "srcPlainLock": "AQIBAAIBAgACAQEAAAIBAQAAAAEAAAEBAAEBAAACAAA",
                "destPlainLock": "AgABAgIAAgACAQIBAAACAAABAAEBAQACAQEAAgICAQE",
                "isComplete": false,
                "destPayment": "1",
                "totalDestPayment": "1",
                "signature": "AgECAAECAAEBAAABAgECAAAAAgEAAgIAAQECAAABAQEBAQAAAgIAAQABAQICAAEAAQIBAAAAAgICAgECAgIAAA"
              },
              "2",
              "AgAAAQEAAQABAgEAAgACAQ"
            ]
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AAICAAAAAgABAgIBAQEAAA"
}
''',
  r'''
{
  "ack": "AQEBAQAAAgECAQACAAIAAA"
}
''',
  r'''
{
  "ack": "AAEAAgICAgEAAQIBAAAAAQ"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "responseVerifyCommit": {
          "requestId": "AAIAAgIAAgIAAgICAgIBAg",
          "status": "success"
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "ꏪ",
      "nodeId": "0",
      "appPermissions": {
        "routes": true,
        "buyer": false,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AAABAQAAAAEBAQIBAQABAQIBAgEBAAABAQIBAgIBAAE",
        "indexServers": [
          {
            "publicKey": "AgEAAgIBAQEBAQECAAIAAAABAQIAAgACAAACAQICAQE",
            "address": {
              "address": "cacdaadbdaddbddbdcacdcaccdaadbbadabbbabcaadcaacacbcacdbdbdbbaadbcddbdacccdaadccdbdacdcbdcbbbcaccaadac"
            },
            "name": "3"
          }
        ],
        "optConnectedIndexServer": "AgICAgABAgACAgEAAAECAAICAAAAAAICAAAAAQIAAgI",
        "relays": [
          {
            "publicKey": "AAAAAAEBAQIAAgAAAQACAAEBAAABAgABAgIBAQICAQA",
            "address": {
              "address": "bbcddbdadcbbcbbaaacaabdaaaabcdbcccbddadddbaabbacbbcabadcadabdbd"
            },
            "name": ""
          }
        ],
        "friends": {},
        "openInvoices": {
          "AQAAAQIBAQACAgACAAIAAgECAgECAQICAgIAAQIAAAE": {
            "currency": "caaabccaadbca",
            "totalDestPayment": "2",
            "description": "\f[",
            "isCommitted": false,
            "generation": "0"
          }
        },
        "openPayments": {}
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQAAAAIBAgEBAgEBAQIAAQ"
}
''',
  r'''
{
  "ack": "AQICAQEAAAEAAQECAQECAg"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "1",
      "appPermissions": {
        "routes": false,
        "buyer": false,
        "seller": true,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AAAAAQIAAAEBAQICAQEAAgIBAQEBAAICAAEAAgEAAAI",
        "indexServers": [
          {
            "publicKey": "AAICAAACAQEAAQIAAgAAAAIBAQIBAQECAAEAAQEBAQA",
            "address": {
              "address": "bdddbdabdadaaccddadb"
            },
            "name": " "
          }
        ],
        "optConnectedIndexServer": "AQABAgICAAECAgIBAQABAQACAQEBAQACAgEBAQABAAI",
        "relays": [
          {
            "publicKey": "AgEBAQAAAAECAgAAAgEBAgECAgECAQICAgICAQIBAgE",
            "address": {
              "address": "acdadbcbcbdbaaacccbcbbdcacadbacdaabaccdbdbdcdbcacbadddcbdccaaacc"
            },
            "name": "\\"
          }
        ],
        "friends": {
          "AgIAAAABAQACAgAAAQIAAgIAAAABAAEBAQABAQIAAgI": {
            "name": "W￶",
            "currencyConfigs": {
              "bcbcabbcbbdcabb": {
                "rate": {
                  "mul": 0,
                  "add": 0
                },
                "remoteMaxDebt": "2",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AQAAAAIAAAIBAQEBAAABAAABAgACAgIAAAIBAgIBAQE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgIAAAABAgIBAQEAAAIBAgECAAEBAQECAQECAgIBAgA",
                  "remotePublicKey": "AQIAAQABAAICAQACAQIBAgEAAQACAQIAAgABAAAAAgE",
                  "balances": {
                    "daddcbbbcbac": {
                      "balance": "1",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "1"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AAECAgAAAAEBAgABAgABAQ",
              "newToken": "AAAAAAEBAgICAgABAQACAgACAgICAAIBAQEAAgECAQIAAQEAAgECAgIAAQABAAAAAAICAgICAQABAgICAAACAg"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {}
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {},
        "openPayments": {
          "AQIBAQIAAQIAAgEBAAICAQ": {
            "invoiceId": "AAIBAQABAAICAgACAgIAAAACAAEBAAEBAgABAAACAQA",
            "currency": "aadabdaacbcddb",
            "destPublicKey": "AAEAAQEAAQICAQAAAAICAAEAAQICAgABAgACAgACAgI",
            "destPayment": "2",
            "description": "\u0015¤",
            "generation": "0",
            "status": {
              "sending": "1"
            }
          },
          "AgEAAAABAAAAAgIAAQICAQ": {
            "invoiceId": "AgIAAQIAAAAAAQEAAAAAAgICAQIAAgEBAgABAQAAAAA",
            "currency": "bdaddadddcaccaa",
            "destPublicKey": "AQACAQAAAQIBAQICAAABAQEAAQIAAQACAgEBAgICAAE",
            "destPayment": "0",
            "description": "\t",
            "generation": "2",
            "status": {
              "sending": "1"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQIAAgEBAgACAgEAAQACAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "‬򂡙",
      "nodeId": "2",
      "appPermissions": {
        "routes": true,
        "buyer": false,
        "seller": true,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AgECAgICAQACAgIBAQAAAAICAgICAAIAAgABAAIAAAI",
        "indexServers": [],
        "optConnectedIndexServer": "AgICAQIAAAACAgICAgIAAQICAQICAgICAQECAgEBAAI",
        "relays": [
          {
            "publicKey": "AAEBAQACAQIBAQIBAgEBAQACAAACAgEBAQABAgICAQA",
            "address": {
              "address": "adccadbadcbcddbbbcaccdbabcacaabcbccccccacdcdbdbadaccbcbdbdbbaabbccdbcccbaadcdcdbcaabadccbaaadbbbbdabdbddcdbabccdadaaacbbabbcb"
            },
            "name": ""
          }
        ],
        "friends": {
          "AgAAAAECAQICAAACAAIBAQEAAgAAAAECAQACAgAAAAI": {
            "name": "9",
            "currencyConfigs": {
              "baabdbadbabd": {
                "rate": {
                  "mul": 1,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {}
              }
            },
            "status": "enabled"
          },
          "AAECAAECAgABAQEBAAICAAIAAQAAAQAAAQEAAAAAAAA": {
            "name": "⁎",
            "currencyConfigs": {
              "cccaccdb": {
                "rate": {
                  "mul": 1,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              },
              "dbcacada": {
                "rate": {
                  "mul": 2,
                  "add": 0
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {}
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AgICAAACAQICAgECAgABAAECAgABAAACAAEAAQIAAAI": {
            "currency": "dbcdcbccda",
            "totalDestPayment": "1",
            "description": "",
            "isCommitted": true,
            "generation": "2"
          }
        },
        "openPayments": {
          "AQIBAQEBAQIAAgIBAgIBAQ": {
            "invoiceId": "AAAAAAICAgIAAgACAQIAAgABAAEBAAECAgEAAAIBAAI",
            "currency": "abddbcd",
            "destPublicKey": "AAACAAIAAgABAAIBAAAAAQACAQECAQAAAQEBAQIBAQE",
            "destPayment": "0",
            "description": "3G",
            "generation": "0",
            "status": {
              "foundRoute": [
                "AQIBAAIBAgEAAAACAgEAAQ",
                "1"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQECAAABAAIBAQAAAAACAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "": {
        "mode": {
          "open": "0"
        },
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AAIAAQACAQECAQABAQEBAAEAAgACAAABAAICAAECAQA",
            "nodePublicKey": "AQEBAgICAAECAgIAAgIBAQACAAECAQEAAQACAgACAAI",
            "nodeAddress": {
              "address": "cacbbbabbdcdcbdcccdbacaacbbadddddbcaaaaabaacabbbbaadaccdcdcbaadbbdbccabbdcddddbaabbcddcdcdcdbadabbdcdabdbbcbacddbadabccaaaaaabcdcddddbcdad"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentFees": {
          "paymentId": "AgACAAAAAgICAAIAAQIBAQ",
          "response": "unreachable"
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "ack": "AAEAAAEAAgIBAAEAAAEAAQ"
}
''',
  r'''
{
  "ack": "AgEAAgIAAgICAgEAAQECAg"
}
''',
  r'''
{
  "ack": "AQABAAAAAgECAAAAAAACAQ"
}
''',
  r'''
{
  "ack": "AgABAQIAAQICAgEBAgIBAg"
}
''',
  r'''
{
  "ack": "AQAAAQACAAACAQICAAEBAA"
}
''',
  r'''
{
  "ack": "AgECAQICAgEBAQABAgABAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "¦",
      "nodeId": "2",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": false,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AgAAAgACAgABAAICAAACAgICAgEBAgACAAICAgEBAgI",
        "indexServers": [
          {
            "publicKey": "AgECAgIAAAICAgICAQICAQIBAQECAgEAAgEAAgEAAAA",
            "address": {
              "address": "dcdacacadababdabdbbcaaadabbaacbbdaabbbadccddaadadcddbdccbaadbadbaadcdcacdaabaacbabddadbddbdadbadccdc"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {
          "AgABAgAAAQACAQEBAQEBAAIAAQEBAQECAQEAAAECAgI": {
            "name": "",
            "currencyConfigs": {
              "ccdaad": {
                "rate": {
                  "mul": 1,
                  "add": 0
                },
                "remoteMaxDebt": "2",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "bbcbbaabdacbdd": {
                    "balance": "-1",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "0"
                  },
                  "bcccbdcacbaaa": {
                    "balance": "-1",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "0"
                  }
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AQEBAgIBAgEBAAACAgEAAAEBAAACAQACAgECAgACAQI": {
            "currency": "abcbbb",
            "totalDestPayment": "2",
            "description": "",
            "isCommitted": false,
            "generation": "0"
          },
          "AgACAAABAQIAAgAAAQACAAAAAQIAAQACAAABAQABAQA": {
            "currency": "ddcc",
            "totalDestPayment": "0",
            "description": "",
            "isCommitted": true,
            "generation": "2"
          }
        },
        "openPayments": {
          "AAIBAgABAgAAAAAAAAEBAA": {
            "invoiceId": "AAIAAgAAAAACAAIAAQIAAQABAgIBAgAAAQEBAAABAQA",
            "currency": "bbacbddcdccbdcc",
            "destPublicKey": "AgEBAgIBAAABAgACAQAAAAABAQIBAQEBAAABAgABAAI",
            "destPayment": "1",
            "description": "",
            "generation": "0",
            "status": {
              "sending": "0"
            }
          },
          "AAIAAQIAAgIBAQEBAgEBAg": {
            "invoiceId": "AAABAgIBAgAAAgACAQIBAgIBAgAAAQIBAQAAAAAAAQA",
            "currency": "bbdddabaccdcd",
            "destPublicKey": "AAEBAAEAAgEBAQICAQIAAgEAAQABAAACAQIBAQEAAgI",
            "destPayment": "0",
            "description": "",
            "generation": "1",
            "status": {
              "searchingRoute": "AQICAgAAAAACAQAAAAACAA"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AAICAAECAAICAgICAAIAAg"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": true,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AQICAAECAAIAAQABAAEAAQEBAQEBAgABAgAAAQECAgE",
        "indexServers": [
          {
            "publicKey": "AgABAgABAAECAgIBAQEAAAABAgABAAEAAAIAAQEAAgA",
            "address": {
              "address": "cccdbadacacdbcdbbcbdcdadbdccabbddbcbbbbbbbaddcdbabbadaadcadcadbbcdddddbccdaaabdadadaadbaaaddbcccdcbcabdaadcbbcdddddbcbbccdaabbbcdcaaaabdaabbbcaaaabbaccabcdbcbdadacaadbcdccabcdbaccadaaabdabbdbaaaddabccdbaadcacabbdbdbbbacba"
            },
            "name": "񳮙⁥"
          },
          {
            "publicKey": "AAICAQEBAQACAQIAAgIBAQIBAQECAAABAAECAAIAAgI",
            "address": {
              "address": "c"
            },
            "name": "t"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAIAAQECAQECAAECAAABAgIAAQIAAgACAAABAgECAgE",
            "address": {
              "address": "bbcbccbdbddcabddccbaadcbaadddadcddadcad"
            },
            "name": ""
          },
          {
            "publicKey": "AgABAgECAAAAAQEBAAEAAgEAAQEAAAABAQIAAAICAQE",
            "address": {
              "address": "bcbcababbdacddbcbbbdcbbaddbdbacbabcdddcaabaacadaddadacadbcaacddcabdabbbabdaaabcddbcadcccdbcbdbadbbcaaaadbabbbdabbacaaccbacddabddbddacbbcaddbdbcddcadbdadbcdbadcaacccdccadcdddddcbcbadcdcbbdbddccbadccccc"
            },
            "name": "F"
          }
        ],
        "friends": {
          "AAEBAQABAQIAAAEAAAIBAAICAAACAgIBAQICAAAAAgA": {
            "name": "⁌£",
            "currencyConfigs": {
              "abd": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              },
              "aaddacdcdbda": {
                "rate": {
                  "mul": 2,
                  "add": 2
                },
                "remoteMaxDebt": "2",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "cbdadbaacb": {
                    "balance": "1",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "0"
                  }
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {},
        "openPayments": {
          "AAIAAgABAQAAAAIAAQAAAA": {
            "invoiceId": "AQABAgACAQAAAQIBAgABAgICAQAAAgEBAQEAAgIBAgI",
            "currency": "c",
            "destPublicKey": "AAECAQIAAAECAgABAgEAAQICAAEBAAACAAIBAAECAAI",
            "destPayment": "2",
            "description": "",
            "generation": "2",
            "status": {
              "success": [
                {
                  "responseHash": "AgEAAgAAAQACAQIAAgICAQAAAgACAAECAQEBAgEAAAE",
                  "invoiceId": "AQACAQEBAQEBAAEAAQICAQACAAIAAAIBAgECAQIAAAI",
                  "currency": {
                    "currency": "caccaa"
                  },
                  "srcPlainLock": "AgABAQEBAQIBAQIBAgACAgIBAgEAAAABAAAAAgACAAE",
                  "destPlainLock": "AQICAAACAgAAAAEAAAAAAQEBAgEBAgECAgECAAEAAgE",
                  "isComplete": false,
                  "destPayment": "2",
                  "totalDestPayment": "2",
                  "signature": "AQECAgECAgICAAEBAAAAAAECAAAAAAEAAgEBAAACAAECAAACAAICAAABAQAAAgEAAAABAQICAAEAAQIBAgEBAQ"
                },
                "1",
                "AAACAQICAAEBAQECAAECAA"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgEAAAAAAQEBAAAAAQABAg"
}
''',
  r'''
{
  "ack": "AQEAAgIAAgIAAQECAgIAAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      ";(": {
        "mode": {
          "open": "1"
        },
        "isEnabled": true,
        "info": {
          "local": {
            "nodePublicKey": "AAABAgAAAQICAAEBAAAAAgAAAAABAgICAQIBAAEBAgI"
          }
        }
      },
      "?": {
        "mode": {
          "open": "0"
        },
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgEBAQEAAgECAgECAgICAAABAQACAAEBAQEAAgECAAA",
            "nodePublicKey": "AAACAAAAAgABAAAAAAABAQABAQAAAQECAAIAAgACAAE",
            "nodeAddress": {
              "address": "cdcdbdbbccdac"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AAABAQIAAQEAAQEBAAIBAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": ")}",
      "nodeId": "1",
      "appPermissions": {
        "routes": true,
        "buyer": false,
        "seller": true,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AQEBAAECAgACAgAAAgABAQECAgECAAACAgEBAAICAQA",
        "indexServers": [
          {
            "publicKey": "AQICAgEAAgIAAgACAgIBAAIBAQEAAQIBAgAAAAICAAE",
            "address": {
              "address": "dddbdbabaacbcbacabbbcbddaccacdccaaadbbaabbbdaaaaadddacaaacaadabdddaabdacacabdabacbbdadbddcadcbdcdacaabccdabdcbaaabcdbacdcbabacdcadcadccabdbdbbaaabccabdcdcdbadddcbcbabcadcbddbbbddcbcbaacbccdbdabdacaaabbaacdcadaddaaacdddadabcaddbcd"
            },
            "name": ""
          },
          {
            "publicKey": "AgEBAQABAgECAgEAAgACAAACAAIAAgEAAQACAgICAQE",
            "address": {
              "address": "ddbaadddaacbdddbdddcacadbdddcddcacbdaacbcddabbcddadcacbadddaaaaaabcdddacccccbdcddcdabbacdacba"
            },
            "name": "孝"
          }
        ],
        "optConnectedIndexServer": "AQIBAAEBAAACAgECAAACAQIBAgEAAAEAAQABAgAAAQE",
        "relays": [],
        "friends": {},
        "openInvoices": {
          "AgIAAQACAQEBAgACAgEBAAACAQAAAQIAAQIAAQAAAQA": {
            "currency": "cbcbca",
            "totalDestPayment": "1",
            "description": "'\u000b",
            "isCommitted": false,
            "generation": "2"
          }
        },
        "openPayments": {}
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "": {
        "mode": "closed",
        "isEnabled": true,
        "info": {
          "local": {
            "nodePublicKey": "AQAAAAEAAQIAAgAAAQABAAEBAQABAgACAQICAQIBAQE"
          }
        }
      },
      "　": {
        "mode": "closed",
        "isEnabled": true,
        "info": {
          "local": {
            "nodePublicKey": "AAECAQECAgEAAgIBAAIBAgABAgAAAAIBAgEAAgAAAQA"
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQIBAgECAQECAgAAAQACAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "": {
        "mode": {
          "open": "2"
        },
        "isEnabled": false,
        "info": {
          "local": {
            "nodePublicKey": "AAICAAEAAAICAQICAgIBAgACAQAAAQIBAAECAgECAgI"
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgEAAAIAAQAAAAABAAECAQ"
}
''',
  r'''
{
  "ack": "AgIAAgAAAgIBAgIAAAIBAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "": {
        "mode": "closed",
        "isEnabled": false,
        "info": {
          "local": {
            "nodePublicKey": "AgABAgEBAgIAAgEAAAEAAgABAgIAAgEAAQEAAQECAAE"
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "\\\"": {
        "mode": "closed",
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AQEAAgEBAAEAAAIBAQABAAAAAAEBAAIAAQIBAAIBAQI",
            "nodePublicKey": "AAIBAgIBAQICAQIAAAABAgAAAQABAQACAgACAQIAAQE",
            "nodeAddress": {
              "address": "cacbbaababcdbabcddacccbaacaaaddddbabacbcaddbdcdbcccdddbcaabcaabaaddacbcddcaddbcbcacbcaccbdababaaadcaacdbabdbcbdcd"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgIAAAECAQACAAAAAgEAAg"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "paymentCommit": {
          "paymentId": "AgEAAgEAAAACAQAAAgECAg",
          "commit": {
            "responseHash": "AQAAAAECAAAAAQAAAgEAAgECAQIAAQEBAQAAAQIAAQA",
            "srcPlainLock": "AQIBAAECAAABAgICAQAAAQAAAQACAQECAgAAAAABAgA",
            "destHashedLock": "AAACAQACAAACAAABAgIAAgIAAgICAQEBAgICAAEBAgI",
            "destPayment": "2",
            "totalDestPayment": "0",
            "invoiceId": "AgAAAQICAAICAQEBAAAAAQEAAQABAQICAAICAAAAAAE",
            "currency": "a",
            "signature": "AgICAQABAAEAAgEAAAECAAAAAQECAgIBAQICAQABAgIBAQECAAEAAgEBAAEBAAIBAQABAAACAAEAAAIAAAACAA"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AQEAAQICAgEBAgICAAEAAA"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "paymentCommit": {
          "paymentId": "AgIBAAIAAgIBAgICAQIBAA",
          "commit": {
            "responseHash": "AQICAAEAAQECAAECAgECAgACAgIAAgIBAQICAQEBAgA",
            "srcPlainLock": "AAIAAAACAQIAAQAAAAEAAQIAAAAAAgIAAQIAAQECAgE",
            "destHashedLock": "AgAAAgEBAgIBAQEAAAICAQIAAgIBAgIAAgAAAgIBAQI",
            "destPayment": "0",
            "totalDestPayment": "2",
            "invoiceId": "AAACAAEAAgEAAQEAAAEAAAIBAgICAgEAAAICAgIBAQE",
            "currency": "dbb",
            "signature": "AAECAgACAQEBAQEAAgACAgAAAQIAAAEBAAIBAAACAAAAAQEBAgABAgACAgICAgEBAgEBAQAAAgACAAEBAAICAg"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentDone": {
          "paymentId": "AAIBAQEAAAIBAAEBAQIAAA",
          "status": {
            "success": [
              {
                "responseHash": "AgEAAgACAgICAAIBAgAAAgEAAAAAAAACAAICAgECAQI",
                "invoiceId": "AAABAAACAAEAAAABAgICAQEAAAEBAQACAgACAAEBAQA",
                "currency": {
                  "currency": "acaadbdcbbdadac"
                },
                "srcPlainLock": "AAICAAIBAAACAQEBAgIAAAIBAgACAQIBAAICAgECAgI",
                "destPlainLock": "AgIAAgEBAAABAQAAAAEAAAEBAgEBAgIBAQACAAIAAgI",
                "isComplete": false,
                "destPayment": "0",
                "totalDestPayment": "1",
                "signature": "AAEBAgAAAgEAAgEBAQIBAgEBAQICAQIBAQABAQAAAgEBAgABAAICAQABAQEBAgABAQICAAABAAABAQIBAQABAg"
              },
              "2",
              "AgIBAQECAAICAAEBAQABAQ"
            ]
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "0",
      {
        "paymentCommit": {
          "paymentId": "AAEAAAICAAIBAAIBAgACAA",
          "commit": {
            "responseHash": "AgIBAQABAAEAAQACAQICAAECAgACAQECAgECAAAAAgE",
            "srcPlainLock": "AgABAgECAgABAAIBAQIBAQABAgABAgIBAgIBAgACAgI",
            "destHashedLock": "AAABAgEBAQACAgIBAgABAAIBAAEBAQICAgABAAABAQI",
            "destPayment": "2",
            "totalDestPayment": "0",
            "invoiceId": "AgEAAQIBAgIBAAIAAAACAAACAQEBAQEBAAACAgAAAQI",
            "currency": "bdbcbcbbdadabd",
            "signature": "AQEBAAEBAQICAQIBAQICAQIBAgABAAABAQIAAAAAAAEAAAABAAEAAAEAAgIAAAIAAgABAgIBAgECAgABAAICAg"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": true,
        "seller": true,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AAECAAABAQECAQIAAQIBAQIAAAIBAgECAAABAAICAQI",
        "indexServers": [
          {
            "publicKey": "AAIAAAICAAIAAgEBAAIBAgEAAQIBAgICAQEAAQEAAQE",
            "address": {
              "address": "ccbcadccdbdabdaddbcdacbbadccddbddadbcaadccbcbcdccddacaaacddacbcaaddcdbacaccdaddbabbcdbdbcdabbccaddabbacaccacdabcadbaadbbddbcbbaadadacacbcddacdacddaacadaadbbbbabbdabadaadaacddbccbdadbaccadabbabdbdadc"
            },
            "name": "(@"
          },
          {
            "publicKey": "AQEBAgEBAQEBAAAAAAIBAgIAAAACAQABAQEBAgECAgA",
            "address": {
              "address": "cdbacbbacadccdaacaabcccccadcbbccacdcbabcd"
            },
            "name": "t%"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {
          "AQICAAEBAAECAAACAQICAAEAAQABAgACAAABAQAAAAA": {
            "name": "",
            "currencyConfigs": {
              "abdbbac": {
                "rate": {
                  "mul": 2,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              },
              "acd": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "dcacabaccdba": {
                    "balance": "0",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "1"
                  },
                  "cc": {
                    "balance": "1",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "0"
                  }
                }
              }
            },
            "status": "enabled"
          },
          "AAIAAQIBAgIAAQECAgABAAABAAIBAgACAgAAAgICAQI": {
            "name": "؅#",
            "currencyConfigs": {
              "cad": {
                "rate": {
                  "mul": 2,
                  "add": 2
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              },
              "bccd": {
                "rate": {
                  "mul": 0,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AgICAQIAAAICAAACAAACAQEAAgIBAAECAQICAQECAQI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAAAAAECAAIBAgACAAACAAICAQIAAAABAQACAgECAAI",
                  "remotePublicKey": "AAECAAEBAgABAgABAAIBAAIBAgEBAAAAAQAAAQIBAgA",
                  "balances": {
                    "cbdbca": {
                      "balance": "-2",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "1"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AgACAQIAAQECAQIBAgIAAQ",
              "newToken": "AgIAAQACAgEBAQAAAAIAAgICAgEAAAIAAAIBAgACAAEAAQIBAQICAgACAgEBAQACAAEBAgACAgIBAQEAAQAAAA"
            },
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "aaabbccabddc": "-2",
                  "dbbdccbbdcbdaab": "0"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AgECAgEAAAECAAACAQABAgICAAEBAAABAgIBAQEAAQABAgIBAAAAAAICAgIAAgECAAEAAAABAQACAAACAgAAAQ",
                  "balanceForReset": {
                    "ccacabcabddc": "-2"
                  }
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AQICAQIBAQABAQEBAgIAAAEBAgABAQIAAQICAQIAAgI": {
            "currency": "acacbb",
            "totalDestPayment": "1",
            "description": " ",
            "isCommitted": true,
            "generation": "0"
          }
        },
        "openPayments": {
          "AQECAgECAQEBAgICAQACAQ": {
            "invoiceId": "AAICAQIBAAIBAQECAAECAAIAAgEAAgIBAQACAgEBAAA",
            "currency": "cbcaaabc",
            "destPublicKey": "AAEBAAACAQEBAgICAQICAQABAAIBAgIBAgECAQEAAAI",
            "destPayment": "1",
            "description": "[",
            "generation": "0",
            "status": {
              "commit": [
                {
                  "responseHash": "AgABAQACAgEAAAEAAgIAAgAAAgECAgAAAQAAAQABAQA",
                  "srcPlainLock": "AAIBAgACAgABAAIBAQIBAgACAQICAgAAAQIBAAIAAAI",
                  "destHashedLock": "AAICAgIBAQIAAQEAAQEAAgABAQAAAgEBAAABAAEAAgE",
                  "destPayment": "0",
                  "totalDestPayment": "0",
                  "invoiceId": "AgABAgIAAAEAAQIAAAICAAIAAAEAAgABAAECAQACAQA",
                  "currency": "baccb",
                  "signature": "AQECAgEAAQABAgACAAAAAQEAAAABAgAAAgEAAAEBAAEAAAICAgEBAgEBAQAAAAABAAAAAQEBAQECAAAAAgECAg"
                },
                "1"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AAECAQACAQEBAgIBAQIBAg"
}
''',
  r'''
{
  "ack": "AAIAAQECAQEBAQIBAQIAAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "A쎖": {
        "mode": "closed",
        "isEnabled": false,
        "info": {
          "local": {
            "nodePublicKey": "AgABAgECAAIBAgACAQACAAABAQIBAAEBAQAAAAEBAQI"
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "0",
      {
        "responseVerifyCommit": {
          "requestId": "AAACAgACAQAAAAABAQECAQ",
          "status": "failure"
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "ack": "AgEAAgAAAgABAgICAQEBAg"
}
''',
  r'''
{
  "ack": "AgECAAIAAAIAAQAAAgAAAg"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "1",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": false,
        "seller": false,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AgABAQICAQEAAgEAAgABAgECAAABAQIBAAEBAQIBAAE",
        "indexServers": [
          {
            "publicKey": "AQEBAQACAAACAgEBAQABAAAAAQEAAAEAAQIAAQAAAgE",
            "address": {
              "address": "dbacbadcacccadabcbaabbdbdddabbcbbcddbcddccaadcaccbbacddccacdbb"
            },
            "name": "3¥"
          },
          {
            "publicKey": "AQIAAQACAgICAQEBAgIBAAACAAACAAEBAQAAAgAAAAA",
            "address": {
              "address": "dbbdcbdaacbbbdcdbbbcbbdbddbcdccdbabcaabdacbcbabacbabadbdbbadcbdcdaccacbcbcbbcbabbcadaabdddabcdacbacacbadaadddaadadcbddabbdabcababcacadadaaddbccdbbcdcddbadcdbaadbdbbccbacdaacdabcdbaddddccabdadabbbccd"
            },
            "name": "򵮠:"
          }
        ],
        "optConnectedIndexServer": "AAEBAgAAAgEBAAEAAAAAAAEAAgIBAQAAAQEBAAIAAQI",
        "relays": [
          {
            "publicKey": "AAEAAAAAAgECAQEAAgECAAEBAQACAQIAAQIAAAACAAI",
            "address": {
              "address": "adddddbcbddcbbddcbdababcbccabbdadbcabaddbabdadcbbbdaadbddbdaabdbdcadcaddbdcbbcdccbdcbadbbcbcddadababcacdcadabcaddcbcbdbbabadadbbdbccbdbdbbcccbcbaddbddcbbcdccccdadacacbbaaccdcbadccbbdddcdaccbbaaaabc"
            },
            "name": ""
          }
        ],
        "friends": {},
        "openInvoices": {
          "AgEBAgECAQIBAAABAQABAgABAgAAAQEAAQAAAgECAQI": {
            "currency": "dada",
            "totalDestPayment": "1",
            "description": "덱C",
            "isCommitted": true,
            "generation": "0"
          },
          "AQIAAgIAAQEAAAAAAAICAAIAAgEBAgEAAQABAQACAQA": {
            "currency": "bdccddadaacdbb",
            "totalDestPayment": "0",
            "description": "9Y",
            "isCommitted": false,
            "generation": "1"
          }
        },
        "openPayments": {
          "AAICAQICAgIAAQIBAQIAAg": {
            "invoiceId": "AAIAAAEAAQACAgEBAQEAAQICAgIAAQABAQACAgAAAAI",
            "currency": "ababdbdaa",
            "destPublicKey": "AgEBAgEBAgECAQABAQEBAgAAAAEBAgICAgIBAgABAgA",
            "destPayment": "0",
            "description": "",
            "generation": "0",
            "status": {
              "commit": [
                {
                  "responseHash": "AAABAgIBAgEAAgICAQIAAQECAAACAgEBAQABAgECAAE",
                  "srcPlainLock": "AgIBAgECAgAAAAIBAAICAQECAQIAAAEBAQEAAQIAAgA",
                  "destHashedLock": "AAEAAAEAAAICAQABAAACAQACAgEBAAICAAICAAEBAQE",
                  "destPayment": "0",
                  "totalDestPayment": "1",
                  "invoiceId": "AQAAAgABAAAAAQICAgAAAAEBAQICAAICAgABAgIBAgE",
                  "currency": "cb",
                  "signature": "AQEAAQECAgACAgECAAAAAAAAAgIAAAEAAQICAgABAAEBAAABAQACAgIBAgEBAgICAgICAgICAQEAAQAAAAEAAQ"
                },
                "0"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AAICAQEAAQEBAgACAAIBAA"
}
''',
  r'''
{
  "ack": "AgEAAAIBAgICAgAAAQIBAg"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": ".\u0010",
      "nodeId": "2",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AgAAAAABAAEAAQACAAECAQACAQACAgIBAgICAQACAQE",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AQICAgEAAgEBAQEBAAEBAAACAAEAAgEBAAIBAgICAQE",
            "address": {
              "address": "ddcacbbcaddddcbdcbadacbcadbacadcabbaddbbdbaabbcbddbcaaccdccdacabbcbadadddccbacabbabcbcaccddcdbbddaccaababbcbbdccacacbcbbcbbbbbcdadbdddcdabaccacccbbdbbaccbdacaadbcbdddadbdbdacbcabbbdbbcaabbccbabdbdacabdcbddadadbdddaacdadabadadccbaddcabdaacbbdbccddccda"
            },
            "name": "[Q"
          }
        ],
        "friends": {
          "AQEBAQAAAQECAgEBAQECAQEAAgABAAAAAgABAQAAAgE": {
            "name": "痌",
            "currencyConfigs": {
              "abcddbbdbcddc": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "cbdadbcdc": {
                    "balance": "0",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "1"
                  },
                  "bcbcadaddccbddb": {
                    "balance": "-1",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "2"
                  }
                }
              }
            },
            "status": "disabled"
          },
          "AQICAAEBAAIBAAIBAgEAAAECAgABAAIAAAICAAEBAAI": {
            "name": "‸",
            "currencyConfigs": {
              "accda": {
                "rate": {
                  "mul": 1,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "ddcdbbaddcdd": "1"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AAABAgABAQACAAEBAQEAAQIBAgICAAABAQEAAAEBAAAAAgAAAAECAAABAQEAAQACAQACAAAAAQICAAAAAAEBAA",
                  "balanceForReset": {}
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AgAAAQIBAQEBAAICAAICAQABAAAAAgACAgACAQIAAQE": {
            "currency": "accbbadbdbba",
            "totalDestPayment": "0",
            "description": "⁒;",
            "isCommitted": true,
            "generation": "1"
          },
          "AQABAQECAAAAAQIAAQICAQACAAIBAgEAAgECAQABAgE": {
            "currency": "ddbdaaaaa",
            "totalDestPayment": "2",
            "description": "\u0016",
            "isCommitted": false,
            "generation": "1"
          }
        },
        "openPayments": {
          "AQABAQICAgIBAAACAgIAAg": {
            "invoiceId": "AgAAAgEAAAECAgICAAIAAgABAgIBAQECAgEBAQIAAAE",
            "currency": "cdcdccbdbaaa",
            "destPublicKey": "AgECAgEAAgIBAgEBAQACAQAAAAICAQEBAAECAQICAQI",
            "destPayment": "2",
            "description": "#",
            "generation": "1",
            "status": {
              "sending": "1"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "report": {
          "localPublicKey": "AAECAgEBAQICAQAAAgEBAQABAQACAgICAQEAAgIBAAA",
          "indexServers": [],
          "optConnectedIndexServer": null,
          "relays": [
            {
              "publicKey": "AAACAgIAAQABAQACAgACAQECAAEBAQIAAgIAAQIBAgE",
              "address": {
                "address": "bbcdacbcdabcccddaddacccddacabaddababddbaaaccccdaadaaabcadabbaccbbdcbcacabbcbcdabbcaaaaaababbabadbdcabcdacbdcbcacddddadcaaada"
              },
              "name": "5"
            },
            {
              "publicKey": "AgECAgAAAAIAAgICAQEBAQECAAACAgEBAgIBAAIAAQI",
              "address": {
                "address": "dbcabaccccabbccacddcdbdddabccadddccbbadccccdbadcdcbbdddddaaccdabcbdbbaadacbdadbabaadbddbbaddcdbbdacd"
              },
              "name": ""
            }
          ],
          "friends": {},
          "openInvoices": {
            "AQECAQEAAQEAAAIBAQIBAAIAAAIBAQICAQACAgEAAgI": {
              "currency": "cabbdc",
              "totalDestPayment": "1",
              "description": "",
              "isCommitted": true,
              "generation": "1"
            },
            "AgICAgECAQACAQECAAEBAQABAgABAgIBAQICAQEAAgI": {
              "currency": "dabcaddd",
              "totalDestPayment": "0",
              "description": "􅜐",
              "isCommitted": false,
              "generation": "0"
            }
          },
          "openPayments": {
            "AgICAgEAAAACAgACAgAAAA": {
              "invoiceId": "AAICAQACAgICAAABAAAAAQAAAAIBAQICAgIBAQABAAA",
              "currency": "bc",
              "destPublicKey": "AQABAQAAAQEBAgABAgEBAAIBAgACAAACAAICAgEBAAE",
              "destPayment": "2",
              "description": "",
              "generation": "0",
              "status": {
                "commit": [
                  {
                    "responseHash": "AAACAAICAgIAAgIAAQEAAQECAAIBAAACAQAAAgACAAA",
                    "srcPlainLock": "AQAAAQAAAgICAgABAQACAgIBAQEAAgAAAgIBAQECAAA",
                    "destHashedLock": "AgABAAIAAgACAQABAAACAAACAAABAgIBAgIAAgAAAAA",
                    "destPayment": "0",
                    "totalDestPayment": "1",
                    "invoiceId": "AgEBAAEAAQAAAgICAQEBAQIBAAIBAAAAAQIAAAABAgE",
                    "currency": "bccacdabababdc",
                    "signature": "AgECAgACAgEAAgICAAICAgICAgABAgEAAAABAQIAAQEBAgABAgECAAEBAQEAAAIBAgEBAgABAQIBAQAAAAICAA"
                  },
                  "2"
                ]
              }
            },
            "AQEAAAECAAEAAQEAAgEBAA": {
              "invoiceId": "AgIBAgAAAAACAgIAAAIAAAECAgABAQICAQICAQEBAgI",
              "currency": "bacaccdba",
              "destPublicKey": "AgIAAAEAAAECAgIBAgECAAECAgEBAAEAAgICAgAAAQI",
              "destPayment": "2",
              "description": " ",
              "generation": "2",
              "status": {
                "foundRoute": [
                  "AQACAgIAAQEAAAABAQAAAQ",
                  "1"
                ]
              }
            }
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "؜!": {
        "mode": {
          "open": "2"
        },
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AAACAAICAgABAAEAAQAAAAEBAAIBAgEAAgICAAEBAgA",
            "nodePublicKey": "AgABAQABAgIAAgACAQEAAAECAQIBAQIBAQIBAgEBAAE",
            "nodeAddress": {
              "address": "cacaabadabacdacdbaadaababdbcdacdabdccbbbacadaccbabcaabdcdadbcbaacbdcacbcabdcdacabccdabcdddbddaaabcaddbddabdddcbbaacad"
            }
          }
        }
      },
      "": {
        "mode": {
          "open": "2"
        },
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgICAQIAAAIBAQIBAgIBAgEBAQIBAQAAAAIBAAACAQE",
            "nodePublicKey": "AQEAAAIBAAEAAQEAAQECAgEBAgACAAAAAAIBAAIAAgI",
            "nodeAddress": {
              "address": "bbbbcdccdcbddacdbddcccdbbdaccdadbdccaacdbbcaabbdcbdbbbabac"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "⁈": {
        "mode": "closed",
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgIAAgIBAgAAAAAAAQAAAAEAAAACAAABAQIAAQACAAI",
            "nodePublicKey": "AQABAgECAQECAQICAQAAAQEBAQECAQEBAAECAQABAQA",
            "nodeAddress": {
              "address": "babcbabbaddacaddd"
            }
          }
        }
      },
      "d": {
        "mode": "closed",
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgACAgEBAgEBAQABAgEBAAIBAAEAAQEBAQIBAgABAgE",
            "nodePublicKey": "AAECAgEAAAECAgEBAgEBAgIAAAEBAAACAQEAAQECAAE",
            "nodeAddress": {
              "address": "cddcabbabdbacbdcddcbbcbdbdbadacaadbcacdadbbcdcabcddcaabcbddcabcdbabdbdbdaddccc"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "responseVerifyCommit": {
          "requestId": "AAIBAgECAAABAQAAAAIBAA",
          "status": "failure"
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AQABAgACAgICAQABAQABAg"
}
''',
  r'''
{
  "ack": "AgIAAgIAAQEAAQEAAQECAA"
}
''',
  r'''
{
  "ack": "AAABAQECAAACAQIAAQEAAQ"
}
''',
  r'''
{
  "ack": "AQECAAICAQICAgIBAgABAA"
}
''',
  r'''
{
  "ack": "AAECAQEAAAEBAAICAgABAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "u3",
      "nodeId": "0",
      "appPermissions": {
        "routes": false,
        "buyer": true,
        "seller": false,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AgEBAQIBAAIAAgECAAACAAABAgAAAgECAQIAAgICAAE",
        "indexServers": [],
        "optConnectedIndexServer": "AAABAQEBAAIAAgIBAgIAAQEBAQECAgIAAgACAgECAgI",
        "relays": [],
        "friends": {
          "AQAAAQAAAQAAAQACAgECAAABAgECAgEBAAEAAgAAAQE": {
            "name": "󞼭“",
            "currencyConfigs": {
              "ccbadaad": {
                "rate": {
                  "mul": 2,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              },
              "aabc": {
                "rate": {
                  "mul": 2,
                  "add": 2
                },
                "remoteMaxDebt": "2",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "bbadabc": "0"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          },
          "AgECAgECAAIBAgEAAQABAgIBAQIAAQEBAAIAAgEBAQE": {
            "name": "",
            "currencyConfigs": {
              "acbdcacddb": {
                "rate": {
                  "mul": 0,
                  "add": 1
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AQEBAgABAAACAQECAQEAAQACAgIAAgIBAgACAAEAAQI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAACAQECAgICAAABAgEBAAABAgEAAgECAQAAAgIBAAI",
                  "remotePublicKey": "AAACAgIAAAEBAQACAAAAAQECAQAAAAABAgICAgAAAQI",
                  "balances": {
                    "abcaadadb": {
                      "balance": "0",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "0"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AQECAAICAgACAAAAAAIAAQ",
              "newToken": "AgICAQACAAIBAgICAgEAAgEAAAEBAQICAAECAAECAQICAgACAQEBAQEBAAIAAAIAAQIBAgABAAAAAgECAQIBAA"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "dbcadbc": {
                    "balance": "1",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "2"
                  },
                  "addbdccd": {
                    "balance": "-1",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "0"
                  }
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AgECAQIAAAACAQEBAQECAgACAgIAAQABAQABAgEAAQE": {
            "currency": "aaadbbccbbba",
            "totalDestPayment": "2",
            "description": "",
            "isCommitted": false,
            "generation": "0"
          }
        },
        "openPayments": {
          "AAICAgIBAgECAQABAQABAg": {
            "invoiceId": "AAACAQEAAgECAQACAgICAAIAAQEBAQECAgIAAgACAQA",
            "currency": "bccdddccadbada",
            "destPublicKey": "AQABAAAAAAEAAAACAQACAgIBAAECAQIAAAABAQIAAgA",
            "destPayment": "2",
            "description": "",
            "generation": "1",
            "status": {
              "foundRoute": [
                "AQABAgIAAgEAAgICAQIBAQ",
                "2"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgEAAAAAAgIAAAEBAAEBAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": true,
        "seller": false,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AQEBAQEAAQACAAEAAQAAAQABAgAAAQEBAAIBAgICAAE",
        "indexServers": [
          {
            "publicKey": "AAEBAAACAgIAAQACAgICAgEBAAICAgICAAIAAgEBAgI",
            "address": {
              "address": "acab"
            },
            "name": ")"
          },
          {
            "publicKey": "AAECAQECAAICAAACAgAAAQEBAgAAAAIAAAICAgABAAA",
            "address": {
              "address": "dccdabaccccabbdbaadcbbacbadcabaaacdcdaadbdcddbcadcbbbaaacacadbccbadcaacabadbcbcbcccabdddadcaaadbdcbcaaaaddcddabadccaccbdcaaacbcabaadcdccacacddcbdaaababbbcbccdbbdcbcaabdbcdabadcdcacdada"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": "AgICAQIAAQECAAIBAAEAAQACAgEAAgACAQIBAgAAAgE",
        "relays": [
          {
            "publicKey": "AgEAAgEBAQABAgECAAIAAAECAgAAAAECAQAAAgECAgA",
            "address": {
              "address": "ddddcabcadabdbcaccbbaadcdcdacabaddcaabccadddccbadcddbccdddddbccbcddabccdaaccbbdcbcbbbcacbdddcccbbaadaccdbaadbadbaabccdbcadcbcbbdbabbdcbdbccacaadbadddaccabdbcabaaccdcdcbddababcddcdaabcccddbdcbdcbbaacdccaacdddbacabdacabdadcdadacabbddcab"
            },
            "name": "@I"
          },
          {
            "publicKey": "AQEBAQIBAgIBAAIBAAABAgAAAAABAQECAAACAQIBAAI",
            "address": {
              "address": "dabbaadabbadadcabaccbbbabbdbbbcadccbbdabbbdddcbdcbbbdacddaccabcabaacaccbbbabcdddadcddabddcccbbcacbaacdcdabdcbcddadaadcdcaabbdcadacacccbbbcabcabcdacddaabcdaadbccdcccdabbadcbabdbcaaaaacccddcdcabbadbaaddbdddcaccdaabddbcacaaddbbaaccddbdddccbbaadcaacaad"
            },
            "name": "]"
          }
        ],
        "friends": {
          "AAEAAgIAAAABAQIAAgIBAQAAAAEAAAICAQABAgIAAAI": {
            "name": "",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": {
              "prefixHash": "AQAAAAACAgIAAgEBAAICAQIBAAEAAgACAAACAQIAAAE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgABAQAAAQIAAQIBAgEBAQACAQIAAQEAAgEAAQEAAgE",
                  "remotePublicKey": "AgIAAgICAQAAAgEAAAIAAgEBAAACAAACAAIAAgABAgI",
                  "balances": {}
                },
                "counters": {
                  "inconsistencyCounter": "2",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AAAAAgIAAQIAAQECAgIAAg",
              "newToken": "AgIAAgEBAAAAAgAAAAECAAICAAEAAgICAgAAAgICAAIBAAABAAEBAAIAAgIAAAIAAgIAAQAAAgEAAAABAAEBAA"
            },
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {},
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AQIBAAICAQABAgAAAQIBAgEBAgICAgABAQIBAQEBAgA": {
            "currency": "ddaaacbbd",
            "totalDestPayment": "2",
            "description": "",
            "isCommitted": true,
            "generation": "0"
          },
          "AQEBAgIBAAIBAQIBAAECAgIBAAICAgAAAgABAAACAQI": {
            "currency": "dcaacdabdcbad",
            "totalDestPayment": "2",
            "description": "U",
            "isCommitted": false,
            "generation": "0"
          }
        },
        "openPayments": {
          "AgIBAQIAAQIAAQICAgABAg": {
            "invoiceId": "AAIBAAIAAQEBAgACAQAAAQEAAAECAAIAAgICAgEBAAE",
            "currency": "b",
            "destPublicKey": "AQIAAQAAAAACAgECAAEBAQIBAgIBAAIBAAEAAgEBAAE",
            "destPayment": "2",
            "description": "ª",
            "generation": "0",
            "status": {
              "success": [
                {
                  "responseHash": "AAACAAIBAgAAAAAAAAICAgICAAECAQABAQEAAgICAgA",
                  "invoiceId": "AQEAAQEAAQICAgICAgICAgEAAQECAAEAAAABAQEAAAI",
                  "currency": {
                    "currency": "dccca"
                  },
                  "srcPlainLock": "AQEAAAABAgEAAgACAgIAAAAAAgAAAAAAAgIBAgEAAAI",
                  "destPlainLock": "AQEAAAICAQICAQECAgABAAEAAQEAAQABAQIAAQAAAQE",
                  "isComplete": true,
                  "destPayment": "2",
                  "totalDestPayment": "0",
                  "signature": "AQEAAAIBAAABAQEBAAECAgAAAQICAQIAAQEBAAEBAgEBAAIAAAAAAgABAQABAAIBAAEBAgEAAQAAAQIAAgIBAg"
                },
                "2",
                "AQAAAQIBAgAAAgICAQIAAg"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgECAQECAgEBAAIBAQIAAg"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "0",
      {
        "report": {
          "localPublicKey": "AAICAQECAgEAAAICAgAAAgAAAQIAAQICAAAAAQIAAgA",
          "indexServers": [
            {
              "publicKey": "AgACAQAAAAIBAQIBAQICAAAAAQECAQACAAEBAAACAQI",
              "address": {
                "address": "addaccdbabddccabadbdccacddbdaccdabadbddbcdaccaababdcbbdacabadbaadcdbddaaccdacadbdcbddadddcadccccabbdaacbccbcbdccbddbdbacaabaddbbaababbbacdbdbbbabddbabbdbadaddbbaccabcbcaaddbdababcddcdcbdcbdadbadcbdabddddbaaaabcabaccaacacdbb"
              },
              "name": "\u000b"
            },
            {
              "publicKey": "AgEAAAICAQEAAgACAgEBAAIAAAEBAgAAAQABAQIBAQA",
              "address": {
                "address": "caadcbcbaacadddddbccaabcccaacacccb"
              },
              "name": "w"
            }
          ],
          "optConnectedIndexServer": null,
          "relays": [
            {
              "publicKey": "AQEBAQIBAgAAAgEAAgIBAQEBAAICAgABAgAAAgIAAAI",
              "address": {
                "address": "dcbaabdabdaadaabdcdbabbdccdabcccadddbdcaddcaaddacdaabacababbccddacdaddcaacbadcabcadaabbaadabcccbdddaadacdccddacdacacdaccbbacaaadacdcdcddaadcbacdcdacabbbcaabdacabacdcbbddccdaaaddd"
              },
              "name": ""
            },
            {
              "publicKey": "AQAAAQABAgACAgEAAAICAQAAAQAAAQEBAgIAAAEBAAI",
              "address": {
                "address": "abccccacacdaaccdbcbcddbdacbdbaddbdaadddddcabcbdaddbaaadaddacddddb"
              },
              "name": "$"
            }
          ],
          "friends": {
            "AAIAAQACAgIBAgAAAAEBAQACAgACAgICAAECAAACAgE": {
              "name": "4",
              "currencyConfigs": {
                "bd": {
                  "rate": {
                    "mul": 1,
                    "add": 2
                  },
                  "remoteMaxDebt": "1",
                  "isOpen": false
                },
                "ccbbbdadbcbabcd": {
                  "rate": {
                    "mul": 0,
                    "add": 0
                  },
                  "remoteMaxDebt": "0",
                  "isOpen": false
                }
              },
              "optLastIncomingMoveToken": {
                "prefixHash": "AQAAAAAAAgECAgEAAgEAAgABAgAAAgIAAAIBAAEAAQI",
                "tokenInfo": {
                  "mc": {
                    "localPublicKey": "AgABAQIBAQIBAQAAAAICAgEBAgEBAQIAAAIAAgECAgE",
                    "remotePublicKey": "AQACAQECAAEBAAABAQICAAAAAAAAAgEBAQACAQICAQA",
                    "balances": {
                      "badbbbbaaadbc": {
                        "balance": "0",
                        "localPendingDebt": "2",
                        "remotePendingDebt": "2"
                      }
                    }
                  },
                  "counters": {
                    "inconsistencyCounter": "1",
                    "moveTokenCounter": "0"
                  }
                },
                "randNonce": "AgAAAAICAAEBAgIAAQABAA",
                "newToken": "AgABAAEAAgAAAgACAQECAAIBAQACAQACAgEAAAEBAAABAgIBAQECAgABAgEAAgACAgEAAgEAAQEAAgICAAEAAA"
              },
              "liveness": "offline",
              "channelStatus": {
                "inconsistent": {
                  "localResetTerms": {
                    "dacbcddaaadcd": "-2",
                    "dcaaccadb": "-2"
                  },
                  "optRemoteResetTerms": {
                    "resetToken": "AAECAgICAAECAgIBAQICAAABAgEBAQIBAAECAgIBAQICAAACAQECAAECAgAAAgAAAQIAAAEBAAIBAAEBAQIBAA",
                    "balanceForReset": {}
                  }
                }
              },
              "status": "enabled"
            },
            "AQECAgIAAgAAAAECAAIAAQECAQIBAQAAAAEBAgACAgI": {
              "name": "",
              "currencyConfigs": {
                "cbb": {
                  "rate": {
                    "mul": 1,
                    "add": 1
                  },
                  "remoteMaxDebt": "2",
                  "isOpen": true
                },
                "bdacbcabd": {
                  "rate": {
                    "mul": 2,
                    "add": 1
                  },
                  "remoteMaxDebt": "2",
                  "isOpen": false
                }
              },
              "optLastIncomingMoveToken": null,
              "liveness": "online",
              "channelStatus": {
                "consistent": {
                  "currencyReports": {
                    "ddbbcbacbd": {
                      "balance": "2",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "0"
                    },
                    "dcbacdcdabb": {
                      "balance": "-1",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "2"
                    }
                  }
                }
              },
              "status": "enabled"
            }
          },
          "openInvoices": {},
          "openPayments": {}
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": ">",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": false,
        "seller": true,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AgAAAQIAAgIAAgAAAQABAQACAAEAAgACAAEAAQACAAI",
        "indexServers": [
          {
            "publicKey": "AgECAgEAAgICAgACAAAAAgIAAgACAAEAAgIAAAABAAI",
            "address": {
              "address": "cbcdcaaacbacbbcaabdddbbbbbadcdbcddaacdcbadbdcdcacbdadbdbbbbaccacdbaadabababbbdccdbddabdbdbccdadcacdbcaacddbadccdcccdacdcaacdbc"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": "AQEAAgECAgABAgICAAECAgEAAAEAAgEBAgEBAgACAgA",
        "relays": [],
        "friends": {},
        "openInvoices": {
          "AQAAAAABAAEAAQECAAECAgECAAAAAQIAAAICAAECAQA": {
            "currency": "bbcadaadcb",
            "totalDestPayment": "1",
            "description": "",
            "isCommitted": true,
            "generation": "0"
          },
          "AgACAgABAAICAAEAAgECAQECAgAAAQACAAIBAAEAAAA": {
            "currency": "dcdcbbcbcdcabcb",
            "totalDestPayment": "0",
            "description": "Ꝣ⁇",
            "isCommitted": true,
            "generation": "1"
          }
        },
        "openPayments": {}
      }
    }
  }
}
''',
  r'''
{
  "ack": "AAACAAIBAAEBAQACAAABAQ"
}
''',
  r'''
{
  "ack": "AQEAAAACAgECAQACAQEBAQ"
}
''',
  r'''
{
  "ack": "AQIBAQEBAgEBAgEAAgIAAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "": {
        "mode": {
          "open": "0"
        },
        "isEnabled": true,
        "info": {
          "local": {
            "nodePublicKey": "AAICAQIBAgEBAQECAQICAgECAgICAAIBAgECAQEAAQA"
          }
        }
      },
      "C>": {
        "mode": "closed",
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AQICAgAAAgECAAAAAAIAAAIAAgICAQICAAEBAQIBAgA",
            "nodePublicKey": "AgIAAAIAAgAAAQACAAICAgABAQEAAgEBAgECAgABAgA",
            "nodeAddress": {
              "address": "cdccddcbbaaaabdddabacabdadadcacddcdbbbccddbcaacaadadabccbbbabadbbbbaccbbdddcbabacddbdbadcddabdaccabdaaadadccaaaaacdccbadbbcdad"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "`": {
        "mode": "closed",
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgIBAgABAgABAAICAQICAQEBAAABAAECAQACAAIBAgE",
            "nodePublicKey": "AAEBAAIBAgIBAQACAQECAQACAAABAAACAQABAAAAAgA",
            "nodeAddress": {
              "address": "bdacabaacacdbbbbbdbadaccbabcadbcaddaadacabbcaddbadbcddacaacbcbbbaacbabbddbbaddbbbccaacbbcbacdadabbbcddbacdabccdbdacbbbbacabca"
            }
          }
        }
      },
      "": {
        "mode": {
          "open": "1"
        },
        "isEnabled": false,
        "info": {
          "local": {
            "nodePublicKey": "AAIBAQIAAQABAgEBAgICAAEBAgEAAAEAAAECAgECAgA"
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgACAQAAAQACAAICAAEAAQ"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "paymentDone": {
          "paymentId": "AAEAAgEAAgICAAABAAAAAg",
          "status": {
            "failure": "AQIAAQECAQIBAAEBAQEAAg"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "t",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": false,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AgEAAgAAAgAAAAAAAAIAAAAAAgEAAgIBAgECAQECAQA",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAAAAAICAAICAgABAQECAAECAgACAgIAAgICAQIBAAE",
            "address": {
              "address": "abbcccacbdcdabcacaaacabaabcdcacadacbdbdcbbddcdbaccadcacabcaaacaacadabbbddccbdbdbcbbdbcbcdbaadaadcaabacdacadcddababbbaacdcacdcbbacdaabbbcbdbcbbbcdbdccbabdabcdacbcaaabdacdcdacaabddcabaadbcccdabbdcbbaadccbccbcbddabcacabacacdadcbcddbacbababcbdbbabca"
            },
            "name": "!!"
          },
          {
            "publicKey": "AAACAAABAQAAAQACAQABAgIAAQECAgIBAgIBAQEBAgE",
            "address": {
              "address": "ccbcdacbdacbdabdacbdacaccdccbaabadbadcdccddaacbdcccdcbbbbdcdaacbbabddaaabbadbddcbdbda"
            },
            "name": "盿O"
          }
        ],
        "friends": {
          "AAACAQEBAAACAAABAQABAQEAAAACAAACAgIBAAEAAQE": {
            "name": "",
            "currencyConfigs": {
              "aaadbdaac": {
                "rate": {
                  "mul": 0,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              },
              "cdcddccdabbaa": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {},
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          },
          "AAIAAQABAQEBAgIAAAEBAAACAAABAQIBAgECAgEBAQI": {
            "name": "3\r",
            "currencyConfigs": {
              "cbdbcabac": {
                "rate": {
                  "mul": 1,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              },
              "cacdaaccadbcb": {
                "rate": {
                  "mul": 0,
                  "add": 1
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AAACAQIAAAIAAAABAgEBAAABAAEAAgICAQECAAEAAgA",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgICAgEAAAICAAECAgICAgECAQICAgAAAAIBAgACAAI",
                  "remotePublicKey": "AAECAAIBAAICAAACAAECAAECAQAAAQICAQIAAAIBAQA",
                  "balances": {}
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AAACAQABAgABAAACAgECAg",
              "newToken": "AQEBAQABAQIAAAEBAgEAAAACAgAAAgABAgECAgEBAAIBAAABAAEAAgAAAgICAgACAAIBAQIBAAEBAgACAAIBAA"
            },
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {},
                "optRemoteResetTerms": {
                  "resetToken": "AQAAAQEBAAAAAAAAAgAAAQEAAQECAQACAgAAAAIBAgIAAQAAAgEBAQIAAQAAAgIBAgICAAICAAICAQAAAgACAg",
                  "balanceForReset": {
                    "dcdaccdabd": "-3"
                  }
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {},
        "openPayments": {
          "AQEAAQIBAgAAAgEAAgIAAg": {
            "invoiceId": "AgEBAAIBAQECAgEAAgACAQECAQEBAQECAAECAgIBAgE",
            "currency": "ccccbcadcbb",
            "destPublicKey": "AQABAQACAgIAAgIBAAIAAgEBAAIBAQABAQEAAQIBAAE",
            "destPayment": "0",
            "description": "",
            "generation": "2",
            "status": {
              "success": [
                {
                  "responseHash": "AQEBAQECAQECAgIBAAAAAQIAAgAAAQEBAAEBAgEBAAE",
                  "invoiceId": "AQAAAAECAgEBAgAAAgACAAECAgECAgACAQACAQIAAQI",
                  "currency": {
                    "currency": "bdd"
                  },
                  "srcPlainLock": "AgABAgIAAAEBAgAAAQEBAAACAgACAAEAAgICAAIAAQA",
                  "destPlainLock": "AQIBAgECAQAAAQICAAICAQAAAgIBAQICAgICAAABAAA",
                  "isComplete": true,
                  "destPayment": "2",
                  "totalDestPayment": "1",
                  "signature": "AQACAgECAQAAAQABAQECAAAAAAIAAgABAQECAQECAQACAgIAAQABAAECAAEAAAEAAQIAAAICAQIAAQICAAEAAA"
                },
                "2",
                "AQABAAIAAQECAQAAAAIAAQ"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "2",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": false,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AAAAAAIAAAABAAEBAgIBAAICAgECAAIAAAEAAgICAgA",
        "indexServers": [
          {
            "publicKey": "AQAAAAECAAEBAAABAgACAAACAQIBAQIBAQABAQACAAE",
            "address": {
              "address": "dbddabccaadbbabbbcabbdaaadbaccaabcdbbddabcbdcdcbbdbaaadbaccacdbbbbdcacb"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": "AAEAAQICAAICAgEAAQABAQEAAQEAAAIBAgAAAQIBAgE",
        "relays": [],
        "friends": {},
        "openInvoices": {},
        "openPayments": {
          "AgIBAgECAQIBAQIBAQACAA": {
            "invoiceId": "AQICAgABAgEAAAEAAgABAAAAAQEAAgIBAgAAAgAAAAI",
            "currency": "ddccccdbcd",
            "destPublicKey": "AgAAAAACAAEBAAAAAAACAgACAgECAQIBAgAAAAEAAgI",
            "destPayment": "0",
            "description": "",
            "generation": "1",
            "status": {
              "failure": "AQABAAICAgIAAAIAAgACAQ"
            }
          },
          "AAEBAQEAAQABAgAAAQICAA": {
            "invoiceId": "AQACAgABAQECAQIAAQEAAgEBAAECAgIAAQIAAgAAAAA",
            "currency": "ac",
            "destPublicKey": "AQICAQABAgICAQAAAQEBAgIAAQECAQAAAQAAAQEBAAI",
            "destPayment": "0",
            "description": "",
            "generation": "1",
            "status": {
              "failure": "AgAAAQACAQECAgAAAQEAAg"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AAECAgIBAgECAQICAgAAAA"
}
''',
  r'''
{
  "ack": "AAIBAAECAgEBAgIAAQABAQ"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "\u0005",
      "nodeId": "1",
      "appPermissions": {
        "routes": true,
        "buyer": false,
        "seller": true,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AQICAAICAgECAgICAAICAgIBAQACAQEAAgECAAIAAAA",
        "indexServers": [
          {
            "publicKey": "AQIBAQEAAgACAAIBAAAAAAECAgABAgICAQEAAgAAAgA",
            "address": {
              "address": "cadacbbcbacaaadadbbcbaaaccdcabcacdcaacacacdbbdcdccdadacdbaaacbdaccccaabbbababddbcbbcbabbbacbaaccccbadbcdcdabc"
            },
            "name": ""
          },
          {
            "publicKey": "AQEBAQEAAQICAQICAQABAQIBAQAAAQECAAIBAgECAQI",
            "address": {
              "address": "dddbbcaabaacaabddbbdbccbbccbabccbcdbccdccacbdadcadbadbaacccadaadadadddbcdcabdcbacdadacbdacaacbabbbcabdbadacabaacdaadadcbbdabccdabbabdddbdbbcbabaabbadddabcdbcccabdcaabdcabcdadacbddaacdbcaacbbadacaddaaabadbdacddacbaadabddcdbbdcddccbabddbdcd"
            },
            "name": "⚣"
          }
        ],
        "optConnectedIndexServer": "AgECAQICAgIBAQEAAgAAAAECAgICAAABAQAAAQAAAQE",
        "relays": [
          {
            "publicKey": "AAAAAQIBAQEAAgEAAQECAAIBAgIAAAABAAECAQIAAAA",
            "address": {
              "address": "babbccbacbdcdcdcbabcdcbdbdbaaaadadaaabacddbdcbbdacaddbcdccbaddbbaadadaaaabcbdbcdaadcccddaa"
            },
            "name": "\u001b"
          }
        ],
        "friends": {
          "AQECAgECAgIAAQEAAgACAQEBAgECAgABAAABAQABAgA": {
            "name": "",
            "currencyConfigs": {
              "bcaabbbabddacba": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              },
              "baabdbdbdbdbd": {
                "rate": {
                  "mul": 0,
                  "add": 1
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AQACAQAAAQEBAQEBAgIAAQABAgIBAgIBAAACAQIAAQE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAEAAQEAAQABAQICAgECAQECAQIBAAECAgECAQACAAA",
                  "remotePublicKey": "AgICAAACAgACAQECAAABAQECAgACAgEAAgACAAICAgA",
                  "balances": {
                    "cdcccddbc": {
                      "balance": "-3",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "1"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AgACAAIAAQEAAAABAQIBAg",
              "newToken": "AAEAAgICAQIAAgEAAgECAgIBAQAAAQAAAQICAgEBAAICAgECAgIAAgIAAAACAgACAQIAAgACAAEAAQECAgECAQ"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "bcdda": {
                    "balance": "-3",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "2"
                  },
                  "a": {
                    "balance": "1",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "0"
                  }
                }
              }
            },
            "status": "enabled"
          },
          "AAIAAgEBAQEAAgEBAgABAgACAAEBAgABAgIBAQIBAAE": {
            "name": " H",
            "currencyConfigs": {
              "b": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "2",
                "isOpen": false
              },
              "cbbb": {
                "rate": {
                  "mul": 2,
                  "add": 2
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "cccdacabd": "-1",
                  "acdac": "2"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AAIBAgECAgIBAAEAAgEAAgIBAgAAAAEBAgABAAABAgI": {
            "currency": "acab",
            "totalDestPayment": "1",
            "description": "ޕ",
            "isCommitted": false,
            "generation": "1"
          }
        },
        "openPayments": {}
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "0",
      "appPermissions": {
        "routes": false,
        "buyer": false,
        "seller": false,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AAECAgICAAECAAEBAQECAQAAAAIBAQACAAECAgIBAgI",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AQEAAQABAgABAAICAQAAAQIAAgEBAAEBAAIAAQICAQI",
            "address": {
              "address": "bcdababcbaabbabcaaccbbacaacbcbabddbbbaacdbcbdadabcbcbcdabdabacadddadabccdadacaabdbadcbcccadababcdacbcc"
            },
            "name": "9\u0010"
          },
          {
            "publicKey": "AgICAQEBAgEAAgICAQECAgACAAACAQACAQEBAQEBAQI",
            "address": {
              "address": "badcdbcacabadadcccaadbbdbacbcabcdcabcbdabcbbddbcacdbcbbadcdbdabdabccadccbabdbaabbacadcaaacbbadaabbbaabaaabadbbdcbbbddccccbadcddccdcccaababcadddcbdabdbcdabbdbbccdbbccbadaccdabdcbadacbaacbaaacadadacdbbcbaddcdbbdcdccbcbcdaacddadcbdcbbbddaadbb"
            },
            "name": "B"
          }
        ],
        "friends": {
          "AAIAAgECAgEAAgEAAAIBAAICAQEBAgACAAICAgEBAAA": {
            "name": "&",
            "currencyConfigs": {
              "abcbcd": {
                "rate": {
                  "mul": 0,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "bcdbbca": "1",
                  "dcbc": "-2"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AgIBAQACAAAAAQECAQEBAgACAQAAAQAAAAEBAAAAAAA": {
            "currency": "bbdabcb",
            "totalDestPayment": "0",
            "description": ">2",
            "isCommitted": false,
            "generation": "2"
          }
        },
        "openPayments": {
          "AgACAQIAAQAAAgEBAQEBAQ": {
            "invoiceId": "AAEAAgECAgABAAEAAAIBAQEBAQICAgECAAABAQIAAgA",
            "currency": "cdacdbbbcbc",
            "destPublicKey": "AgIBAAABAgIAAQACAQACAgABAAABAQEBAAEBAAIAAgE",
            "destPayment": "1",
            "description": "",
            "generation": "1",
            "status": {
              "searchingRoute": "AgIBAgICAQACAQEAAAICAg"
            }
          },
          "AAAAAAACAQEBAAECAQABAg": {
            "invoiceId": "AQABAAECAQEAAgACAQEBAAIBAgAAAAAAAgEBAQICAAA",
            "currency": "babdad",
            "destPublicKey": "AAEAAAABAQEAAQICAQACAgABAQIAAQACAgACAQEAAQE",
            "destPayment": "0",
            "description": "#^",
            "generation": "1",
            "status": {
              "sending": "1"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQIAAAIAAQIBAgIBAgECAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "|1",
      "nodeId": "0",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AAEBAgAAAQAAAQIBAgEAAgEBAAICAgEAAQIAAQIBAQI",
        "indexServers": [
          {
            "publicKey": "AgICAQIAAgABAAEBAAEBAQIAAAICAQECAQICAQIAAQI",
            "address": {
              "address": "bcbacddbdbbcbacbaccbddcacaaadbbbddaacdacacaadcdbaadabddcbbaccdaacbbbaabbcacdaaac"
            },
            "name": "Vt"
          }
        ],
        "optConnectedIndexServer": "AgECAQIAAQIAAgIBAQEAAgEBAQAAAgECAAABAgIBAQA",
        "relays": [
          {
            "publicKey": "AgEAAAACAQIAAAICAgAAAAICAQEAAgECAgEBAAEAAAI",
            "address": {
              "address": "dadcaabccadadbccbbcaccabddcacababcaadbaabacabbddadcabdbcbbcacaaccdcabcddcbaccdbcbadbcbbbb"
            },
            "name": "󜡜/"
          },
          {
            "publicKey": "AAACAgICAAEBAgICAAAAAgEAAgAAAAECAAICAAACAQE",
            "address": {
              "address": "dbacccddbabcdbdbcbacbbaccaabddabdbbabccaaaddcdadddadccbcacadbbbcaaccaacccdacacccccbcaadbbcacbadaabbddacbacabbcacdcacaacddadacdabdbcbadacacabddadbaaabbbcabbbaabbdbcadabadccdbccccbbaaacacacccabbacddbdadbaddcccaadacdabdcaadbbacbcccd"
            },
            "name": ""
          }
        ],
        "friends": {
          "AQACAQAAAAAAAAIAAQIBAAACAAEBAAAAAAABAQIAAgA": {
            "name": ")7",
            "currencyConfigs": {
              "ccdaa": {
                "rate": {
                  "mul": 1,
                  "add": 2
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "baadbddaddc": "1",
                  "bda": "-2"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AgECAAECAQEBAAABAgIBAgEBAQIBAgIBAAACAAEBAQICAQACAgICAgIAAAICAQECAAIBAAABAQEAAAABAgEAAQ",
                  "balanceForReset": {
                    "ddcccdacacbaa": "-3",
                    "acdccaccaccdbad": "-3"
                  }
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AAIAAAIAAgAAAAIBAQEAAQEBAQIAAAECAgAAAgECAAE": {
            "currency": "acddbadbd",
            "totalDestPayment": "1",
            "description": "<",
            "isCommitted": true,
            "generation": "1"
          },
          "AAECAAIAAQEBAAACAAECAAEBAAAAAAACAgEAAAIBAQI": {
            "currency": "cc",
            "totalDestPayment": "1",
            "description": "6¦",
            "isCommitted": false,
            "generation": "1"
          }
        },
        "openPayments": {
          "AgACAAACAAICAQEBAQACAA": {
            "invoiceId": "AAAAAAAAAgABAAACAQICAgIBAgAAAQIAAQABAgIAAQA",
            "currency": "dcdbadcb",
            "destPublicKey": "AQAAAgICAQIAAgACAAECAgAAAgECAAACAQAAAAIAAgI",
            "destPayment": "2",
            "description": "",
            "generation": "2",
            "status": {
              "foundRoute": [
                "AAACAQIBAQIBAQAAAAECAA",
                "0"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AgAAAgIBAgECAQEBAQABAQ"
}
''',
  r'''
{
  "ack": "AgEBAQIAAAABAAIAAgEAAA"
}
''',
  r'''
{
  "ack": "AgACAQIBAQEAAQIAAgECAg"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "e": {
        "mode": "closed",
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgEAAQAAAgABAgIAAQAAAQIBAgIAAgACAgAAAAAAAgA",
            "nodePublicKey": "AgACAQIBAQIAAQIAAAACAQEBAQEBAgICAgEBAAICAAA",
            "nodeAddress": {
              "address": "adcbdccabdcddbcaccbabddcaddbcbbbdbccccbdabcbcbcdcdabc"
            }
          }
        }
      },
      "": {
        "mode": {
          "open": "0"
        },
        "isEnabled": false,
        "info": {
          "local": {
            "nodePublicKey": "AQACAAAAAgICAQIBAAIBAQACAgIBAAECAQACAQEBAAA"
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AAEBAQAAAgIBAQEAAgAAAg"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": ",w",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": true,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AQEBAgIBAgEAAQEAAQIAAAEBAgAAAgIBAgICAAECAAI",
        "indexServers": [],
        "optConnectedIndexServer": "AgABAQECAQECAgIAAAABAAICAQEBAAAAAgABAgICAQA",
        "relays": [
          {
            "publicKey": "AgECAAECAAIAAQEAAAABAQIAAgICAgICAQICAAEBAQE",
            "address": {
              "address": "ddaadcaaccadaabbccdabbdaacddaccbabdaba"
            },
            "name": ""
          }
        ],
        "friends": {
          "AAEBAAEBAQEAAAEAAQABAQICAQEBAQEBAQEAAAECAQA": {
            "name": "煺",
            "currencyConfigs": {
              "dcdadbbcdcd": {
                "rate": {
                  "mul": 2,
                  "add": 0
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              },
              "dbba": {
                "rate": {
                  "mul": 2,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "abda": {
                    "balance": "-2",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "1"
                  }
                }
              }
            },
            "status": "enabled"
          },
          "AQECAAECAgECAQABAQEAAAICAQICAAACAgIAAAAAAQE": {
            "name": "",
            "currencyConfigs": {
              "c": {
                "rate": {
                  "mul": 1,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AgECAAIAAQEBAgEAAAEAAAAAAgIAAgIBAgEAAgEAAgA",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AQABAgECAQECAAICAQECAAIBAAABAQEBAAEBAQAAAgA",
                  "remotePublicKey": "AAAAAAAAAgIAAQIBAAIAAQACAQECAQACAAEBAQICAQI",
                  "balances": {
                    "abdbbdaabdcccb": {
                      "balance": "-2",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "0"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AQAAAgACAQIBAAEAAAEBAg",
              "newToken": "AQAAAQEBAQEAAQEAAQEAAgACAAABAAAAAgEAAAAAAgIAAQABAAICAAAAAQIBAAABAAACAQAAAAIBAAICAAACAQ"
            },
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "bcdacaaacbcd": "-1"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AQIBAAIAAgIAAQEBAgEBAAABAgEAAQACAAAAAgECAAEBAQICAQIAAAEAAgICAgECAgACAQECAgECAgECAAACAg",
                  "balanceForReset": {
                    "acabbaab": "0",
                    "bccddbbaddcb": "-1"
                  }
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AgABAQIBAQIAAQEAAQECAQABAQEAAQACAQEBAAICAQA": {
            "currency": "bddbdcbcdbdc",
            "totalDestPayment": "2",
            "description": "\t؃",
            "isCommitted": false,
            "generation": "1"
          }
        },
        "openPayments": {
          "AQAAAAAAAAABAAACAAEBAQ": {
            "invoiceId": "AQIBAgAAAQACAAIBAQACAAEBAQICAQAAAgICAgIAAQE",
            "currency": "baccc",
            "destPublicKey": "AgABAAEBAQEAAAICAAEAAQABAAEBAQIAAAEBAAIAAAI",
            "destPayment": "0",
            "description": "g",
            "generation": "1",
            "status": {
              "foundRoute": [
                "AgECAAEAAQACAQACAgICAQ",
                "1"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "1",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AAICAAIBAAAAAQIBAQAAAgABAgICAgAAAQABAAEAAQE",
        "indexServers": [
          {
            "publicKey": "AQEBAAEAAQACAgAAAAABAgABAQIAAgIAAgACAgIBAgE",
            "address": {
              "address": "cddaddbcdccbdbacdaddcbaccbacbcdbdcdbd"
            },
            "name": "멥L"
          }
        ],
        "optConnectedIndexServer": "AgAAAQIBAgECAgICAgEBAAACAAIAAAABAAAAAQEAAAA",
        "relays": [],
        "friends": {
          "AQEAAgIAAAACAQIBAgIBAQEBAQAAAgEAAQIAAgEBAQE": {
            "name": "Ry",
            "currencyConfigs": {
              "bcabad": {
                "rate": {
                  "mul": 2,
                  "add": 2
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              },
              "dcddaddda": {
                "rate": {
                  "mul": 1,
                  "add": 2
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {},
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AQAAAAIBAgABAQIBAgABAQECAgAAAgICAAABAgIAAgA": {
            "currency": "aaaba",
            "totalDestPayment": "1",
            "description": "￴",
            "isCommitted": false,
            "generation": "2"
          }
        },
        "openPayments": {
          "AgIBAAABAAACAAIAAAAAAg": {
            "invoiceId": "AQECAgABAgIAAgEBAAIBAgACAgICAgAAAAACAgICAAE",
            "currency": "dcacb",
            "destPublicKey": "AQAAAQECAAABAAICAAICAAICAAEBAgIBAgACAAEBAgI",
            "destPayment": "1",
            "description": "Π",
            "generation": "2",
            "status": {
              "foundRoute": [
                "AgECAAEBAgACAAEAAAACAg",
                "0"
              ]
            }
          },
          "AAEAAgEBAAEBAQICAQEBAA": {
            "invoiceId": "AQEAAAABAgECAQIAAAICAQAAAQACAAECAAIBAAIBAAA",
            "currency": "bcccdccadbab",
            "destPublicKey": "AQACAAEBAAICAAEBAAICAQEBAQEBAQICAAIAAgACAQE",
            "destPayment": "0",
            "description": "",
            "generation": "0",
            "status": {
              "success": [
                {
                  "responseHash": "AQEAAgIBAgEAAAIBAAICAQEAAQABAQICAQIBAgACAgA",
                  "invoiceId": "AQICAQECAQICAAAAAgECAQIBAgEBAQEAAAIBAAIBAAI",
                  "currency": {
                    "currency": "caacb"
                  },
                  "srcPlainLock": "AQIBAAICAgAAAQEBAAIAAgABAAEBAAACAAIBAgEAAAA",
                  "destPlainLock": "AgEBAQICAQEBAgACAQACAgIBAAABAQECAQECAgIAAQA",
                  "isComplete": false,
                  "destPayment": "1",
                  "totalDestPayment": "2",
                  "signature": "AQEAAQEBAQIAAgEAAAICAQIBAAIAAQABAQECAQEAAgEBAgABAgECAQEAAgICAAABAAECAQEAAgABAQEBAgECAg"
                },
                "1",
                "AAACAQEBAAIBAQEAAgACAg"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "0",
      "appPermissions": {
        "routes": true,
        "buyer": false,
        "seller": true,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AgACAQACAAEBAQECAQEBAAIBAAIBAgAAAQACAAAAAgE",
        "indexServers": [
          {
            "publicKey": "AgACAAIBAAIAAgICAgIAAQICAQACAAECAQICAQIAAQA",
            "address": {
              "address": "dccabcdccddbdcbbbccaddacbbbadccacdbacbabbccbccbbbddbbbcdbddbadcaabcaccbbddddccdccacddcabcbccaabcabccaabdbaaabbdabbadaacbbdcacbbbdcdabcbaacccacdabcbcaddacaaaadddccbdcbc"
            },
            "name": "®\u000e"
          },
          {
            "publicKey": "AQEBAAIAAQABAgICAAABAgECAAIAAgIAAQACAQECAgA",
            "address": {
              "address": "dcdddbdacaabacccaccccbdbbaabbdcabcdddccdbaaddbadbddcdabbabddaaacbbdcabcaaadcdddadadcdbdbcadadbdbdbbcabaccddcabddaadabacacadcbabdcdd"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAABAgABAQAAAAAAAgEBAgEAAAIBAgACAQACAgABAQA",
            "address": {
              "address": "bbbbbdcccbbbcbbbacbaaaddabcbcbbcdbcdbbbaaaabbdcdacbbdbaaacdcbdacbacdbcdadccbdacbcccddcaadccd"
            },
            "name": ""
          }
        ],
        "friends": {
          "AAIBAQICAAIBAgACAAECAAACAQECAgEBAAEAAgEAAAE": {
            "name": "",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "daddcbdabca": {
                    "balance": "1",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "1"
                  },
                  "aaaca": {
                    "balance": "-3",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "2"
                  }
                }
              }
            },
            "status": "enabled"
          },
          "AQEBAgEBAQEBAAIAAgABAgABAQECAQICAAEAAgECAQE": {
            "name": "",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": {
              "prefixHash": "AAABAQECAgEAAgACAAEBAAIAAAABAgIAAQEBAgABAQE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAEBAgEAAAEBAgIBAAACAAABAQACAgIAAQEAAgECAAA",
                  "remotePublicKey": "AgICAQICAAIBAQABAQEBAAEBAgAAAAECAgAAAgIAAAI",
                  "balances": {}
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AgEAAgEBAQECAAIAAgEBAA",
              "newToken": "AgIAAAIBAgEBAQAAAgECAQIAAAICAQABAAICAgECAgIBAgECAgEBAgIBAQABAAECAgEAAgAAAQICAQAAAgABAA"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "cbadc": {
                    "balance": "2",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "0"
                  }
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AgACAgEAAQEBAQIBAQACAgAAAAIBAAECAgEBAgABAAE": {
            "currency": "cddcd",
            "totalDestPayment": "2",
            "description": "",
            "isCommitted": false,
            "generation": "2"
          },
          "AAEBAQEAAQEBAQAAAgABAQABAQEAAgIAAgACAgIBAgA": {
            "currency": "bbbcca",
            "totalDestPayment": "1",
            "description": "泀.",
            "isCommitted": false,
            "generation": "0"
          }
        },
        "openPayments": {}
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {}
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": ")",
      "nodeId": "0",
      "appPermissions": {
        "routes": true,
        "buyer": false,
        "seller": false,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AAAAAAABAQAAAQICAQACAQIAAAIBAQEAAQAAAgABAAE",
        "indexServers": [
          {
            "publicKey": "AAABAQIAAgIBAQICAAECAAEBAQEAAgICAQABAQAAAgE",
            "address": {
              "address": "cccadbccabdcadbcdcdaaaacdacbadbadaaddbdcdccabbddbbaddbbbbabcddabadaddbccabbcabbbabdcabadcabcaacbcaddbbdacbcccbbaaaadcadbadccabcdbdcabadcacccdbbcbcdcbadaacaabacbcabaaadccdbcbbbbdbaccdacdccccccccaddabdcabaddabcdabccacabdacbdccadcdac"
            },
            "name": "‰"
          },
          {
            "publicKey": "AgAAAgEAAQACAAIAAgEBAQABAAACAQEAAgACAAABAAI",
            "address": {
              "address": "ccdacadcbbcaccdaadccbddbdacbadbdbdaabbdbcacaabddaadcabaddbbacacbddabdbbdccccbdbdccbcbdadddaa"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {
          "AQECAgIAAQEAAQECAQABAgECAQEAAgEBAgICAQEBAQI": {
            "name": "",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "cdbacada": "0"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AAABAAEBAgACAQIAAAAAAQEAAAIBAgACAQIAAAABAQE": {
            "currency": "cacadd",
            "totalDestPayment": "0",
            "description": "",
            "isCommitted": true,
            "generation": "1"
          }
        },
        "openPayments": {
          "AgICAAIAAgICAAACAQIBAA": {
            "invoiceId": "AgECAQEAAAICAgABAQICAQECAQACAgEAAAEAAAECAQI",
            "currency": "bdd",
            "destPublicKey": "AgEBAgIBAgACAgEAAQABAgABAAAAAgEBAgECAgIAAQE",
            "destPayment": "2",
            "description": "",
            "generation": "1",
            "status": {
              "success": [
                {
                  "responseHash": "AgEBAAIAAAAAAgABAQICAQAAAgEBAAAAAgEBAQEBAAA",
                  "invoiceId": "AgIBAQEAAAICAQABAAABAgIBAQABAQABAQACAAEBAQE",
                  "currency": {
                    "currency": "bbcbbbbbccd"
                  },
                  "srcPlainLock": "AQIBAAEAAAICAAECAgABAQEBAgIAAgACAAIAAQABAgA",
                  "destPlainLock": "AAIBAgIBAQABAgACAAIBAgEBAgICAgICAgICAAEBAgA",
                  "isComplete": false,
                  "destPayment": "1",
                  "totalDestPayment": "2",
                  "signature": "AgECAAECAQIAAQIBAAIAAQABAAAAAQECAAABAQEAAQAAAgACAgACAgIBAQECAQEBAAEAAgEBAAIBAgEBAgEBAg"
                },
                "0",
                "AQIBAQAAAQICAAECAgECAg"
              ]
            }
          },
          "AgEBAgIAAgEAAAIAAgEAAQ": {
            "invoiceId": "AAABAQAAAQECAgIAAgIBAgAAAQEBAgECAQIBAgEAAgI",
            "currency": "cdcab",
            "destPublicKey": "AgABAQIAAQIAAAEBAQIAAgABAQEBAQEBAgECAQIAAgE",
            "destPayment": "0",
            "description": "",
            "generation": "0",
            "status": {
              "failure": "AAACAgEBAgIBAQECAAIAAA"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentFees": {
          "paymentId": "AgACAAABAQECAQIBAAEBAA",
          "response": "unreachable"
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AQICAgECAQIAAAEAAQICAQ"
}
''',
  r'''
{
  "ack": "AAECAgAAAAIAAgABAgECAg"
}
''',
  r'''
{
  "ack": "AQICAQACAQACAgACAQIBAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "": {
        "mode": {
          "open": "0"
        },
        "isEnabled": true,
        "info": {
          "remote": {
            "appPublicKey": "AgAAAQEBAgACAQACAAECAQAAAgEAAQABAgABAQEBAQA",
            "nodePublicKey": "AgEBAgICAgACAQAAAQICAAECAQECAgIBAAAAAgICAgE",
            "nodeAddress": {
              "address": "cbcddbbcdaaadddbbdcdccdbdcdbcababbcbaddccbaadacacccdcdddcaabaadaaabaaaabcbbbcbaabbbdbaccacacccdadbbdcaaaccbbbbadabbccbcacddaabcacdaabacbcccacacdaadcdddcadcbcabcddbcdbbcdaaabcddddccad"
            }
          }
        }
      },
      "￿\u0017": {
        "mode": {
          "open": "1"
        },
        "isEnabled": false,
        "info": {
          "remote": {
            "appPublicKey": "AQICAgIBAAECAQICAQICAgIAAQICAgEBAgECAAIAAAA",
            "nodePublicKey": "AAIAAgABAgABAQAAAgECAAECAgEAAAECAQIBAQAAAQE",
            "nodeAddress": {
              "address": "acabbbabcadbaaadbccadaddccdcdadaacdbdbcacdddbadddadbadcbddacacdbdbbddcdbabaddaadbdaabadddbbcadccbaddddcdaacadbbbbcbacbcabacdcbcbdcbbddcabaddcbccddaaccaadcadcadbbdbddbcbacccacdddcbcdccdacbdccbbacdbacc"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "F⣱",
      "nodeId": "0",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": true,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AAECAAIBAQEAAQAAAgEAAAIAAgIAAAICAgAAAgEBAgA",
        "indexServers": [
          {
            "publicKey": "AQEAAgACAAIBAgEAAQIAAQECAQEAAgECAAAAAgECAAA",
            "address": {
              "address": "aadcbddcbdbdcbcabadbcbdddcbdbccacbabbbcadabbbddaccdccdcdddadbaddbdacdbaddcbcbdaabbcbbcccbcaabcdacbbbbddbdddbadacdcdbaddcababddbcdccdabddaaddcaaadb"
            },
            "name": "󟸖"
          },
          {
            "publicKey": "AgABAAACAQABAQEAAQEBAgIAAQEAAAACAgIBAgEBAQA",
            "address": {
              "address": "cbbdbaddbcbdddcdcbccdddaddadbababadcdcbdcdcacbdaadcccbdaadcabddadbaddcaccaabcdcaaaccdcbbbbbdadadcdadcdbbcdaabcadbbabdcababbaaaddadaddbbacadcbaacbddcbabaccdcd"
            },
            "name": "z"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {
          "AQEBAQIBAAAAAgABAgABAAAAAQACAAIBAgEBAAIAAAA": {
            "name": "{",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": {
              "prefixHash": "AAIBAAICAgAAAQEAAQICAQABAAABAAIAAAICAgICAAI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAIBAAAAAQAAAQEAAAIAAgEAAgIBAgACAAACAAECAAI",
                  "remotePublicKey": "AQICAgIBAAAAAAEBAAIAAgACAAEBAgEBAQICAAEAAQA",
                  "balances": {
                    "bdaa": {
                      "balance": "2",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "1"
                    },
                    "cb": {
                      "balance": "0",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "0"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "2",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AAAAAgIBAAECAAEAAAECAA",
              "newToken": "AQECAQIAAgICAgECAgECAgICAgIAAAIAAQECAQEBAAACAgABAAIBAQEBAAACAQEAAQEBAgECAQIBAQACAAAAAg"
            },
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "adccdacdccab": "-2",
                  "db": "-1"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AgECAQABAQEBAgACAgICAAAAAgABAgICAQECAgABAAA": {
            "currency": "cababdadaadc",
            "totalDestPayment": "1",
            "description": "_",
            "isCommitted": true,
            "generation": "2"
          },
          "AgACAgIAAAAAAAICAAABAAIBAAECAAECAgABAgICAgI": {
            "currency": "dbbdbbaaa",
            "totalDestPayment": "1",
            "description": "\u000b?",
            "isCommitted": true,
            "generation": "1"
          }
        },
        "openPayments": {
          "AQECAgIAAQIBAgABAQEAAA": {
            "invoiceId": "AgIAAAACAgICAQAAAQEAAgIBAAECAAEAAQICAgEAAQI",
            "currency": "dcbdbccadccdba",
            "destPublicKey": "AAICAAABAQABAAACAQAAAAACAQACAQABAgICAgABAAA",
            "destPayment": "2",
            "description": "9",
            "generation": "0",
            "status": {
              "foundRoute": [
                "AAEAAgAAAAEBAgACAQABAQ",
                "1"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQEBAQICAAICAAEAAQIBAA"
}
''',
  r'''
{
  "ack": "AQICAAABAAECAQEBAgEAAg"
}
''',
  r'''
{
  "ack": "AgICAAAAAQECAgIAAgICAQ"
}
''',
  r'''
{
  "ack": "AgIAAAIBAgIAAQIAAQICAg"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "1",
      {
        "paymentFees": {
          "paymentId": "AQACAAABAgACAAECAAICAg",
          "response": {
            "fees": [
              "2",
              "AgAAAgECAgAAAQEAAAABAA"
            ]
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AQEAAQEBAAABAQAAAgABAQ"
}
''',
  r'''
{
  "ack": "AAEBAQEAAQEAAQICAgECAQ"
}
''',
  r'''
{
  "ack": "AAEAAgEBAAECAgABAQIAAA"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "2",
      {
        "paymentDone": {
          "paymentId": "AAACAAEBAAECAAACAAACAg",
          "status": {
            "failure": "AAECAAECAAEAAQACAQIAAg"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "6",
      "nodeId": "0",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": false,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AgEAAgIBAgEAAgEAAAEBAQEAAAACAAEBAQIAAQAAAgA",
        "indexServers": [
          {
            "publicKey": "AQABAgICAgICAQIAAAIAAAIBAAACAQIBAgIAAQACAgE",
            "address": {
              "address": "bbaacadcaccdbccbccdbbcdbcdabdabcbbdbdcccaaadbbacdcccbdbcdbbddaaaabccaaaaadccabddabdbbbcccabccabddabccdadaabaddbcbbbbaacdbcdbdddbdcdcabcbdacabcbbacbadabcdbdbabaaaccabbddcbabadbacbdacbcacdbb"
            },
            "name": "9"
          },
          {
            "publicKey": "AgECAQABAAICAgEBAQEBAgIAAgEBAgIAAgABAAABAgA",
            "address": {
              "address": "abbadaaccacbbbdbcdccbababbddcdabbcad"
            },
            "name": ":⽅"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAACAgEAAQICAQABAQICAAIBAgAAAQIBAgEBAgABAgA",
            "address": {
              "address": "dadabbccadcdcadacabcddacacdcbbcdbdbcdbbdaacdaaccbaddbabbbddccdbacdccdbadbacadbcbabdbbbcaadadcacacbcddbcbbbbcddcbcbabacddbbcdcddddbadbaccbdbbbbbabbaacbbcdadacbcbbabd"
            },
            "name": ""
          }
        ],
        "friends": {},
        "openInvoices": {},
        "openPayments": {
          "AAIAAgACAQECAgEAAQECAg": {
            "invoiceId": "AQIAAAIBAgEBAAEBAAIAAAEBAQACAQAAAgEAAAIBAQA",
            "currency": "dcbcd",
            "destPublicKey": "AAIBAAEBAAECAgEAAQACAQABAQICAAACAQEBAgAAAQE",
            "destPayment": "2",
            "description": ">",
            "generation": "2",
            "status": {
              "commit": [
                {
                  "responseHash": "AAABAgACAQEAAAEBAAICAQIBAQECAAICAQIAAgECAQI",
                  "srcPlainLock": "AQEBAAEAAAIAAAEAAAIBAQICAAICAQEBAQABAQABAgE",
                  "destHashedLock": "AQEBAAECAAECAgIAAQIBAgEBAgACAAIBAQEAAQICAAE",
                  "destPayment": "2",
                  "totalDestPayment": "2",
                  "invoiceId": "AQIAAgEBAgEBAAECAQEAAAABAAABAAIBAQEAAAECAAA",
                  "currency": "b",
                  "signature": "AAABAQACAgABAAIAAAIBAAICAAEBAgACAAICAQABAQABAAACAAAAAgECAAECAQAAAAACAgACAAEBAAECAAECAQ"
                },
                "2"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodesStatus": {
      "․": {
        "mode": {
          "open": "0"
        },
        "isEnabled": true,
        "info": {
          "local": {
            "nodePublicKey": "AAEAAQIBAAAAAAEBAAICAgIAAQEBAAICAQICAAEBAAE"
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "",
      "nodeId": "1",
      "appPermissions": {
        "routes": true,
        "buyer": true,
        "seller": true,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AQIAAAIBAQEAAQECAQIBAgICAQEBAgAAAAABAQABAgA",
        "indexServers": [],
        "optConnectedIndexServer": "AgAAAAIAAgABAgIBAAABAQEAAAEBAgEBAQIBAgABAgE",
        "relays": [
          {
            "publicKey": "AAEAAAICAgECAgIBAgECAgEBAgIAAgABAAECAQAAAQI",
            "address": {
              "address": "cacabdcbd"
            },
            "name": ""
          }
        ],
        "friends": {},
        "openInvoices": {
          "AAICAAEAAAEAAQIBAgABAAAAAgIAAgABAQEAAAAAAgI": {
            "currency": "db",
            "totalDestPayment": "0",
            "description": "\u0015",
            "isCommitted": true,
            "generation": "1"
          }
        },
        "openPayments": {
          "AAEBAQICAgEAAgEAAQECAQ": {
            "invoiceId": "AgIBAQEAAgIBAAAAAQICAAIBAgEBAAEBAgABAQIAAgA",
            "currency": "dabd",
            "destPublicKey": "AgIAAQACAgAAAQEAAAIBAgEBAgEBAgEAAQIAAAIBAgE",
            "destPayment": "0",
            "description": "",
            "generation": "1",
            "status": {
              "commit": [
                {
                  "responseHash": "AgEBAQEAAQIAAgAAAgABAQAAAAEAAgABAAABAQACAQI",
                  "srcPlainLock": "AQAAAgIBAAAAAQEAAgABAgECAAIBAQIBAgEBAgEAAAE",
                  "destHashedLock": "AgICAQABAgECAAEAAAECAQACAAIAAgAAAQIBAgAAAgA",
                  "destPayment": "2",
                  "totalDestPayment": "2",
                  "invoiceId": "AgICAAIAAgAAAQEAAQEBAgIAAAIAAQEBAQAAAAAAAQA",
                  "currency": "bbbaddcabacabaa",
                  "signature": "AgEAAgEAAQIBAgIBAgAAAAACAAEBAgABAgEAAgAAAQEBAAABAAEAAgIBAgAAAgAAAAEAAAAAAAICAAIAAgIBAA"
                },
                "0"
              ]
            }
          },
          "AgEAAAACAgABAgIBAQAAAA": {
            "invoiceId": "AAAAAAACAQIBAQIBAAIAAQABAQIAAgICAAICAAABAAI",
            "currency": "ddcdbcbdb",
            "destPublicKey": "AQABAAIBAAAAAAEBAQIBAgABAgECAAAAAAAAAQIBAgA",
            "destPayment": "0",
            "description": "7",
            "generation": "0",
            "status": {
              "searchingRoute": "AAEBAgIBAQICAQECAAEBAA"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQACAAAAAgICAgICAQICAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "3𪆭",
      "nodeId": "2",
      "appPermissions": {
        "routes": false,
        "buyer": false,
        "seller": false,
        "config": false
      },
      "compactReport": {
        "localPublicKey": "AQABAgAAAgECAgEBAgECAQAAAAACAQIBAQIBAQAAAQA",
        "indexServers": [
          {
            "publicKey": "AQIAAAIBAAEAAQIAAQIBAAAAAAEBAgIBAQICAQICAgI",
            "address": {
              "address": "bbddcbaacbddaccddbbacccccdcababadbbacbcdabbbadcabcaccaacbbcaddacdadbdadbcdbdcaddbadcbdcabdccaabcdbcbddacbadccdaaadddabbcccbcacbadcbddbcaacacadcabadbacbcd"
            },
            "name": "񭲙"
          },
          {
            "publicKey": "AAEAAQIAAgICAAIBAgIBAgABAgACAAICAAACAAEBAAE",
            "address": {
              "address": "cdcaacccadbaadbbaabcdbacacadbacca"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": "AAECAgABAgECAQACAgIBAgACAAACAgAAAAAAAQABAAE",
        "relays": [
          {
            "publicKey": "AgABAgACAAEAAgABAAEAAAAAAQICAQAAAAEAAAACAQE",
            "address": {
              "address": "baaacdccdcadbbaccdcabbdaaadaabacdbbbabbbcacdcddbcbbcbacabcccdaaadcdcbcdadabdddacdccbadaabddbcbabbbcddcdaddaddbdacdbbbbdbdadcbcbdc"
            },
            "name": "."
          },
          {
            "publicKey": "AgECAQEBAAABAgIAAQEAAgAAAgABAAABAgICAAACAAE",
            "address": {
              "address": "acddaccdbcdbaddbaaddabcbacabdacadaccabacdddbdbaadbbcaadabbccdcbadbaabcbadabdcbadbaadcbddaabadcddcdab"
            },
            "name": "0⁛"
          }
        ],
        "friends": {
          "AQEAAAEBAgIAAgECAAACAAIAAQEAAAACAAACAgEBAQA": {
            "name": "",
            "currencyConfigs": {
              "accaccdabbab": {
                "rate": {
                  "mul": 1,
                  "add": 0
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AAACAAAAAQABAAAAAgIBAgACAgAAAAECAgEBAQABAQE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgIBAgIAAQAAAQABAAEAAgEAAgABAAECAQICAQICAAA",
                  "remotePublicKey": "AgAAAQIBAQEBAAEBAgEAAgABAgAAAQIAAgAAAQEBAgA",
                  "balances": {}
                },
                "counters": {
                  "inconsistencyCounter": "2",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AQACAAEAAgIAAgIBAQAAAg",
              "newToken": "AQAAAgICAgACAAEAAgACAgACAgECAgAAAQACAQECAAECAQECAgIBAAICAgICAgIAAQEAAAEBAQIBAQEAAgIBAQ"
            },
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {}
              }
            },
            "status": "enabled"
          },
          "AQAAAgABAgEAAAABAQIBAgICAgAAAAACAgIAAgEBAQA": {
            "name": "ꁕ򓣠",
            "currencyConfigs": {
              "cccaabdccacbadb": {
                "rate": {
                  "mul": 0,
                  "add": 0
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              },
              "dbadbadd": {
                "rate": {
                  "mul": 1,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AAEAAQABAgABAQEBAQABAQEAAAIAAQACAAICAgECAQE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAACAgECAgICAgACAgACAAABAQAAAgEAAgECAgIBAgE",
                  "remotePublicKey": "AAICAQIAAgACAAACAAAAAAAAAAIBAQICAQICAQIAAAI",
                  "balances": {
                    "c": {
                      "balance": "0",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "1"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AAIAAQICAgECAgIBAgECAQ",
              "newToken": "AAABAAABAAACAQICAQICAQABAAEAAAACAQAAAAICAAIAAAICAAACAQACAAECAQICAAABAQEBAAAAAQAAAQACAA"
            },
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "dbaab": "0"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AAECAgABAgABAAEAAAICAQIAAAICAQEAAAEBAgIAAgA": {
            "currency": "cadccbaccdd",
            "totalDestPayment": "2",
            "description": "螀⁇",
            "isCommitted": false,
            "generation": "1"
          }
        },
        "openPayments": {
          "AgIBAAAAAQEAAgAAAgIBAQ": {
            "invoiceId": "AQAAAQABAQEAAQAAAAEAAgABAgECAQEAAAIAAgAAAAI",
            "currency": "dbdbbdbbbcb",
            "destPublicKey": "AAIBAgACAQEAAAICAAECAQAAAgEAAgIAAQABAQECAQA",
            "destPayment": "1",
            "description": "⁥",
            "generation": "0",
            "status": {
              "failure": "AQECAgAAAgABAQECAgAAAg"
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQABAAEAAAEBAAECAgAAAg"
}
''',
  r'''
{
  "ack": "AAECAAEAAQICAQACAQAAAQ"
}
''',
  r'''
{
  "ack": "AgIBAQEBAQACAQECAgEAAA"
}
''',
  r'''
{
  "serverToUser": {
    "nodeOpened": {
      "nodeName": "w؂",
      "nodeId": "0",
      "appPermissions": {
        "routes": true,
        "buyer": false,
        "seller": false,
        "config": true
      },
      "compactReport": {
        "localPublicKey": "AQIBAQEAAAEBAgAAAAEBAgAAAgEBAgIAAAACAQEAAQE",
        "indexServers": [
          {
            "publicKey": "AgICAQABAQACAgIAAgECAgABAQIAAgACAgEAAQACAQE",
            "address": {
              "address": "abccbdcaddddcdabdcabcbadaadcabbdbacbdbaaaddaddaaadbabcabacccdbcbccacaddbdbabdbaddccbcbadaccdbcddaddbcbdadcdccabaccbccacccccaccdaabaddbcbadcdadccbaddadbabacdbabbdbbabbcbcddbcabacadbdabaddd"
            },
            "name": "!"
          }
        ],
        "optConnectedIndexServer": "AAAAAgIBAgAAAgICAgACAAIAAAACAAIAAAAAAQICAgI",
        "relays": [
          {
            "publicKey": "AQECAQICAAICAAACAAEBAgECAAICAAAAAAABAgICAAI",
            "address": {
              "address": "dbdabaaabbbdabbaccacacc"
            },
            "name": ""
          }
        ],
        "friends": {
          "AgEBAAAAAgAAAAIBAQIAAAIAAQEAAAECAAIBAAEAAQI": {
            "name": "q£",
            "currencyConfigs": {
              "bdacb": {
                "rate": {
                  "mul": 0,
                  "add": 0
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              },
              "babbbabadbcada": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AgIBAgICAQIBAQIAAQAAAgEBAQACAAECAQABAQABAgI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AQEBAgIAAQIBAAIBAAAAAAIAAgIAAgACAAEBAgEBAgI",
                  "remotePublicKey": "AgEBAAIBAQAAAgIBAQIBAQEBAAICAQIAAQEBAAACAQI",
                  "balances": {
                    "daacbdcbdcdbca": {
                      "balance": "-1",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "1"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AQABAQECAgECAQIAAQEBAg",
              "newToken": "AgACAAEBAgICAAEBAgICAAEBAQIAAQECAAACAgACAgIBAQEAAQIAAAICAgICAgEBAgECAAECAQIAAQACAgABAA"
            },
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "cdaddadcaca": {
                    "balance": "-3",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "1"
                  }
                }
              }
            },
            "status": "disabled"
          },
          "AgIBAQEAAQEBAgEAAgIBAgIAAgICAAIAAAIAAAABAAE": {
            "name": "\u001f",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": {
              "prefixHash": "AQEAAAEAAQAAAQICAQIBAgAAAQECAQAAAQICAQECAAE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgIAAAIBAAACAQICAAECAgIBAQEBAgIAAgIAAgEAAgA",
                  "remotePublicKey": "AgACAgEBAAICAgIBAAAAAgIAAQEBAgICAQACAAIAAgA",
                  "balances": {
                    "dddcd": {
                      "balance": "2",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "1"
                    },
                    "dddaa": {
                      "balance": "-3",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "0"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AQIBAgACAgACAgECAAEAAQ",
              "newToken": "AgEBAAICAgABAgICAgIBAgIBAgABAQEAAgIAAgEBAAAAAQEAAAEBAQABAQEBAQAAAgIAAQACAQEBAAECAAIBAg"
            },
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {},
                "optRemoteResetTerms": null
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {},
        "openPayments": {
          "AQICAgECAAIBAAACAAIAAQ": {
            "invoiceId": "AAABAQIBAQICAAIBAQIAAQAAAAECAAEAAAEAAQEBAAE",
            "currency": "abb",
            "destPublicKey": "AgACAgABAQECAAECAAABAQICAQECAQACAQIAAgICAQE",
            "destPayment": "2",
            "description": "C",
            "generation": "1",
            "status": {
              "commit": [
                {
                  "responseHash": "AQAAAAEBAAACAgACAgECAQECAQIAAQIAAQAAAgIAAAA",
                  "srcPlainLock": "AQAAAQACAAACAgAAAAAAAAEAAgEBAAAAAQABAQABAAA",
                  "destHashedLock": "AQAAAAABAQABAgEAAQEBAgIAAgECAQECAgACAAEBAgA",
                  "destPayment": "1",
                  "totalDestPayment": "1",
                  "invoiceId": "AgEAAQECAgAAAgECAgECAQECAAICAQABAAIBAAIBAAE",
                  "currency": "bcbcbbddbdacdb",
                  "signature": "AAICAAACAQEBAAEBAgACAAIAAgEBAgIBAAABAgIAAAIBAAACAAEBAQABAgACAAACAQICAgABAAEBAQAAAQEBAA"
                },
                "0"
              ]
            }
          },
          "AQEAAAECAQICAgABAQIAAA": {
            "invoiceId": "AAIAAAIAAAIAAAABAQICAQICAgAAAgACAAEAAAABAQA",
            "currency": "bbdb",
            "destPublicKey": "AQECAQAAAAACAgECAQEBAAACAQAAAAAAAAAAAAABAAI",
            "destPayment": "2",
            "description": "",
            "generation": "1",
            "status": {
              "commit": [
                {
                  "responseHash": "AAIAAQACAQIAAQAAAAEBAAEAAgEBAAAAAgICAQABAQI",
                  "srcPlainLock": "AAIAAgIAAgICAQEBAAIAAgEBAgACAQIBAQEAAAIAAgE",
                  "destHashedLock": "AAAAAAICAQICAAIAAAEBAAECAQEAAgEBAgEBAQEBAAA",
                  "destPayment": "2",
                  "totalDestPayment": "2",
                  "invoiceId": "AQICAQEBAAIAAgAAAQEBAgABAgECAQECAgECAAECAgA",
                  "currency": "bdb",
                  "signature": "AQAAAAEBAQECAQIBAQEAAQICAAICAgECAgIBAAACAQABAgECAgEBAgIBAAEBAAEBAQECAAEAAAABAgABAgABAg"
                },
                "0"
              ]
            }
          }
        }
      }
    }
  }
}
''',
  r'''
{
  "ack": "AQEAAQABAgAAAAEBAAIAAg"
}
''',
  r'''
{
  "serverToUser": {
    "node": [
      "0",
      {
        "responseVerifyCommit": {
          "requestId": "AAEBAAICAAEAAgEBAAEBAQ",
          "status": "success"
        }
      }
    ]
  }
}
''',
  r'''
{
  "ack": "AAACAAIAAgACAgACAQICAg"
}
''',
];

// -------------------------------------
final userToServerAck = [
  r'''
{
  "requestId": "AQECAQABAAABAAEBAgAAAQ",
  "inner": {
    "node": [
      "0",
      {
        "disableFriend": "AAABAQABAAECAgICAgEBAQAAAQAAAAABAgEAAQICAAE"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAABAgABAgAAAAIBAQIAAQ",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "",
        "appPrivateKey": "AQAAAgABAQEBAAIAAgIBAAACAQICAAABAgIBAQABAAEBAAECAgEBAQEBAQECAQAAAQEBAQICAgACAgAAAAIAAQAAAAEBAAIAAgECAgIAAgIBAQEAAg",
        "nodePublicKey": "AgIBAgACAAAAAgEAAQICAgACAQECAQIBAAABAAEAAgE",
        "nodeAddress": {
          "address": "abbbaddacbabaccabccdbaaccabbda"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgIAAQIAAQIBAAABAQACAA",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQEAAgECAAAAAgICAAAAAQ",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQECAQACAAIAAgEBAAIBAQ",
  "inner": {
    "enableNode": "䪹¢"
  }
}
''',
  r'''
{
  "requestId": "AQAAAgIBAQEAAQICAQICAQ",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQICAAEAAQACAAABAgECAQ",
  "inner": {
    "disableNode": "§-"
  }
}
''',
  r'''
{
  "requestId": "AAIBAQACAAEAAgICAgIAAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": ""
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQEBAAEBAAEBAAEBAgECAg",
  "inner": {
    "disableNode": "6"
  }
}
''',
  r'''
{
  "requestId": "AQAAAgACAgEBAQAAAgABAg",
  "inner": {
    "removeNode": "8p"
  }
}
''',
  r'''
{
  "requestId": "AgICAgICAAICAQAAAQACAg",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAEAAAIBAQECAgECAAABAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "",
        "appPrivateKey": "AQACAgABAAACAgACAQEBAQABAAICAAICAAECAAAAAAACAgEBAAEBAAABAQIBAQECAQABAAIBAAIAAgIBAAIBAAEBAAAAAgICAQEAAAIAAAABAQIAAA",
        "nodePublicKey": "AQECAAACAQICAAEBAQAAAAEBAAECAAAAAQAAAgICAQA",
        "nodeAddress": {
          "address": "aacddbacdabbbcdcaacababacaddccbbdbacacabbcadacbdbbbcbcbbbcbdaaaddcbcaddacaacccabdbcddbcdcdaacbdccbaccdaddbaddcddcbadaacdddcbcacacaa"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgACAAIBAQIBAAIBAQIBAg",
  "inner": {
    "enableNode": "\t+"
  }
}
''',
  r'''
{
  "requestId": "AAIBAQEAAQACAQIBAgABAQ",
  "inner": {
    "node": [
      "2",
      {
        "setFriendName": {
          "friendPublicKey": "AgICAgACAgIAAAEBAQACAgIAAAEAAAACAAICAAAAAQE",
          "name": "ᾒ"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAIBAAEBAgAAAAIAAgEBAg",
  "inner": {
    "enableNode": "‚m"
  }
}
''',
  r'''
{
  "requestId": "AgICAgACAgAAAAIBAgEBAA",
  "inner": {
    "node": [
      "2",
      {
        "closeFriendCurrency": {
          "friendPublicKey": "AAICAQICAQIBAQIBAQECAgIBAAIBAAAAAgIAAgABAgE",
          "currency": "bca"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAICAgECAQIBAgECAAIAAQ",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAIBAgACAAEBAAIBAgEAAQ",
  "inner": {
    "removeNode": "¦"
  }
}
''',
  r'''
{
  "requestId": "AgABAgECAAECAAEAAgIAAQ",
  "inner": {
    "node": [
      "1",
      {
        "addInvoice": {
          "invoiceId": "AQEAAQEBAgEBAgAAAAABAgEBAgIAAQAAAAEAAAABAAE",
          "currency": "ccaababbbbbad",
          "totalDestPayment": "1",
          "description": ""
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQEBAgIBAQIAAQIAAAECAQ",
  "inner": {
    "enableNode": "q"
  }
}
''',
  r'''
{
  "requestId": "AgEAAAECAQICAQABAAECAA",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQIBAAEAAgIBAQEBAgEBAQ",
  "inner": {
    "removeNode": "瀞ŉ"
  }
}
''',
  r'''
{
  "requestId": "AQIAAQEBAgICAAECAQICAQ",
  "inner": {
    "removeNode": "ᛷ"
  }
}
''',
  r'''
{
  "requestId": "AQIBAQIBAQEAAgEBAgIBAg",
  "inner": {
    "removeNode": "/"
  }
}
''',
  r'''
{
  "requestId": "AQECAAACAgICAQABAQEAAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": ""
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQICAgECAAECAgABAgIBAQ",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAIAAAABAgIBAgIAAQAAAQ",
  "inner": {
    "disableNode": "\u0019′"
  }
}
''',
  r'''
{
  "requestId": "AQECAgIBAAEAAgAAAQABAg",
  "inner": {
    "enableNode": "•"
  }
}
''',
  r'''
{
  "requestId": "AAIAAQABAgACAAEBAQAAAA",
  "inner": {
    "node": [
      "1",
      {
        "removeFriendCurrency": {
          "friendPublicKey": "AQABAAECAAAAAgIBAQACAQAAAQECAQECAAICAgAAAgI",
          "currency": "bcccccddbabbc"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAIBAAIBAgABAgACAAAAAA",
  "inner": {
    "node": [
      "2",
      {
        "setFriendName": {
          "friendPublicKey": "AAICAgECAAABAQEBAQIBAAECAQAAAgEAAQABAgAAAgA",
          "name": ""
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgABAAEAAAAAAgIBAAICAg",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgIBAQEAAgEAAgIAAQECAg",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAECAgABAAABAAIAAAIBAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": ""
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgEBAgAAAQECAQAAAQECAQ",
  "inner": {
    "disableNode": "\r"
  }
}
''',
  r'''
{
  "requestId": "AgICAQABAAICAgEAAQEBAQ",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgEBAAAAAgEBAQICAgACAA",
  "inner": {
    "removeNode": ".:"
  }
}
''',
  r'''
{
  "requestId": "AAECAgIAAAABAgIAAAEAAA",
  "inner": {
    "enableNode": "4"
  }
}
''',
  r'''
{
  "requestId": "AgAAAgEBAQABAgEBAQACAQ",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "򑼩"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgEBAQEBAQICAQEBAAEBAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "",
        "appPrivateKey": "AgECAQECAAEAAAAAAAEAAgAAAQECAAICAgECAAAAAAACAgAAAAABAQECAQAAAgABAQACAAIBAAECAQEBAAECAAIBAgICAgEAAgEAAgABAAACAQAAAg",
        "nodePublicKey": "AAICAQIAAgEBAQEAAAICAQICAAEAAgEAAgIBAQEAAAA",
        "nodeAddress": {
          "address": "adaabcdcdcbbcacbddbdcacbdbacbaabddbdcbdaacaadcdaa"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgICAAEBAAICAAACAAEAAg",
  "inner": {
    "node": [
      "1",
      {
        "addIndexServer": {
          "publicKey": "AAACAAIBAgIBAAEBAQIBAAICAQABAAAAAgICAgABAQE",
          "address": {
            "address": "dbacddbdcaaacbaddabaadcaadbdddcdaccaccabccdcbadaabaaccdcdcaabbccccacacacdbacbdababcaacdbacadddbcadacadadbdcacdcdbdacadaddbcddcdcbadbdcabadacbacabb"
          },
          "name": ""
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQEAAgECAQEAAgEAAQACAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "](",
        "appPrivateKey": "AQEBAgACAgICAQABAAICAQICAgIAAAICAAEBAgECAQICAAEBAQIAAQEAAgAAAAEAAQIAAgIBAAAAAAIAAAIAAAIAAgAAAQAAAQEAAQECAAIBAQECAg",
        "nodePublicKey": "AQACAQABAAEAAAEBAQEAAQEBAAIAAAEAAQEAAQAAAQA",
        "nodeAddress": {
          "address": "dcacddabcdacdacdababcbdcdcbacadddacacaabbcdbdcdccbbccbacbbbdddcbdbadbbcbdadcbaacbaadddccabcdbbacaacdbbdccabadcadabadbaaacdbaccbcdbdbdbcdaadcdcbcbadbabcdbacaaccaaaaaababacbdbbaddcabbcccdcabcbbabcdaadabaccbabbdacbaaabdddbaaaacbabbdbadaacacdbb"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgIAAQAAAgICAgABAQEBAg",
  "inner": {
    "enableNode": "2z"
  }
}
''',
  r'''
{
  "requestId": "AgACAQECAAEAAAEAAQIBAg",
  "inner": {
    "enableNode": "𳖺"
  }
}
''',
  r'''
{
  "requestId": "AgABAgIBAQEAAgABAAAAAA",
  "inner": {
    "node": [
      "1",
      {
        "addRelay": {
          "publicKey": "AQAAAQICAQAAAQIBAAACAQEAAgABAQAAAAIAAQIAAAE",
          "address": {
            "address": "dbdcbdadccdcdacadacdbabcdddcccabbaacdccdccdaaccadcbcd"
          },
          "name": "@"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAEBAQECAgAAAQACAQABAQ",
  "inner": {
    "removeNode": "/\u0011"
  }
}
''',
  r'''
{
  "requestId": "AQACAgACAAABAQEBAQICAA",
  "inner": {
    "disableNode": "H"
  }
}
''',
  r'''
{
  "requestId": "AQICAQAAAAABAAEAAAEAAQ",
  "inner": {
    "node": [
      "1",
      {
        "addFriend": {
          "friendPublicKey": "AAAAAgABAgICAgICAAEAAQEBAQIAAgICAQIAAAACAAI",
          "relays": [
            {
              "publicKey": "AQIAAgACAAIAAQEAAQEBAAIBAgABAgEBAgIBAgEBAgE",
              "address": {
                "address": "cdcdcadcdddacdacadcdaddaddccaadbacdadcadbcbcbdddbbcdcaabacbbbdcaccacaaaddbadbaabbcdcdddbadbdbdddadacddbdadccddbbdbbacdaacdcbaccadcddcaaacadcaaacdcddacbcbcddacbddbccadacbacadbadbabdadcdccacdbddacbcbdddcdbcbbdcaddbdacacdadcccbbaacaddccaaa"
              }
            },
            {
              "publicKey": "AAABAAIBAQEAAQIAAAICAgABAAICAQEAAQEBAgEAAAI",
              "address": {
                "address": "bcbbaddaadabccbccaacddbdcbdaddcdcbabcbdadcabcddcddcbbacccdbcdcbaadadddcabaabbacbabcbaacbbbcaabbcdbabdbacbabdbbcddaaddccbaaddcbcabcdacaabaabbcbaddbbbacbcdbbacdadbdcdadbddcabaccbacacbbbccdddccdcdbcbabdcdcbcbcccbabbbbcbacdccbdbcbccabadcacccacccacdbdc"
              }
            }
          ],
          "name": "\u0001"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAEAAQIAAAEAAgEBAAEAAA",
  "inner": {
    "node": [
      "0",
      {
        "ackPaymentDone": [
          "AgAAAAECAAIBAAIBAgIAAQ",
          "AQEBAQECAQIBAgEAAAIAAA"
        ]
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgABAQECAgEAAgACAQIBAg",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQAAAgEBAQIAAQAAAAEAAA",
  "inner": {
    "node": [
      "0",
      {
        "setFriendRelays": {
          "friendPublicKey": "AAIAAQABAQACAQABAAIBAgIBAAECAQECAQEAAgEAAAI",
          "relays": [
            {
              "publicKey": "AAABAQEBAgIAAAABAQABAgABAgIAAAIAAAABAAEAAgA",
              "address": {
                "address": "caccccbccacbdbcbcadaaadcddabcabadbaaaaddadabcdaaabcc"
              }
            }
          ]
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQACAgABAQIBAgIAAgIBAg",
  "inner": {
    "node": [
      "0",
      {
        "closeFriendCurrency": {
          "friendPublicKey": "AQAAAgECAQAAAQACAgACAQEAAAAAAAICAAEAAQEBAAE",
          "currency": "abbacdbcddcb"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgIAAQECAgICAQIAAgECAA",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgICAAIAAQICAAECAgEBAg",
  "inner": {
    "enableNode": "SQ"
  }
}
''',
  r'''
{
  "requestId": "AQACAAECAQICAAECAQEAAA",
  "inner": {
    "disableNode": "'"
  }
}
''',
  r'''
{
  "requestId": "AgACAAEAAgIBAgAAAgABAA",
  "inner": {
    "removeNode": "<"
  }
}
''',
  r'''
{
  "requestId": "AQECAQAAAgICAAIBAQACAQ",
  "inner": {
    "node": [
      "2",
      {
        "disableFriend": "AAECAgIAAgAAAQEAAQABAQABAgIBAgECAQEBAgAAAgA"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgABAgACAAABAgEAAAIBAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "F"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQAAAQIBAgABAgEAAgEAAQ",
  "inner": {
    "disableNode": "8'"
  }
}
''',
  r'''
{
  "requestId": "AgAAAQIAAQEBAgACAgICAg",
  "inner": {
    "enableNode": "5"
  }
}
''',
  r'''
{
  "requestId": "AQIAAQIBAAEBAgACAAIBAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "~#"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AAECAQECAgAAAgEAAAIAAA",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "",
        "appPrivateKey": "AgIBAQIAAAACAQICAgAAAQEBAQEBAQIAAAICAAEAAgEAAQACAAABAQIBAgECAgABAQABAAECAgICAgECAgABAQEBAAABAQIAAgEAAAIAAAIBAQACAQ",
        "nodePublicKey": "AAICAAICAQIAAAIBAgAAAgECAQECAQABAQIAAQICAgE",
        "nodeAddress": {
          "address": "adcdcaaacccbbdbdcabaaabaacccddcccbddbaaaabdabaddabbababacacaacdcbabbdcbcbaaddbadaadadccbbcdc"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQECAgACAAACAgEAAgABAA",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "",
        "appPrivateKey": "AAIAAgIAAQACAAECAAEBAAAAAAECAQABAAICAQECAAIBAAICAQAAAAEBAAIBAgEBAQEAAQECAQABAgEAAQICAAEAAgIAAgABAQEBAQECAQACAQABAQ",
        "nodePublicKey": "AgEAAQIBAAABAQEBAQIAAAEAAAIBAAABAgIAAQICAgA",
        "nodeAddress": {
          "address": "abaacddbccadddccadbbdadbcbcdcddcaadcabacbabbdbaddcdddbcbbcbddbaaaacdcdbaadcbbccaacdabcbbdabdbabdccbabbcacaaacbbcaccccdadcdaacbabbdbadabcddccbbabdacacacbabbbccaaaaabcddddcaacacadccdc"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQAAAAEAAQECAgAAAgABAg",
  "inner": {
    "node": [
      "0",
      {
        "requestVerifyCommit": {
          "requestId": "AgEAAQEBAQECAQAAAQABAg",
          "commit": {
            "responseHash": "AgABAAACAAACAgACAAICAgAAAgEAAgIBAAIBAQEAAgA",
            "srcPlainLock": "AQABAAAAAAIBAAIBAQEBAAAAAQICAAECAgAAAQACAgE",
            "destHashedLock": "AQIAAAECAQICAAECAgACAAACAgICAAABAAEAAgAAAQA",
            "destPayment": "1",
            "totalDestPayment": "2",
            "invoiceId": "AAEBAQABAgAAAQIBAAECAAECAAABAQEBAgACAQIAAgE",
            "currency": "abcaddb",
            "signature": "AAABAgIAAgABAgEBAAEBAAEBAAEBAAIBAAABAAECAAACAQICAQAAAQEAAgEBAgAAAQECAAAAAQAAAgEAAgABAQ"
          }
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQACAAAAAAAAAAEAAgICAA",
  "inner": {
    "node": [
      "0",
      {
        "setFriendRelays": {
          "friendPublicKey": "AQABAQIBAgACAQABAAICAgABAQABAAIBAAABAQEAAAI",
          "relays": [
            {
              "publicKey": "AgICAQEAAgACAgABAgACAgABAgEAAAICAAIBAAAAAgI",
              "address": {
                "address": "baddbbbccccdcdacadbdccdbddacccccaccd"
              }
            }
          ]
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQACAgEBAQAAAAECAQACAg",
  "inner": {
    "removeNode": "k"
  }
}
''',
  r'''
{
  "requestId": "AAAAAQABAgECAQABAgIAAg",
  "inner": {
    "disableNode": "*"
  }
}
''',
  r'''
{
  "requestId": "AgEAAgICAAIAAgABAAECAQ",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "2'"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AAICAgECAQEAAgEBAAACAQ",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQEBAQACAgEAAQEAAQABAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "󮫐",
        "appPrivateKey": "AQIBAAABAgEAAgIBAQICAQAAAQACAQIAAgEBAAABAgECAgIAAgAAAgEBAQEAAgAAAgICAAECAQEAAAECAQICAgICAgEBAQABAQACAAECAgACAgABAA",
        "nodePublicKey": "AAIBAQEBAAAAAQIAAgIBAgICAQECAAACAQABAQIAAgE",
        "nodeAddress": {
          "address": "dcdacaaadbcddaaacccadbbaacbbbcdacbbcbaaacacbbcddbdcbaddddbbabddacdccbdddcaaaacdadbbcddadcdbcdacbdabbcbbabaccaabacdacabdabbdccbbadccdadcddacdaaabaabcdbaabaabccbdbbacabbabacdbdbddcadd"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AAIAAQABAQABAQACAgABAQ",
  "inner": {
    "removeNode": " "
  }
}
''',
  r'''
{
  "requestId": "AAIAAQIBAQICAgEAAQACAQ",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAAAAQEAAQACAAAAAAICAA",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgAAAgECAQABAAIBAQECAQ",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "\n"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQACAAEAAgECAAICAAIAAA",
  "inner": {
    "removeNode": "ື"
  }
}
''',
  r'''
{
  "requestId": "AQEAAAICAAECAQAAAgEBAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "⁗"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgAAAAAAAgABAQIAAQEAAA",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "…",
        "appPrivateKey": "AgAAAgAAAAEAAgACAgEAAgABAQABAQIBAQAAAAEBAgIBAQACAQABAgABAAAAAAACAgAAAAEBAAICAQEAAQIAAgACAQIAAAAAAAABAQIBAgABAAAAAA",
        "nodePublicKey": "AQEAAQABAAACAQECAQAAAQEBAQECAQIBAQIAAQEBAQA",
        "nodeAddress": {
          "address": "dcccccdabbcacaddbdddbaadddcbbccbdcbacdccaccabbcacbaaabbbdaabaadabcbccadcaaddcba"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AAEAAgICAAIBAQEBAgEAAA",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAEAAQAAAQACAQACAgEAAg",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "r"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQACAAICAAEAAAABAAAAAQ",
  "inner": {
    "disableNode": "ޢ"
  }
}
''',
  r'''
{
  "requestId": "AgABAQECAgIAAQACAAIBAA",
  "inner": {
    "node": [
      "1",
      {
        "closeFriendCurrency": {
          "friendPublicKey": "AgIBAQACAAAAAAIAAAICAQEAAAEBAAIBAAAAAAEAAAE",
          "currency": "d"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQIBAAEBAgECAQEAAQECAA",
  "inner": {
    "node": [
      "0",
      {
        "initPayment": {
          "paymentId": "AAABAgEBAgICAQIAAAICAQ",
          "invoiceId": "AgEAAQEBAQECAQECAQICAQICAAIBAAIAAAACAgEAAAI",
          "currency": "bacacb",
          "destPublicKey": "AAEAAAIBAgACAAIAAgECAQAAAAAAAgAAAgEBAQICAQE",
          "destPayment": "2",
          "description": "”"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgICAQICAAIBAAABAAAAAg",
  "inner": {
    "removeNode": "="
  }
}
''',
  r'''
{
  "requestId": "AQACAQIBAQACAAABAQECAg",
  "inner": {
    "enableNode": "9"
  }
}
''',
  r'''
{
  "requestId": "AQEBAQEBAgAAAgIAAQAAAg",
  "inner": {
    "node": [
      "0",
      {
        "removeFriend": "AAICAQECAgEBAgIAAQIAAQIBAQAAAQAAAAEBAQECAAE"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAICAQABAgIAAQECAQAAAg",
  "inner": {
    "enableNode": "}"
  }
}
''',
  r'''
{
  "requestId": "AgIBAQIBAgEAAAAAAQECAA",
  "inner": {
    "removeNode": "􀀀"
  }
}
''',
  r'''
{
  "requestId": "AAEAAgEAAQIAAAAAAQAAAQ",
  "inner": {
    "disableNode": "~"
  }
}
''',
  r'''
{
  "requestId": "AQACAgECAAIAAgEBAQICAg",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAEBAAICAAABAgEBAQACAg",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": ""
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQICAQABAAEBAAEAAgEBAA",
  "inner": {
    "node": [
      "2",
      {
        "cancelPayment": "AAEAAQIBAQIBAAECAgACAA"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAEBAQECAAEBAQIAAAACAQ",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQIBAgECAAECAgIBAgICAQ",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "K8",
        "appPrivateKey": "AAABAgECAAIBAQIAAgECAAICAgIBAAECAgIAAgACAQEAAQABAQIAAAIAAQIBAQEBAgECAgIBAQEBAgABAgACAQICAgICAQECAQEAAQEBAgIAAAABAg",
        "nodePublicKey": "AgACAQABAAEBAAEBAAABAgABAgICAAIAAgIAAgIAAQA",
        "nodeAddress": {
          "address": "cbbdcabbbddbddccbacacadddacacdabacbadddabdbbadddccddabccabddccabdaacbcbdaddacdaaabbbbaddacccdbabaacbdbcddccdaddbaabcbdbdccdcbdddacbddccddabaabbcadcbbaddbaadaacaddbbbbadccdbaadddccabbacdadcaadcaabcbbccb"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgIAAQABAQICAgICAQIAAA",
  "inner": {
    "node": [
      "1",
      {
        "addRelay": {
          "publicKey": "AQICAQIAAgICAAIAAgIBAQABAQAAAQABAgIAAQIAAQA",
          "address": {
            "address": "ddabacdccabdcabdabbacbccdbadaddcddcdbbaadbbcccadddbbacbccdacadbddadddccabdaadbccaabcbdbdbaadcddddcaaddddddadcdbbddbaaadcacccacdbbdcdaaabdaacacccbaadbaaadacbbdaaa"
          },
          "name": "S"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQACAgAAAAECAAICAQAAAQ",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgECAAAAAQIBAQIBAQIAAg",
  "inner": {
    "node": [
      "2",
      {
        "commitInvoice": "AAAAAAICAAEBAQEBAgECAQIBAgACAgABAAEAAgECAAA"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQEAAgEBAAECAAAAAAIBAA",
  "inner": {
    "disableNode": ","
  }
}
''',
  r'''
{
  "requestId": "AAEAAAIBAAAAAQECAAECAA",
  "inner": {
    "node": [
      "2",
      {
        "addInvoice": {
          "invoiceId": "AgICAQICAAEBAAABAgEAAAEAAAIBAAABAgECAQICAQI",
          "currency": "dcbbcaaabda",
          "totalDestPayment": "2",
          "description": ""
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQABAAICAAABAAEBAgIAAQ",
  "inner": {
    "node": [
      "1",
      {
        "removeRelay": "AgEBAAEAAQABAQABAgEAAQEBAQECAgIAAQIBAAEAAAE"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQIAAgAAAAEBAAICAQEBAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "",
        "appPrivateKey": "AAAAAAEBAQECAQICAQECAQACAQIBAAICAAACAAEBAQIBAgIAAAEBAgECAgAAAgAAAAECAQECAQECAQEAAQABAQABAgIAAgECAgIAAAAAAgEAAgIBAQ",
        "nodePublicKey": "AgACAAIBAgABAQIBAQAAAAIAAQAAAQAAAAICAQECAgA",
        "nodeAddress": {
          "address": "ccbcdddadbcbcaaabacdcdbddabcdaccdbaacadbbbccddaaacccacdabbdcbbccdadbcaddcbdbbacdbbcddbdaacbcdcaadacadbdbdccaabbcabadabcacdd"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQICAQAAAQEBAgACAgABAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "",
        "appPrivateKey": "AQEBAQIBAAAAAQICAAIAAAABAQEBAAIBAAAAAgABAQIAAQICAgABAQEAAAECAQECAAICAQIAAAAAAQACAAEBAgAAAQAAAQACAgEAAAEAAQABAgECAA",
        "nodePublicKey": "AQIAAgACAQEAAQECAQAAAQAAAgEAAQICAAAAAAEBAgI",
        "nodeAddress": {
          "address": "dadbdbdbcbdcadadc"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgIAAAAAAgICAQIAAAACAg",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgEBAQABAAIBAAAAAQICAQ",
  "inner": {
    "node": [
      "2",
      {
        "resetFriendChannel": {
          "friendPublicKey": "AgIAAQABAAECAAABAQICAQIAAgEBAgABAQIAAQABAgI",
          "resetToken": "AgAAAQICAQECAQEBAQEAAgEBAQACAAABAAICAgACAgABAAACAAECAgICAgIBAAEBAQABAAAAAAIBAAICAQAAAQ"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgEAAQIAAgIAAgEAAQAAAQ",
  "inner": {
    "removeNode": "G"
  }
}
''',
  r'''
{
  "requestId": "AQACAQIAAgABAAACAAACAQ",
  "inner": {
    "node": [
      "2",
      {
        "commitInvoice": "AQACAAACAAEAAgABAAEAAQEAAgABAAAAAgACAAIBAgI"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAICAQAAAAECAgIBAgICAA",
  "inner": {
    "node": [
      "1",
      {
        "ackPaymentDone": [
          "AAIBAQAAAAIBAQABAAEBAA",
          "AgAAAAEAAQICAAIAAgACAg"
        ]
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgAAAQECAAAAAAAAAQECAA",
  "inner": {
    "removeNode": " !"
  }
}
''',
  r'''
{
  "requestId": "AgIBAgAAAgICAQACAQECAA",
  "inner": {
    "node": [
      "1",
      {
        "addRelay": {
          "publicKey": "AAICAAACAQABAQABAQICAgICAgABAAIAAQIAAgAAAgI",
          "address": {
            "address": "cddabaccbcaaaddbcbcbcbcbddbddddbabddccbcddbdbbaaddcddbdbcdcadcbbaabbbdcabcdaacbacccbcdbdbbdbcdadacacdaacc"
          },
          "name": "9"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAIAAAICAQECAQEBAgAAAA",
  "inner": {
    "removeNode": "ꦣ"
  }
}
''',
  r'''
{
  "requestId": "AQECAAAAAQICAQABAAAAAQ",
  "inner": {
    "node": [
      "0",
      {
        "disableFriend": "AQACAgEAAQABAAICAAEAAAAAAgIAAgEBAgIAAAABAAE"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAEBAAACAgACAgACAQABAQ",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "",
        "appPrivateKey": "AgIAAAABAQACAQECAQAAAQAAAAEAAAIAAQIBAAICAQACAQABAQAAAQAAAAEBAAEBAgAAAAIBAgAAAQIAAQAAAAIBAgEAAgEAAAEAAQABAAECAQACAA",
        "nodePublicKey": "AAACAAECAgAAAAIBAQECAQAAAgEAAQECAgICAgEBAQA",
        "nodeAddress": {
          "address": "babdcacaccddaacddcaccd"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgACAAACAQICAAEBAgECAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "ɂ"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQAAAAECAgACAQIBAAIAAQ",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": ""
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgEBAgABAAECAQABAQAAAQ",
  "inner": {
    "removeNode": "z򆪤"
  }
}
''',
  r'''
{
  "requestId": "AQEAAQIBAgIAAQIAAAABAQ",
  "inner": {
    "removeNode": "H\n"
  }
}
''',
  r'''
{
  "requestId": "AgIAAAEAAgABAAIAAQECAQ",
  "inner": {
    "removeNode": "­"
  }
}
''',
  r'''
{
  "requestId": "AQEBAgACAQECAgIAAQICAQ",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgEBAAAAAgICAQEAAAAAAA",
  "inner": {
    "removeNode": "hఽ"
  }
}
''',
  r'''
{
  "requestId": "AQICAgIAAgECAAACAQACAA",
  "inner": {
    "removeNode": "95"
  }
}
''',
  r'''
{
  "requestId": "AgABAQAAAQECAAACAAECAg",
  "inner": {
    "enableNode": "12"
  }
}
''',
  r'''
{
  "requestId": "AgABAAAAAQABAAEBAQIBAg",
  "inner": {
    "removeNode": "q"
  }
}
''',
  r'''
{
  "requestId": "AQEBAQAAAQEAAAICAAICAQ",
  "inner": {
    "removeNode": "¢"
  }
}
''',
  r'''
{
  "requestId": "AQABAAACAgACAAACAQIBAg",
  "inner": {
    "disableNode": "T"
  }
}
''',
  r'''
{
  "requestId": "AgABAgAAAQABAAICAgICAA",
  "inner": {
    "enableNode": "䚱"
  }
}
''',
  r'''
{
  "requestId": "AQIBAgABAQIBAgIAAAACAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "󠀁"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgEBAQIBAAEAAgEAAQAAAg",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgABAgIAAgAAAAEAAgEBAQ",
  "inner": {
    "node": [
      "0",
      {
        "openFriendCurrency": {
          "friendPublicKey": "AAICAAACAQABAAEAAAAAAAECAQABAgIAAQIAAQEBAgA",
          "currency": "dcb"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQEAAgICAgIBAAABAgEAAg",
  "inner": {
    "removeNode": "\u0007®"
  }
}
''',
  r'''
{
  "requestId": "AQEBAQABAAACAgECAAIAAA",
  "inner": {
    "removeNode": "‍銊"
  }
}
''',
  r'''
{
  "requestId": "AQABAAICAAEBAAEBAQEBAg",
  "inner": {
    "enableNode": "|"
  }
}
''',
  r'''
{
  "requestId": "AgIAAAACAAEAAgIAAQIAAQ",
  "inner": {
    "enableNode": "<o"
  }
}
''',
  r'''
{
  "requestId": "AQACAAEBAQICAgIAAQIAAg",
  "inner": {
    "disableNode": "S"
  }
}
''',
  r'''
{
  "requestId": "AAECAQICAgIAAAICAAABAA",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQICAgEBAgIBAAECAgABAQ",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgICAgEBAAIAAQABAQACAQ",
  "inner": {
    "node": [
      "1",
      {
        "setFriendCurrencyMaxDebt": {
          "friendPublicKey": "AgAAAgABAQAAAQACAQACAgICAQEAAQAAAAEAAAACAQE",
          "currency": "cc",
          "remoteMaxDebt": "0"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQACAQECAgAAAAEAAAEAAg",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgIAAQAAAgACAQEBAQIBAA",
  "inner": {
    "disableNode": "@Y"
  }
}
''',
  r'''
{
  "requestId": "AAIAAQABAQICAAIBAQABAA",
  "inner": {
    "disableNode": "("
  }
}
''',
  r'''
{
  "requestId": "AAIAAAACAAEAAAIAAAAAAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "\\",
        "appPrivateKey": "AQACAAIAAgECAAEBAQABAQAAAQEAAgIAAgACAgIBAgACAgICAAICAQEBAQIAAAICAgECAQACAAEBAgICAQIAAQAAAQIBAgAAAgEAAQIBAgEBAgAAAQ",
        "nodePublicKey": "AgACAgEBAAABAQABAgABAQIAAQIAAgECAAEAAgIAAAA",
        "nodeAddress": {
          "address": "ababbdacaccbccdbddddacacbddccaacabcbddbdbdbdadbcdbcddccccddcbdbdcdaccbccdbbcccbdddbcddddcbddccadbdcaddccccabcdadadcabaccacbdbbccbcbddbdccdadaccdbdddbbad"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgEAAgICAAIBAQEAAQABAg",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAACAAAAAgEBAgABAQIBAQ",
  "inner": {
    "removeNode": "񦂖B"
  }
}
''',
  r'''
{
  "requestId": "AgIAAgABAAEBAgACAQACAg",
  "inner": {
    "removeNode": "B"
  }
}
''',
  r'''
{
  "requestId": "AAIBAgECAQEBAgECAAIAAg",
  "inner": {
    "node": [
      "2",
      {
        "addRelay": {
          "publicKey": "AgECAgEBAgECAQAAAgECAQEAAgIAAgEBAAACAAAAAgE",
          "address": {
            "address": "bcbbbdacbcdbcccbbabdcbabcacccddabdbcccbcabbdacadbabdaccbcdacbcaccbbacabccdabaaabcbcdabdcdadbbcbcacaabdcdbacbdbcaabbacac"
          },
          "name": ""
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAICAQAAAQICAQACAQIBAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "/1",
        "appPrivateKey": "AAAAAgABAQIBAAECAAABAAIBAgIBAQEAAAICAAAAAAIAAQEBAQAAAAICAgIBAAACAQACAgICAQIAAQECAAEAAgIAAQEAAgEAAQICAgEAAAEBAgECAQ",
        "nodePublicKey": "AQEAAgIBAgIBAAECAAACAQEBAAACAAEAAQIBAQECAgI",
        "nodeAddress": {
          "address": "acabaddadbaadcbdcbcbcaccadbaddaacdacadcbcbaaacbcaacbdadbbabddaaabbbdcdadaadbbcdabdcccccaabcacadcdcaadbaacbaccadaadacbabdaabccdbcacdcaaadbcddbbbccabbbcdbbdcddcbaaddbddacacdbddbbcbcbccdbd"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgIBAgEAAQAAAQEAAQABAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "8񮍕",
        "appPrivateKey": "AgIAAQIAAgIAAQEAAQICAAEAAQAAAAACAAEBAgECAQICAgAAAAACAgICAQABAQAAAQIBAAAAAgABAgAAAAECAQIAAQACAgACAQAAAgEBAQIBAQAAAg",
        "nodePublicKey": "AQABAgAAAAECAQACAgABAQICAAECAQIAAAAAAAAAAQE",
        "nodeAddress": {
          "address": "adbddcaacbccbaaaabbbbbdaacdcabacdaddaccbccdccdcbcdacccbcabcbbbcabddabbbcabaabcbdc"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQABAAIBAQAAAgAAAgEAAQ",
  "inner": {
    "disableNode": "\u0004"
  }
}
''',
  r'''
{
  "requestId": "AQEBAQABAgEAAAEAAQAAAA",
  "inner": {
    "node": [
      "1",
      {
        "removeRelay": "AAABAgEBAgICAAEBAAEBAQIAAAABAgABAQIAAQACAgI"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgEBAAICAgABAgEAAgABAQ",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAABAAABAQAAAgEAAQAAAg",
  "inner": {
    "node": [
      "1",
      {
        "setFriendName": {
          "friendPublicKey": "AAEAAgEAAAEBAgEAAgICAQABAgIAAAICAAACAQACAQE",
          "name": "="
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAICAAECAgACAgEBAAIAAA",
  "inner": {
    "node": [
      "0",
      {
        "setFriendRelays": {
          "friendPublicKey": "AgICAgECAAAAAAACAQICAgACAQECAgABAgEBAgACAAA",
          "relays": [
            {
              "publicKey": "AAECAAABAAEAAQEBAAEBAQEBAQIBAgAAAQIBAgEAAQI",
              "address": {
                "address": "acbdddbccbaacaacddcacccbcbdaacbaaadaaabcadbccbacbbaccbbdcbccddaccaaccbbccbcddcdcdaabbbbbbcccdbcbbcddcacbdccbabcbdaabcaadaccaaaaabddcbbabbabbaddddabadaaadbaddbcacbbbcdcabadddbcdbbdccaadcdcaccbcadcdacaabcbbacbadbdabcbabbadbadcabbcccdcdddc"
              }
            },
            {
              "publicKey": "AAICAQIAAgIAAQIAAgIAAAIAAQEBAQABAQACAQIBAAE",
              "address": {
                "address": "acbdaadcbaccaacaddbdacaacbddc"
              }
            }
          ]
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQABAgICAQABAAICAQACAA",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAABAQABAAEBAgAAAgABAg",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgABAQEBAAAAAAIAAgABAQ",
  "inner": {
    "enableNode": "£"
  }
}
''',
  r'''
{
  "requestId": "AgAAAQAAAgECAQIAAAAAAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "G "
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgIAAAAAAAIBAAAAAAABAg",
  "inner": {
    "node": [
      "1",
      {
        "cancelInvoice": "AAEBAgABAAEAAgABAAAAAAACAAIBAAICAQICAgIBAQE"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgIAAAIAAAAAAgICAQABAA",
  "inner": {
    "enableNode": "n"
  }
}
''',
  r'''
{
  "requestId": "AgAAAQEAAgECAQABAAICAg",
  "inner": {
    "enableNode": "ߡ"
  }
}
''',
  r'''
{
  "requestId": "AQECAgACAgACAQACAQABAQ",
  "inner": {
    "disableNode": "肤\u001c"
  }
}
''',
  r'''
{
  "requestId": "AgABAgIBAgECAQIAAQAAAA",
  "inner": {
    "enableNode": "￱"
  }
}
''',
  r'''
{
  "requestId": "AgABAgICAAABAAABAAAAAg",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgECAgIBAQEBAQIAAAEAAg",
  "inner": {
    "disableNode": "￵"
  }
}
''',
  r'''
{
  "requestId": "AgABAgIAAgICAQABAgICAQ",
  "inner": {
    "removeNode": "5\u0001"
  }
}
''',
  r'''
{
  "requestId": "AgEAAQIAAAAAAQACAgIBAQ",
  "inner": {
    "node": [
      "0",
      {
        "addFriend": {
          "friendPublicKey": "AQECAQIBAgIBAQEAAQABAAICAAIBAgEAAgEBAAECAAE",
          "relays": [
            {
              "publicKey": "AQIAAAEBAAAAAAACAAAAAQECAgEAAAIBAQICAAABAQI",
              "address": {
                "address": "bddac"
              }
            }
          ],
          "name": ""
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQIBAgECAQEBAgIAAgIBAg",
  "inner": {
    "node": [
      "1",
      {
        "addIndexServer": {
          "publicKey": "AgEBAgEAAQICAgACAQIBAAEBAAACAQEBAAAAAAACAAI",
          "address": {
            "address": "aaabcbdbdbaddbbcabdbadabacddbbccccccbdcdadddcdabddbbadabcccabadabaccabddcabdabbbbaadbbcadcdacdcbdddcdadacacabcccddbccbbcabcddbcbbaaacccabdbddcdcbcabbbacbdbbcbddadbabcabdbbacbcaaddbdbcddddbdddabbdabbabbdba"
          },
          "name": "\u0006"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AgECAgICAAEAAQIAAAICAg",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": ""
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgEBAQECAgICAAECAQAAAA",
  "inner": {
    "enableNode": " "
  }
}
''',
  r'''
{
  "requestId": "AAAAAAECAgACAgAAAAECAg",
  "inner": {
    "enableNode": "⁄W"
  }
}
''',
  r'''
{
  "requestId": "AAEAAAAAAQECAAAAAgICAA",
  "inner": {
    "enableNode": "R"
  }
}
''',
  r'''
{
  "requestId": "AQECAAIBAQICAAEAAgEAAA",
  "inner": {
    "node": [
      "1",
      {
        "resetFriendChannel": {
          "friendPublicKey": "AQABAAAAAgICAQIBAAACAQIAAQABAAABAAICAAEBAgA",
          "resetToken": "AgACAQACAAEBAAEAAAIAAAECAAEAAAICAAACAAIAAAICAgABAAICAAEBAgIAAgEBAAEBAgACAgIBAQEAAAECAg"
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQABAgACAQIBAQACAAABAA",
  "inner": {
    "removeNode": "\"1"
  }
}
''',
  r'''
{
  "requestId": "AQACAAIBAQEBAQACAQEAAQ",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "k"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgEBAgIAAgABAQEAAAIAAg",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgIAAQEBAAEAAgEBAQICAg",
  "inner": {
    "disableNode": "⯴"
  }
}
''',
  r'''
{
  "requestId": "AgICAAABAQIAAAIBAgEAAA",
  "inner": {
    "node": [
      "2",
      {
        "setFriendName": {
          "friendPublicKey": "AAEAAAEBAQIBAQACAAECAgICAgEAAgECAgICAAEAAAA",
          "name": ""
        }
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AQIBAQEAAAAAAQICAAICAQ",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "NV",
        "appPrivateKey": "AQEBAgECAAIBAQECAAECAAEBAQEBAAECAgEBAAIAAQEAAgAAAQEAAQAAAAEAAQICAQIBAQIAAQABAAACAQEBAAACAgECAAAAAgICAQICAgIBAAABAg",
        "nodePublicKey": "AgEBAgEAAgICAAABAQIAAAEBAAEBAAIBAQIBAgIAAgA",
        "nodeAddress": {
          "address": "ddcdbbaadbbbb"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgIBAAIAAAEAAAACAAEAAA",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQECAgEAAAIBAQEAAAAAAA",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AQECAQAAAQECAAIBAQACAA",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": " "
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgACAQEAAQICAAEAAAEBAA",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAIAAAECAAEBAQAAAQIBAA",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAIAAQIAAgIBAgACAgABAQ",
  "inner": {
    "removeNode": "d"
  }
}
''',
  r'''
{
  "requestId": "AgACAAEAAgECAQIAAgACAQ",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "",
        "appPrivateKey": "AQEAAAABAQIAAgICAgABAgEBAgICAQIAAgECAgIBAgECAAECAgABAAEAAgECAgAAAAAAAgEBAAABAgIAAQABAgIBAgEAAgABAgABAQAAAAECAAICAA",
        "nodePublicKey": "AgIAAQEAAgECAQECAAEBAAEBAAECAgACAgACAQACAgI",
        "nodeAddress": {
          "address": "dccacaaccbaadcabcbdaaaadbadabcbbcdadcaacdcdcdccadabaabdcaaccbdaccabdaaacadabacacdacaccbdaccbcdccadbadbbdacddbbcdcdcaccaaabdadbcbbadaadcb"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQABAQABAQIBAgIBAAICAQ",
  "inner": {
    "node": [
      "0",
      {
        "removeFriend": "AQEAAAEAAgECAAAAAAICAgEAAAEBAAABAgACAgIAAQA"
      }
    ]
  }
}
''',
  r'''
{
  "requestId": "AAEAAgEBAQECAgICAQABAg",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "ª",
        "appPrivateKey": "AQABAQIBAgEAAAACAAEAAAAAAgABAAABAgAAAgIBAQIAAQAAAQAAAAICAAICAQECAgIBAAIAAAECAAICAQICAgIAAQEAAAICAgIBAQEAAAECAgAAAg",
        "nodePublicKey": "AQABAAEBAQABAQICAAABAgABAQAAAgECAAECAQIBAgE",
        "nodeAddress": {
          "address": "dbdaabb"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgEAAAAAAQAAAAECAQAAAA",
  "inner": {
    "disableNode": "¯Y"
  }
}
''',
  r'''
{
  "requestId": "AQEAAAECAgIAAAAAAAIAAg",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgEBAQIBAQAAAAIBAAACAg",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "'"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AQIBAAEAAQICAgIBAAIAAQ",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgECAAICAgIAAQIAAAEBAA",
  "inner": {
    "removeNode": "奄"
  }
}
''',
  r'''
{
  "requestId": "AgIBAQACAQICAQIAAgAAAg",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": "𱵪+"
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AgEAAgIBAgACAQAAAQICAQ",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgIAAgAAAQECAQEAAQEBAg",
  "inner": {
    "disableNode": "¤"
  }
}
''',
  r'''
{
  "requestId": "AAECAQICAAEBAQIBAQIAAA",
  "inner": {
    "enableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AgECAQICAQAAAAACAgACAA",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAEAAQECAAEAAQIBAQEAAQ",
  "inner": {
    "createNode": {
      "createNodeRemote": {
        "nodeName": "󵓠}",
        "appPrivateKey": "AQIAAAAAAQEBAQAAAQICAQICAgIAAQICAAIBAgEBAAEAAAAAAQACAAECAAEBAQICAgIBAgEBAAABAgACAQEBAgIAAAABAAAAAQEAAQEAAQECAQEAAQ",
        "nodePublicKey": "AAACAAABAgECAAIAAQACAQACAQEBAQABAAEBAAECAgA",
        "nodeAddress": {
          "address": "bcccbbccaaadbddadcdbbdbaadadadadacabdaabbcdcbcabbaacaacbacccddaacddadcbcadadcabbbdcadabadbcbcbdda"
        }
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AAIBAQIBAQECAgEBAgEBAA",
  "inner": {
    "disableNode": "⫱"
  }
}
''',
  r'''
{
  "requestId": "AgABAgEAAAICAQACAQABAQ",
  "inner": {
    "disableNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAAAAQEAAgACAgACAgAAAg",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": ""
      }
    }
  }
}
''',
  r'''
{
  "requestId": "AAEBAgAAAAECAAAAAgIAAg",
  "inner": {
    "removeNode": ""
  }
}
''',
  r'''
{
  "requestId": "AAECAgEBAAABAgECAQIBAg",
  "inner": {
    "enableNode": "#"
  }
}
''',
  r'''
{
  "requestId": "AQECAgAAAgACAAABAQICAQ",
  "inner": {
    "createNode": {
      "createNodeLocal": {
        "nodeName": ","
      }
    }
  }
}
''',
];
