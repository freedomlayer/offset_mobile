final serverToUser = [
r'''
{
  "node": [
    "2",
    {
      "paymentCommit": {
        "paymentId": "AQIAAgEBAgACAgEAAAIAAA",
        "commit": {
          "responseHash": "AQIAAgICAgEBAQIBAgIAAgABAAEAAQACAQAAAgEAAQE",
          "srcPlainLock": "AQABAQIAAgIBAAIAAQEBAgABAAACAQABAQAAAQECAAI",
          "destHashedLock": "AAEBAQABAAIBAgECAgEBAAECAAICAAEBAAIBAAACAgA",
          "destPayment": "1",
          "totalDestPayment": "1",
          "invoiceId": "AQAAAAEAAgIBAQIBAgEBAAIBAAACAgECAQACAgIBAAI",
          "currency": "cacacaa",
          "signature": "AgABAAABAQABAAABAgICAgIBAQEBAQAAAQIBAgICAQACAAECAgIAAAACAAAAAQEBAgAAAQIBAgEBAAIAAQIBAQ"
        }
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "N.",
      "0",
      {
        "routes": true,
        "buyer": false,
        "seller": true,
        "config": true
      },
      {
        "localPublicKey": "AAIAAQAAAAEBAgEBAgICAgECAgIBAgEBAgEBAgABAgE",
        "indexServers": [
          {
            "publicKey": "AAIBAQEAAAICAAIAAgEAAgIBAgEAAgEAAQECAAIBAQA",
            "address": {
              "address": "bcbacdbbccbacaacdaddadacadcacaaabbcbbbaddbacaaddddbacbbbddbddcccacabdcbbaabcbbbadaabbdbcbdcbbbdcba"
            },
            "name": "7"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AgIBAgIBAgIBAQABAQEAAQABAQACAQECAgICAAIBAAI",
            "address": {
              "address": "bddcaaaadbabddcdbcdabdcbdddccaadcdabacddcadbccabdaccbbdcadaadddbdddabdabdcadbbacddbdadbaccdbaaccccabddcaaddcacaaaabdccbbbbcaddcdccdddabcbcaaadcccbacadcbdccadccdcdbacbbbcabdacddddaddbcaccabcbbdc"
            },
            "name": "\u0000\\"
          },
          {
            "publicKey": "AAECAQEAAQIBAQEAAgECAgEAAAICAgIAAgACAgACAQA",
            "address": {
              "address": "cadbabaaddaadbbabbaacbbbaabdccbdababadcdcdbaddbabcddbacccbbbadbcbcdddcdbdcbdcbaabcbcccdacaddacbdabaabdbbaccbbcddabcabaaacbcbcdcabbdddacbdbcccaadbaddddbbcac"
            },
            "name": ":"
          }
        ],
        "friends": {
          "AgECAgECAQIAAgAAAQIBAAEBAAACAgIAAgAAAgABAQA": {
            "name": " ",
            "currencyConfigs": {
              "dccabccdddbdd": {
                "rate": {
                  "mul": 1,
                  "add": 1
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              },
              "ab": {
                "rate": {
                  "mul": 1,
                  "add": 0
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AQACAAIBAAACAgACAgABAAAAAAIBAAIAAgEAAQEBAQA",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAAAAgABAgIBAgIAAAACAQEBAQIBAgAAAQECAQEAAgI",
                  "remotePublicKey": "AAIAAAIAAgAAAQACAgIAAAICAAEAAQABAgEAAAICAgA",
                  "balances": {
                    "aaccdcbccbabbbb": {
                      "balance": "-2",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "1"
                    },
                    "cadd": {
                      "balance": "0",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "1"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AAEBAAAAAgEBAAABAQIBAQ",
              "newToken": "AAICAAEBAgICAgAAAgIAAgIAAQIAAAECAAICAgECAAICAAICAAACAAIBAgEBAQAAAgECAAAAAAIAAgIAAQABAA"
            },
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "abdbcbdcbdaba": "-2"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AAIAAQICAQEBAgIBAQIBAAIAAAIAAAIAAgECAgABAQAAAQABAAACAgABAQECAgAAAgAAAAIAAAIBAgEAAgECAA",
                  "balanceForReset": {
                    "baaaaacdaabcdab": "-1"
                  }
                }
              }
            },
            "status": "enabled"
          },
          "AAIBAAEBAQECAQABAQICAQEAAAEBAgAAAAECAgEAAAI": {
            "name": "mp",
            "currencyConfigs": {
              "dccdd": {
                "rate": {
                  "mul": 2,
                  "add": 0
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AAAAAAABAQEBAAACAQECAAACAAACAgABAgEAAgABAQI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAECAgIBAAABAQIBAgIBAQEBAAEBAAIBAQIAAQIAAAI",
                  "remotePublicKey": "AQICAgEBAgEBAAECAAEBAgAAAgEAAAABAgEAAQEAAAI",
                  "balances": {
                    "dacbbbddcbbba": {
                      "balance": "2",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "0"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "2",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AgABAAIAAQIAAgICAQAAAQ",
              "newToken": "AgACAgEBAQEBAgEBAAIAAQIAAAABAQECAgAAAgIBAAABAQIBAQICAQECAgEAAgIAAAAAAgEBAgEAAAICAgACAg"
            },
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "bccdbddc": "1"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AgABAAABAQABAAAAAgEAAQEAAgIAAgACAgAAAAACAQABAQICAgAAAgACAgICAgABAAABAgEAAgABAgICAQEAAQ",
                  "balanceForReset": {}
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {},
        "openPayments": {
          "AQABAAICAAABAgABAQECAA": {
            "invoiceId": "AQABAgEAAgACAAABAAEAAQEBAAICAQICAAIBAgEAAgE",
            "currency": "dbddbccd",
            "destPublicKey": "AgIAAgECAAECAgECAgECAQACAQECAgAAAQIAAQICAgA",
            "destPayment": "1",
            "description": "U[",
            "status": {
              "foundRoute": [
                "AAABAQICAAABAgEBAAAAAg",
                "0"
              ]
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
  "node": [
    "0",
    {
      "paymentFees": {
        "paymentId": "AQABAAACAQEAAgIAAAECAg",
        "response": "unreachable"
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "2",
    {
      "responseVerifyCommit": {
        "requestId": "AgEBAgIAAAIBAgAAAAEBAg",
        "status": "success"
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "1",
    {
      "paymentDone": {
        "paymentId": "AAIAAQEBAQECAAACAAEAAQ",
        "status": {
          "success": [
            {
              "responseHash": "AQABAAECAQIAAAAAAAEBAQABAQIAAAECAAIAAAIBAAE",
              "invoiceId": "AgIAAAEAAAECAQIAAQIBAgECAAABAAABAAACAAECAAA",
              "currency": {
                "currency": "bbaaaaacbadbc"
              },
              "srcPlainLock": "AQEBAgACAAABAgEAAQICAgACAAEBAgAAAAEAAAACAgA",
              "destPlainLock": "AAIBAAABAAABAAACAQACAgACAQECAQECAAECAgEBAAE",
              "isComplete": true,
              "destPayment": "2",
              "totalDestPayment": "1",
              "signature": "AgECAAEBAQAAAQIAAgACAgABAAEAAAABAgAAAAACAQEBAAICAAICAAECAQACAgAAAgAAAQAAAAICAAAAAgACAg"
            },
            "0",
            "AAAAAQACAQAAAgAAAgEAAQ"
          ]
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAECAAEAAQACAAAAAQICAAIBAgIBAQIAAgIAAgABAAA"
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "responseOpenNode": {
    "failure": ""
  }
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "}?",
      "0",
      {
        "routes": true,
        "buyer": false,
        "seller": true,
        "config": false
      },
      {
        "localPublicKey": "AgIBAAICAgECAAIBAQEBAQICAAIAAgABAQECAAIAAAE",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAEAAQABAgEBAQECAgAAAgECAQEAAQECAgIAAAACAgE",
            "address": {
              "address": "bdbcdaaddacababbacdbbbadcbbaddbcdcdbcdaaacacccaaaadcccbbdbbdccabbdbddadbadacdbacbbabacdbbcaaaacabddcdcdabaaddbbdcdc"
            },
            "name": " J"
          }
        ],
        "friends": {
          "AgEBAAICAQIBAAICAAIAAAACAAEBAgABAAABAgIAAQI": {
            "name": "",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "aadbcd": {
                    "balance": "-2",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "1"
                  }
                }
              }
            },
            "status": "enabled"
          },
          "AAEAAgABAQEBAAEBAgEAAgEBAgAAAQAAAgECAQICAgA": {
            "name": "",
            "currencyConfigs": {
              "addcbc": {
                "rate": {
                  "mul": 0,
                  "add": 1
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AQABAQICAgIAAAICAQEBAQICAQEBAAEAAQACAgAAAAA",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgIAAAICAQECAgEBAQICAgIAAQACAAABAQIBAQIAAAI",
                  "remotePublicKey": "AAIAAgIAAgABAAEAAAECAgAAAAEBAQECAAICAAEAAgA",
                  "balances": {
                    "b": {
                      "balance": "1",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "2"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "2",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AQEAAAIBAAIBAQABAQABAg",
              "newToken": "AAAAAgEBAAIBAgAAAQECAQEBAQAAAgICAQEAAQECAgEAAgEAAgECAgABAAEBAAICAQECAAEBAgIAAAAAAAEBAg"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "cbcadaacbcb": {
                    "balance": "-1",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "2"
                  }
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AQABAQABAQEAAQAAAAACAgEBAgIAAgIBAgIBAAEBAAI": {
            "currency": "ac",
            "totalDestPayment": "2",
            "description": "G"
          },
          "AQIAAAIBAAIBAQEAAAABAgIAAQABAgICAQABAgACAgI": {
            "currency": "ba",
            "totalDestPayment": "0",
            "description": "J"
          }
        },
        "openPayments": {
          "AQEBAgABAgEBAQACAAABAg": {
            "invoiceId": "AAEBAAIBAAEBAQAAAQABAAABAAIAAAIAAAAAAAIBAQE",
            "currency": "abcaacbaaa",
            "destPublicKey": "AgEAAAABAgACAQABAQEBAgEBAAIAAAAAAAEAAgABAgA",
            "destPayment": "0",
            "description": "",
            "status": {
              "foundRoute": [
                "AQIAAgICAQAAAAIBAAABAQ",
                "1"
              ]
            }
          },
          "AgIAAgIAAgIBAgEAAAECAA": {
            "invoiceId": "AQEAAgIBAAAAAgEBAgACAQIBAQICAgABAAIBAAEBAAE",
            "currency": "aaccc",
            "destPublicKey": "AAABAQIBAgIBAAACAAICAgAAAgIAAAIAAgABAAAAAAI",
            "destPayment": "0",
            "description": "e|",
            "status": {
              "sending": "0"
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
  "node": [
    "1",
    {
      "responseVerifyCommit": {
        "requestId": "AAACAQACAQEBAAEBAQEBAA",
        "status": "failure"
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "2",
    {
      "paymentCommit": {
        "paymentId": "AQEAAQACAAACAQIAAQICAQ",
        "commit": {
          "responseHash": "AgACAAEAAgAAAAABAQECAAECAgEAAQACAQAAAAEAAQA",
          "srcPlainLock": "AQABAQICAQACAAIBAQEBAAIAAQEAAQABAAIAAAABAQE",
          "destHashedLock": "AgICAQECAAECAgECAgICAgEAAQACAQIBAgEBAQACAAI",
          "destPayment": "2",
          "totalDestPayment": "1",
          "invoiceId": "AAIAAAEBAAAAAQEBAQACAgICAQIBAQEAAAABAgAAAgA",
          "currency": "adddbbdcbc",
          "signature": "AAEAAQIBAgIBAgEBAAIBAQACAgAAAAEBAAEBAAICAgEBAgEAAgEAAQABAQICAgEAAgICAQAAAQICAQICAAECAA"
        }
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "1",
    {
      "paymentFees": {
        "paymentId": "AgIAAAIBAAEAAAEBAgIAAA",
        "response": {
          "fees": [
            "1",
            "AAEAAAAAAgEBAgEAAAEBAg"
          ]
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "󋩆\u0015": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AgEAAQECAgEBAgACAQAAAgACAgABAAEAAQIAAQACAQE",
          "nodePublicKey": "AgIAAQEBAgACAgEBAQECAgIAAgIAAgIBAQIBAAEAAAE",
          "nodeAddress": {
            "address": "caaaccddadddcddbdddabdbcbccabbcdadbdcabbdacccabadcbcdccbdcacdbdbdbccbd"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "node": [
    "1",
    {
      "report": {
        "localPublicKey": "AgIBAAIAAgECAAABAQEBAQABAQAAAAIBAQAAAgAAAQE",
        "indexServers": [
          {
            "publicKey": "AQAAAAIAAgICAgAAAgICAgAAAQECAQIAAQEAAgABAAI",
            "address": {
              "address": "dcbdcdbbcbbbadabbadcabcdddabaadbdcdacadabcabcabdcdbcc"
            },
            "name": "2"
          },
          {
            "publicKey": "AQEBAgAAAQIAAAEBAQAAAQEAAAICAgEBAgABAQIAAQA",
            "address": {
              "address": "ccbaaccdaababacdcbdacdacc"
            },
            "name": "\u001e"
          }
        ],
        "optConnectedIndexServer": "AAECAAACAgIBAgIBAQIBAAAAAQECAgAAAQACAQEBAAI",
        "relays": [
          {
            "publicKey": "AgAAAgAAAQAAAgICAAICAAEBAQECAgECAAABAAEAAAI",
            "address": {
              "address": "dbcdadbbaccccdccbdbdaabdcddcabacbaacacbaccdbdccaadacaacbbbdabdcabcaaabccbadbcbadccaccabbbcbdbddcaddcabadddbdbbdaadbcaadaaabbddacbcbadaaddccdaaddacb"
            },
            "name": "3"
          }
        ],
        "friends": {
          "AQAAAQEAAQICAAEAAQACAAIBAQIBAgACAgEAAAECAAE": {
            "name": "￹",
            "currencyConfigs": {
              "abdbdcbadbadc": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              },
              "b": {
                "rate": {
                  "mul": 1,
                  "add": 1
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "dbcd": {
                    "balance": "1",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "2"
                  },
                  "addddcadaab": {
                    "balance": "1",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "1"
                  }
                }
              }
            },
            "status": "disabled"
          },
          "AQABAQAAAAACAgEBAQACAQABAAIAAgIBAAIBAAIAAgA": {
            "name": "..",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {}
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AAEAAAACAAAAAAIAAAECAQABAQAAAAICAgABAAIAAQE": {
            "currency": "abad",
            "totalDestPayment": "1",
            "description": "?"
          },
          "AgIAAQECAQEBAAIAAAIAAgICAAACAgEBAAAAAAIBAAI": {
            "currency": "adbbacda",
            "totalDestPayment": "1",
            "description": "¬"
          }
        },
        "openPayments": {}
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "覓觾"
  }
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "node": [
    "2",
    {
      "responseVerifyCommit": {
        "requestId": "AgEAAgICAgACAQACAgIBAQ",
        "status": "success"
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "\u0001¤": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AQIBAgIBAQEAAgECAAECAQAAAgEAAgICAQABAAABAAA"
        }
      }
    },
    "": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AQAAAAACAgIAAQEBAgECAAEAAQABAAEBAAIBAQABAAE",
          "nodePublicKey": "AAACAAEAAQIBAQACAgECAgACAgECAQEBAgAAAQECAQI",
          "nodeAddress": {
            "address": "cbcccdbabccccbabadcbbbbddcabaacbbdaaacadaccaaacdacbcacadddccbccacccaaaccaadcbbbdbabcaaddacbacbbabbdddaddacbaacdbcbcbdaaaacbaabaadccccacabdbabbddccabdbbdddcaaccabbcccbadbacbbbcbddccdcbdabd"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "C"
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "report": {
        "localPublicKey": "AgACAAEBAQECAQECAAIBAAEAAAAAAAECAQIAAgACAQI",
        "indexServers": [],
        "optConnectedIndexServer": "AQEAAAABAAACAAECAgABAgEAAQECAAECAgIBAgIBAQA",
        "relays": [
          {
            "publicKey": "AQACAgECAAICAgIBAAEAAAACAQABAAECAgIAAQECAgA",
            "address": {
              "address": "abbaaadddcbdddcaddcbaddbdbcbddaaadccbabaabbcdcbddadadcaaaddaaabadccbbbdbbaadcdcdbaacacadcbdcbbbcadabccdddcabbbaababbddbcccaabacbcbbdbabbccdacadacbccadabbbaacddabbcdbccbdbcc"
            },
            "name": "▨"
          },
          {
            "publicKey": "AgIBAgACAAEAAQEAAAIAAgEAAgICAQICAQAAAQABAgA",
            "address": {
              "address": "aacdcbabdcbdcadbdbcdbbbcaaabcadbcbdbdcbcaabbaabcaacdccabbbadcbbcdaccdabbbdadadcdbccccaadbbabcadcdacadbcabbacbbcdbabccdbdaccdddaddcbbac"
            },
            "name": "象"
          }
        ],
        "friends": {},
        "openInvoices": {
          "AQIBAAIAAgEBAQIAAgEBAgECAQACAgACAQEAAAIAAgE": {
            "currency": "ccbdccdbbcd",
            "totalDestPayment": "0",
            "description": "p"
          },
          "AgABAgACAAACAgACAQIBAAIAAAACAQIAAQECAgIAAAI": {
            "currency": "a",
            "totalDestPayment": "2",
            "description": "x"
          }
        },
        "openPayments": {}
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "\"¬"
  }
}
''',
r'''
{
  "nodesStatus": {
    "d}": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AgACAgEAAgABAgEAAQEAAQEAAgAAAQACAAABAAACAAE"
        }
      }
    },
    "": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AgABAQABAgICAgIBAgEBAAEBAAEAAQABAgECAAECAQE",
          "nodePublicKey": "AQACAQABAgIBAgABAQECAQEAAAICAAAAAQABAAECAAI",
          "nodeAddress": {
            "address": "caaabdbadccbdbbbababbcdbbcdcbbdabbadcbbbaccbcabcdbbabddaccadbcddbdaa"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "F ": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AQECAgICAAICAgICAQECAQIBAAAAAQECAQIAAgACAgI",
          "nodePublicKey": "AQAAAgICAQACAAECAQAAAgEBAQICAQIBAAEAAAEAAgE",
          "nodeAddress": {
            "address": "dbcccadbccbcdcbcabbdadccaabcaacdbdbadddadbbcaabaabadbdc"
          }
        }
      }
    },
    "]\u0003": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AgIBAgIAAgICAAECAAEBAQEBAgICAQEAAAECAgICAgI",
          "nodePublicKey": "AQICAgACAQECAAECAAEAAQECAAAAAAEBAgAAAAECAgA",
          "nodeAddress": {
            "address": "dbccacaabccbbaababdcabacabbabbbadbccbddcadaacacabaccadcd"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "F]"
  }
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "\t"
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "paymentDone": {
        "paymentId": "AAEAAAECAgIBAQEBAAIAAA",
        "status": {
          "failure": "AQEBAgAAAQACAAEBAAECAQ"
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "node": [
    "0",
    {
      "paymentCommit": {
        "paymentId": "AQIAAQEAAQIAAgAAAAIAAg",
        "commit": {
          "responseHash": "AgEBAAICAQEAAAECAgECAQECAgACAgABAQAAAgABAgA",
          "srcPlainLock": "AQIBAAIBAQICAAAAAgEBAAAAAgICAgAAAQABAAAAAQA",
          "destHashedLock": "AgIBAAIBAgAAAAIAAAACAQEAAQIBAgAAAQICAAABAAA",
          "destPayment": "0",
          "totalDestPayment": "1",
          "invoiceId": "AAICAgABAgICAAABAAEBAgEAAQIBAAAAAAEAAgEBAgI",
          "currency": "cbaacadbbadd",
          "signature": "AAACAQECAAAAAAEBAQECAAIAAgEBAAEBAQICAQABAAIBAgICAgAAAgIBAAEBAAEAAgAAAAIAAgIBAAIAAAIBAQ"
        }
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "failure": ""
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "report": {
        "localPublicKey": "AQABAgAAAAEAAQABAQIBAQEAAgIAAAEAAQIAAgABAgI",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {},
        "openInvoices": {
          "AAAAAAABAgIAAAICAgAAAQAAAQICAAEBAAAAAQEAAQA": {
            "currency": "bcd",
            "totalDestPayment": "0",
            "description": ""
          },
          "AgABAAECAAECAgIAAAABAAECAAABAAAAAgIBAgAAAAE": {
            "currency": "babcadac",
            "totalDestPayment": "1",
            "description": "^𲳰"
          }
        },
        "openPayments": {
          "AgACAQEBAgABAQAAAQEAAQ": {
            "invoiceId": "AQABAgEBAAICAAEAAAABAgACAQEAAAABAQACAgEBAAI",
            "currency": "adadcdaabbacd",
            "destPublicKey": "AAECAAEBAgAAAAECAQABAgICAQEAAAIBAQIBAAICAgA",
            "destPayment": "1",
            "description": "L‚",
            "status": {
              "searchingRoute": "AgIAAgIBAQICAgEAAQECAQ"
            }
          },
          "AAABAQACAAAAAQACAgABAg": {
            "invoiceId": "AQIAAQEAAQABAQICAAECAgIAAQICAQICAgICAQICAAI",
            "currency": "baaabddc",
            "destPublicKey": "AQEAAQAAAAEAAQIAAAIBAgABAQICAgABAAEBAAAAAQA",
            "destPayment": "2",
            "description": "ᦦ",
            "status": {
              "failure": "AQICAgICAgICAAIAAgECAA"
            }
          }
        }
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "+‌"
  }
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AQAAAgICAAACAgICAAEBAAECAgAAAQEAAQABAQAAAgA",
          "nodePublicKey": "AgABAAACAgEBAgECAAIAAQACAgABAAABAQIBAQEBAgA",
          "nodeAddress": {
            "address": "addbacabbbddbabaaddcccdbabaabaacdcddadaaadbdcbaaacacaaaacababdadaccddcdabbcdaccbaadbcbbbccabdbbcdaadbaccdacdbbbadcdbbcbddaaddbdabacbddadcbbadbddbacbbdaadca"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "report": {
        "localPublicKey": "AQABAgICAQACAgEBAgACAgIBAQEBAgEBAQECAAABAgA",
        "indexServers": [
          {
            "publicKey": "AgABAgEAAgEBAAAAAQABAgABAQAAAQEBAAIBAAECAAA",
            "address": {
              "address": "dcacbdccbdadcabdcdddb"
            },
            "name": ":\""
          },
          {
            "publicKey": "AAEBAAAAAAIBAgABAAACAQIBAAAAAAIAAgECAAEBAgE",
            "address": {
              "address": "cdccccadbaddabcbdacccbbbddbdaacbbbcdddbdbccacbcabcccadcdcabcbdcaacbacdbdabbcaaabcdcddbcbacbddabcbcddabaaabcdbaddadaacddbabcacbabccdadcddccdcbbbcbadbbcadacdbbdddcccaccdcddddbddbdaacbadcdcdaadbdddbcddcbbccacdaabbcddacdacdcbbadcdcdadacccabcccacbac"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AgAAAAIBAAEBAQABAAACAQICAAABAgABAQEBAgEBAAA",
            "address": {
              "address": "ccdadacadabcbcccaccdbdbadadadccbcacbacbbdabdbcabdbbdbabdccdcdcadcbcdcbacacbcdadbaaacbabdbddaacccacbbdbaaacdbcccddcdbdccabcaadadbcdabbacddcbaddcc"
            },
            "name": "N«"
          },
          {
            "publicKey": "AgIBAAIAAgACAQEAAgAAAgAAAgEAAgIAAgECAAIBAgI",
            "address": {
              "address": "aacdbcabcadbdabcacdbdaddabbbbdbcdcbaabdacbcabcacbacacccaacbdddddccbbdbbbabdddcccababdccdbbbadacbdcbdaaaacabbcdaabdccccdaaccbaacdabbddaccbbaacaadbcccbadbdbbbcaaabacddcdbdccadc"
            },
            "name": "u"
          }
        ],
        "friends": {
          "AgACAQEAAAABAgIAAgABAgEBAAEAAgEAAAICAQIAAgE": {
            "name": "",
            "currencyConfigs": {
              "bdaa": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AAACAQAAAQICAAAAAQICAAEBAAABAgIBAAEBAgECAgI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAICAAABAgICAQABAQACAQIBAgEAAgICAQICAQICAgA",
                  "remotePublicKey": "AQIBAQECAgEBAgEAAQEAAgEAAAABAAIBAAEBAgAAAQA",
                  "balances": {
                    "acabcadcbdadbbb": {
                      "balance": "2",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "1"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AQABAAACAgAAAgIBAQEBAQ",
              "newToken": "AgECAAABAQEBAAIAAQACAgAAAQIBAQEBAAIAAAEAAAEBAAACAgEAAAACAAABAAEBAQEAAQAAAQABAQICAAICAA"
            },
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {},
                "optRemoteResetTerms": {
                  "resetToken": "AAEAAAICAgIBAQIBAAECAgICAQIBAAIAAAEBAQEAAgACAQECAgIBAgICAQAAAQACAQIBAQAAAAEBAQICAQECAQ",
                  "balanceForReset": {}
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AQAAAAIAAgABAQIBAAABAgEBAAEBAgEAAAABAAIBAAE": {
            "currency": "acaabbadaadac",
            "totalDestPayment": "1",
            "description": "ª"
          }
        },
        "openPayments": {
          "AQEAAQEAAQEBAQAAAgEBAg": {
            "invoiceId": "AAICAAEAAAIAAAEBAQIBAgACAAECAQEBAAACAQAAAQI",
            "currency": "dd",
            "destPublicKey": "AgIBAQABAAACAAAAAAAAAQIAAAIAAgABAgACAQABAgI",
            "destPayment": "0",
            "description": "㵡<",
            "status": {
              "sending": "1"
            }
          },
          "AAEAAAEAAAIBAQAAAAEBAA": {
            "invoiceId": "AgABAAACAAAAAAECAgEBAAICAQEBAgABAAAAAgEBAQA",
            "currency": "abacdb",
            "destPublicKey": "AQACAgIBAgICAgABAQICAgECAQECAQICAQECAgIBAAE",
            "destPayment": "1",
            "description": "\u001f",
            "status": {
              "commit": [
                {
                  "responseHash": "AQAAAAECAgAAAQEBAgEBAgABAAAAAQECAQIBAgICAQA",
                  "srcPlainLock": "AAIAAAIBAgEAAAIAAAEBAgIBAQECAAIBAgEAAQECAQI",
                  "destHashedLock": "AAECAQABAgICAgIAAAIBAAABAQIAAgIAAgEAAQACAAA",
                  "destPayment": "1",
                  "totalDestPayment": "0",
                  "invoiceId": "AAAAAgICAgABAQIAAQAAAQECAQABAAICAAIBAAAAAQA",
                  "currency": "cbbdbbbbdcdac",
                  "signature": "AgEAAQEBAQICAQEAAQABAAECAAICAQIAAgIAAgIBAQIAAgACAAEAAAIBAQACAQEBAAEBAQACAQEBAAEBAgABAA"
                },
                "0"
              ]
            }
          }
        }
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "2",
    {
      "paymentFees": {
        "paymentId": "AAICAAEBAAAAAgAAAQACAQ",
        "response": "unreachable"
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "®",
      "0",
      {
        "routes": false,
        "buyer": false,
        "seller": false,
        "config": true
      },
      {
        "localPublicKey": "AgICAAACAQIAAQICAgABAQICAAECAgECAgIBAAIBAgA",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AQABAQACAQAAAAEAAQEAAgAAAQEAAAECAQAAAAICAgA",
            "address": {
              "address": "dbadacaadcbdaaabbbdccabcdbdccbddbddbdbdadddcccccdbacbbcddbcddacbabaccacddcdcbaddadcbabcaadabbadbbabadddadd"
            },
            "name": ""
          },
          {
            "publicKey": "AAABAQEAAAEBAgEAAAAAAQAAAAABAAIBAAACAgIAAgI",
            "address": {
              "address": "dba"
            },
            "name": ""
          }
        ],
        "friends": {
          "AgIAAgIBAAICAAABAAAAAQAAAQECAQAAAQABAAICAAI": {
            "name": "",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "adcadacaad": "-1"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AgABAgIAAAEBAQEAAQACAQACAgEBAgICAgAAAAACAgE": {
            "currency": "cbca",
            "totalDestPayment": "1",
            "description": ""
          },
          "AQIBAgAAAQAAAgEBAgAAAQECAAEAAQECAQEAAAEAAQI": {
            "currency": "aabdccbca",
            "totalDestPayment": "1",
            "description": ".-"
          }
        },
        "openPayments": {
          "AQECAgECAAABAgIBAgAAAg": {
            "invoiceId": "AQIBAgABAQABAAIBAgAAAgAAAQIBAgECAgICAAICAgI",
            "currency": "ddbdabb",
            "destPublicKey": "AgACAgECAAICAgABAgEBAgEBAgIBAQIAAgABAQAAAgA",
            "destPayment": "1",
            "description": "",
            "status": {
              "foundRoute": [
                "AQABAAAAAgACAgEBAAIBAA",
                "2"
              ]
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
  "nodesStatus": {
    "": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AAEAAgEBAQIAAQECAgABAAEAAgEBAgABAQIBAQAAAgA"
        }
      }
    }
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "paymentDone": {
        "paymentId": "AgACAgACAAIBAgICAgIAAA",
        "status": {
          "failure": "AQIAAAAAAQIBAgEAAgIAAQ"
        }
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "1",
    {
      "paymentCommit": {
        "paymentId": "AgICAgEAAQECAQIAAgECAA",
        "commit": {
          "responseHash": "AQABAgICAQACAQECAAEBAQACAAICAAABAAECAQAAAgA",
          "srcPlainLock": "AAIAAQACAAACAQIAAAEBAAEAAgIAAQECAAICAQEAAAI",
          "destHashedLock": "AAACAAEAAgIAAQACAQEAAAIAAAEBAgECAQEBAgEBAgE",
          "destPayment": "1",
          "totalDestPayment": "0",
          "invoiceId": "AgIBAgAAAAABAgABAgACAgIBAgEAAgAAAgACAQEBAAI",
          "currency": "bbadda",
          "signature": "AQABAgICAQICAAIBAQABAQICAgABAgIAAgAAAQACAgACAAEBAQIBAgECAAIBAAABAQIAAAIBAgICAQIBAgEBAg"
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "node": [
    "0",
    {
      "report": {
        "localPublicKey": "AgICAgAAAgABAAEAAgEAAAIAAgICAgEAAQIBAQIBAgA",
        "indexServers": [
          {
            "publicKey": "AgACAgIBAgEBAAEBAAIAAAEBAgICAAEAAAICAQEBAQA",
            "address": {
              "address": "dbcccbdbbddcadcbdbadcacaadabacdbadbcadbbbacbcdbbddacdcccbadddaaaddddabaddbcaacaadadaaddbcbdcdccbaacbcabaadadbabddddbdcbacdacbccabdbdcbd"
            },
            "name": "뤏"
          }
        ],
        "optConnectedIndexServer": "AgEAAQAAAgABAgICAQECAgIAAAABAQEBAQICAAECAgI",
        "relays": [],
        "friends": {
          "AQEAAQACAgIAAAICAQAAAQABAQIBAQEBAgEBAgICAAE": {
            "name": "᠎",
            "currencyConfigs": {
              "dcddbcdbdb": {
                "rate": {
                  "mul": 2,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AQIAAAEAAgEAAAICAgABAAECAgABAQIAAAEBAQECAgE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AQECAgAAAAIAAQIBAgIAAgAAAgECAQECAQICAQACAQI",
                  "remotePublicKey": "AQACAgIAAAEBAgIBAgEBAQABAAABAQICAQACAAIAAgE",
                  "balances": {
                    "ababdccb": {
                      "balance": "-3",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "2"
                    },
                    "ddbdbb": {
                      "balance": "0",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "0"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AAACAQIAAQEBAQICAAECAg",
              "newToken": "AQAAAAECAAAAAQEAAQEAAAAAAQEBAQIAAAICAAICAQEAAAICAAECAQECAQECAQECAgECAgABAQAAAgABAgAAAA"
            },
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "ad": "2",
                  "dcb": "-3"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AAECAQACAQICAgEAAAIBAQICAQIBAQAAAAICAAIBAgIAAQECAgEBAQECAQIBAgICAAEBAQACAQICAgIAAQEBAg",
                  "balanceForReset": {
                    "daddbbaaada": "1",
                    "bdc": "-1"
                  }
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AAABAAACAQECAQIBAgECAAIAAgABAQACAgEAAgECAAI": {
            "currency": "aadbacbcdb",
            "totalDestPayment": "2",
            "description": "@N"
          },
          "AgIAAQECAgIAAQACAQABAgIBAAICAgACAgIBAAECAgI": {
            "currency": "bbcc",
            "totalDestPayment": "0",
            "description": ""
          }
        },
        "openPayments": {
          "AgABAAEAAgECAQIBAQICAA": {
            "invoiceId": "AgIBAAAAAAACAQECAQIBAAABAQEAAgACAgAAAAIBAQE",
            "currency": "cacddaca",
            "destPublicKey": "AQEAAAIAAQAAAQABAgICAAABAQIAAgACAgICAAACAQI",
            "destPayment": "0",
            "description": "",
            "status": {
              "sending": "2"
            }
          }
        }
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "2",
    {
      "paymentFees": {
        "paymentId": "AQECAgIAAgEAAAACAAECAQ",
        "response": {
          "fees": [
            "2",
            "AQICAQACAAACAgAAAQECAA"
          ]
        }
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "‿,"
  }
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AQICAQICAAEAAAIAAgIBAQIBAgIAAQABAAIBAgEBAgE"
        }
      }
    },
    "u!": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AAEBAAIBAAICAQEAAAABAAEBAAACAAAAAQIBAQIBAgA",
          "nodePublicKey": "AQAAAAIBAQEAAAIAAQICAgICAQIBAQIAAgABAgIBAAE",
          "nodeAddress": {
            "address": "bbdacaacbbacbdabbabcdabbcabadad"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "Z7": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AQICAgIAAQAAAgICAAICAAIAAAIBAgICAQEAAQIBAgE"
        }
      }
    },
    "": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AAAAAAACAgAAAgEAAgIAAQABAQECAQIBAgEBAAECAAA",
          "nodePublicKey": "AQEAAQIAAQABAQACAgICAQICAAABAQIAAQIAAAEAAgA",
          "nodeAddress": {
            "address": "ddccabbdccdbcbabdbccaabbddcaaccdbcbdabdcdcdccacddbaddbbaacdbabbcb"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "paymentFees": {
        "paymentId": "AgACAQACAgEBAgEBAAICAA",
        "response": "unreachable"
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "0",
    {
      "paymentCommit": {
        "paymentId": "AAEBAAIBAQAAAQIAAAIAAg",
        "commit": {
          "responseHash": "AgICAAACAAECAAEAAAABAgICAQEBAAEBAQECAQIBAAA",
          "srcPlainLock": "AgICAgAAAgICAgIAAgAAAQEAAQICAAIAAQABAAACAQA",
          "destHashedLock": "AQICAgEBAAEBAQECAgECAgIAAgACAAIAAAIBAQABAgI",
          "destPayment": "1",
          "totalDestPayment": "2",
          "invoiceId": "AAECAAICAgACAQICAQIBAAECAAIBAgEBAAEAAgAAAAA",
          "currency": "dcddbabc",
          "signature": "AAECAAIBAgEBAgEBAgECAgACAQABAgIAAAEAAgECAgEBAgIAAQIAAAIAAAEAAQECAQEAAQEBAgEBAgACAAECAA"
        }
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "0",
    {
      "paymentFees": {
        "paymentId": "AgACAQABAAIBAgIBAAEBAA",
        "response": "unreachable"
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "responseOpenNode": {
    "failure": ")"
  }
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "/",
      "0",
      {
        "routes": false,
        "buyer": false,
        "seller": true,
        "config": false
      },
      {
        "localPublicKey": "AgICAQICAgIAAgECAAACAQICAQIAAgICAAABAQAAAgI",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {
          "AQABAQIBAAIAAAIBAQECAAABAQIBAQIAAQEBAQEBAgI": {
            "name": "",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": {
              "prefixHash": "AgACAQEBAAEAAgABAAAAAgABAQICAQACAAACAQEAAQI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAEAAAEAAAIBAAECAgIAAAEBAQIAAgAAAAABAAEBAgA",
                  "remotePublicKey": "AAACAQIBAgICAAECAgACAAEBAQIBAgAAAgEBAAIAAgI",
                  "balances": {
                    "dcdbabcada": {
                      "balance": "-3",
                      "localPendingDebt": "1",
                      "remotePendingDebt": "2"
                    },
                    "dcbadd": {
                      "balance": "-3",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "2"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AAIBAQABAgAAAAECAgIBAg",
              "newToken": "AgIAAgEBAQACAAACAgAAAAAAAQICAgACAgIBAQIBAgICAAEAAgIBAgAAAQACAAABAgEBAQIAAAICAgIBAAEAAQ"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "accb": {
                    "balance": "0",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "0"
                  },
                  "bbdbacd": {
                    "balance": "0",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "0"
                  }
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {},
        "openPayments": {
          "AQACAAABAQAAAgIBAgAAAQ": {
            "invoiceId": "AgICAgICAgACAgACAgICAgABAgIAAAIBAQEBAgEBAQI",
            "currency": "cacb",
            "destPublicKey": "AQABAgACAAIAAQABAgECAAEAAgICAAEBAgABAQIAAAA",
            "destPayment": "0",
            "description": "￸h",
            "status": {
              "success": [
                {
                  "responseHash": "AAACAgEAAAACAQEBAAIBAAECAAABAQACAAABAgABAgI",
                  "invoiceId": "AAAAAgACAQEAAgAAAgICAAABAgIAAQABAgAAAAECAAE",
                  "currency": {
                    "currency": "babcdccbddbbad"
                  },
                  "srcPlainLock": "AgICAgABAgIAAQABAAAAAgABAgECAAIAAAAAAgACAgE",
                  "destPlainLock": "AAACAAABAQICAgEAAgABAQECAAECAAECAAACAQABAQI",
                  "isComplete": false,
                  "destPayment": "2",
                  "totalDestPayment": "0",
                  "signature": "AgEAAQECAQECAAAAAAIAAAAAAAIAAgIBAgABAQICAQIBAQICAgICAgACAQABAAEAAAACAQABAAICAQABAQABAQ"
                },
                "2",
                "AgABAAIAAgACAAEAAgECAA"
              ]
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
  "nodesStatus": {
    "󍹅": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AQECAAACAgABAQEAAQAAAAABAgICAgICAAABAgICAgA",
          "nodePublicKey": "AgEBAgEBAAIAAgEAAgECAQIBAgEAAQICAgECAQAAAAE",
          "nodeAddress": {
            "address": "ddddadaaccddcbcabccbbbadbcadbdcbccababadaaddbdadcdadccdcdcdcdbaababcdacddcacbddbdcbdcbabaabadcbbdccdaacadddbcadbcdaacdcddcc"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "缌": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AgAAAAEAAAIAAAABAQAAAgAAAgACAgIBAAECAgIAAQA",
          "nodePublicKey": "AgICAAIAAAABAgACAAEBAAIAAgEAAAICAQICAAECAAA",
          "nodeAddress": {
            "address": "acbbcbcabdadbdbcabaacbcaccdbcbdcddbdcdbbd"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "node": [
    "2",
    {
      "paymentDone": {
        "paymentId": "AgIAAAIAAAICAgECAgEBAQ",
        "status": {
          "failure": "AAABAQICAgIAAgICAQEAAg"
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "\u001f": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAECAAIBAQIAAgACAQICAQABAgEAAgACAAACAgIBAAI"
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AAAAAQEAAAABAQECAQEAAQECAQIBAQAAAQECAQICAQA",
          "nodePublicKey": "AQABAgEAAgIBAQEBAQECAAIAAAABAQIAAgACAAACAQI",
          "nodeAddress": {
            "address": "ccacdaadbdaddbddbdcacdcaccdaadbbadabbbabcaadcaacacbcacdbdbdbbaadbcddbdacccdaadccdbdacdcbdcbbbcaccaadacbbbaddbddccaaaaaacddabbcbdad"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "",
      "2",
      {
        "routes": true,
        "buyer": true,
        "seller": true,
        "config": true
      },
      {
        "localPublicKey": "AQACAAICAQIAAQICAQABAgACAQIAAgABAQEBAQEAAgA",
        "indexServers": [
          {
            "publicKey": "AAABAgAAAQIAAAECAgACAAIAAQABAAAAAgEBAgABAAE",
            "address": {
              "address": "bcccbddadddbaabbacbbcabadcadabdbdabbbdabccadbbacdcdddb"
            },
            "name": "ಳ\t"
          }
        ],
        "optConnectedIndexServer": "AQECAAICAAEBAAACAQEAAAACAQIAAgACAAIBAAABAQA",
        "relays": [],
        "friends": {
          "AAECAAIAAgICAQEBAgEBAgICAAACAQABAgAAAQABAgI": {
            "name": "",
            "currencyConfigs": {
              "ccacbddccacadb": {
                "rate": {
                  "mul": 1,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              },
              "ddbdddd": {
                "rate": {
                  "mul": 2,
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
                  "bcbcbdbaaaccc": {
                    "balance": "0",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "2"
                  },
                  "dbacda": {
                    "balance": "-1",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "1"
                  }
                }
              }
            },
            "status": "disabled"
          },
          "AQEBAAAAAgECAQECAQEBAgABAQEBAgIBAQAAAQABAQI": {
            "name": "‟",
            "currencyConfigs": {
              "bbddba": {
                "rate": {
                  "mul": 1,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              },
              "cbccccdd": {
                "rate": {
                  "mul": 1,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "dbab": {
                    "balance": "-1",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "1"
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
    ]
  }
}
''',
r'''
{
  "node": [
    "2",
    {
      "responseVerifyCommit": {
        "requestId": "AQECAQACAQIBAgEAAQEAAg",
        "status": "failure"
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "1",
    {
      "report": {
        "localPublicKey": "AQABAgEBAgEBAgIAAAABAQACAgAAAQIAAgIAAAABAAE",
        "indexServers": [
          {
            "publicKey": "AAEBAgACAgICAAABAgACAQICAAEBAAACAAABAQABAgA",
            "address": {
              "address": "cbbdcabbaabcaacababdbdccddaabccaacccccbbcabbcbabdbcdcdbcbbcbbbabaddaddcbbbcbaccdbddcabaacbabccdacaaadb"
            },
            "name": "—􆟾"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {
          "AQEAAgECAQIAAQEAAgECAgIAAQABAAAAAAICAgICAQA": {
            "name": "2",
            "currencyConfigs": {
              "aabddccdbcac": {
                "rate": {
                  "mul": 0,
                  "add": 2
                },
                "remoteMaxDebt": "2",
                "isOpen": false
              },
              "cad": {
                "rate": {
                  "mul": 2,
                  "add": 0
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AgABAQABAQIAAQAAAgEAAgIAAAICAgACAgICAAAAAAA",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgEAAQIAAQACAQIAAgEAAAEAAQEAAQICAQAAAAICAAE",
                  "remotePublicKey": "AAECAgIAAQIAAgIAAgICAgIAAgECAAAAAgABAAABAQA",
                  "balances": {
                    "cbbadcbabbaa": {
                      "balance": "1",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "0"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AAIAAgECAgIAAAICAAICAQ",
              "newToken": "AQABAQABAQEAAQACAQAAAQIBAQICAAABAQEAAQIAAQACAgEBAgICAAEBAQAAAAECAgIAAgIAAAEBAAICAQEBAQ"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "bdabdadbddcdcb": {
                    "balance": "-3",
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
          "AQIAAAACAgICAgIAAQICAQICAgICAQECAgEBAAIBAQA": {
            "currency": "adcdbbcb",
            "totalDestPayment": "2",
            "description": "\u001b$"
          },
          "AQACAAIBAQECAAECAgICAQIAAAIBAQABAgIAAQAAAQE": {
            "currency": "accdbabca",
            "totalDestPayment": "1",
            "description": "D"
          }
        },
        "openPayments": {
          "AQACAQECAQEBAQECAAECAQ": {
            "invoiceId": "AgECAgACAAIAAAECAQIAAgEAAgEAAgEAAgIBAQAAAAE",
            "currency": "bbcc",
            "destPublicKey": "AgABAQEAAAIAAgECAAACAAIBAgEAAgABAQACAAAAAAI",
            "destPayment": "2",
            "description": "\u000f",
            "status": {
              "searchingRoute": "AAICAAIAAAIBAAACAAABAg"
            }
          }
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AQECAQIAAgIAAgACAAEAAgAAAgAAAQABAQIAAgEAAgE"
        }
      }
    }
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "responseVerifyCommit": {
        "requestId": "AAACAAIBAQEAAgAAAAECAQ",
        "status": "failure"
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "8",
      "1",
      {
        "routes": false,
        "buyer": true,
        "seller": false,
        "config": true
      },
      {
        "localPublicKey": "AAEAAgACAQIAAQACAgAAAgICAgAAAgACAgEAAgABAgI",
        "indexServers": [
          {
            "publicKey": "AQEAAgEBAQABAgEAAAEAAQAAAQIAAQICAAEBAQEAAgI",
            "address": {
              "address": "abaabaaaadbdcccaccdbcdbbacaccdbcacadaddacabccddabbdcbacababbcdcdbcdcbccdadbabdddbcbcdcbaaddddadcadabaccddcbdababddbcdaadbadbbbabcacbccdcddcacbacbbdcbbabcddcbbdcdcbbbadcbbb"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {},
        "openInvoices": {
          "AgABAAIAAQACAQECAQABAQEBAAEAAgACAAABAAICAAE": {
            "currency": "acbddb",
            "totalDestPayment": "2",
            "description": "'彅"
          },
          "AgEBAAEAAgIAAgACAgECAQIBAAEBAQECAQEBAgAAAgA": {
            "currency": "bb",
            "totalDestPayment": "2",
            "description": "?"
          }
        },
        "openPayments": {}
      }
    ]
  }
}
''',
r'''
{
  "nodesStatus": {
    "¢¥": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AQAAAgEAAAICAAEBAQIAAQIAAgACAgECAQIAAgECAgI"
        }
      }
    },
    "F": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AAAAAAAAAAAAAAEBAAAAAAEBAAABAgABAQECAAECAQA",
          "nodePublicKey": "AQAAAAECAQEBAgEBAQICAAAAAQEBAAICAgIBAQECAAI",
          "nodeAddress": {
            "address": "dbaabbcddcdcdcdbadabbdcdabdbbcbacddbadabccaaaaaabcdcddddbcdaddadcacadcaadaaadbddccdbacbcabaddbabacccdabadcbcbaaaaaadcdcabcaccdcaabdbabbccacccabdababdbaddabdcaadacadadddcaadaccdabdcdcbdbadacadcd"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "responseOpenNode": {
    "failure": ""
  }
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "򆒁",
      "0",
      {
        "routes": true,
        "buyer": true,
        "seller": false,
        "config": true
      },
      {
        "localPublicKey": "AAABAQICAQEBAAICAgEAAAACAAEAAQEAAQABAQICAQI",
        "indexServers": [
          {
            "publicKey": "AQICAgAAAAABAgEAAAEAAQACAgAAAQAAAgECAQECAgI",
            "address": {
              "address": "adadcddbdccbaadbadbaad"
            },
            "name": "\"«"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {},
        "openInvoices": {},
        "openPayments": {
          "AQAAAQECAAIBAgACAQIAAg": {
            "invoiceId": "AgIAAAACAAIAAgIAAgIAAQICAQABAgEBAgIBAgEAAAI",
            "currency": "aabddacacccbdcc",
            "destPublicKey": "AQEBAgEBAAABAgICAgECAAEBAQEBAQECAQAAAgEAAAI",
            "destPayment": "2",
            "description": "0O",
            "status": {
              "searchingRoute": "AQEAAQEBAAIBAgICAgIAAg"
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
  "node": [
    "2",
    {
      "report": {
        "localPublicKey": "AQIBAQACAQEBAgEAAgAAAQIAAgIBAQAAAQIBAAEAAQI",
        "indexServers": [
          {
            "publicKey": "AAIBAQEBAAAAAAIBAgAAAQEBAAAAAAICAQECAQEBAQI",
            "address": {
              "address": "ddcabcccbd"
            },
            "name": "@"
          }
        ],
        "optConnectedIndexServer": "AgEAAgIBAgIAAgECAgEAAAECAQACAQAAAAACAgIAAQI",
        "relays": [
          {
            "publicKey": "AAIAAAEBAgACAAABAAIAAAABAgABAAIAAAEBAAEBAAA",
            "address": {
              "address": "ddccaccbcdadadcacaaaabaadbbbdbccacaaccbbacbddcdccbdccdcdac"
            },
            "name": "\u001a"
          },
          {
            "publicKey": "AAABAQIBAQEBAAABAgABAAIAAQABAQEAAgAAAQECAAA",
            "address": {
              "address": "abaaddcccacdcaadcdddaaaad"
            },
            "name": "1󫛀"
          }
        ],
        "friends": {
          "AAIAAAABAQIBAgABAQABAAIBAQECAgECAAIBAAEAAQA": {
            "name": "韲!",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "aacdcaacbbdadbb": "0",
                  "abcd": "-3"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AQEBAQEBAgABAgAAAQECAgECAgIAAQIAAQABAgICAQEBAAAAAQIAAQABAAACAAEBAAIAAAIBAQABAgABAgACAg",
                  "balanceForReset": {}
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
  ]
}
''',
r'''
{
  "node": [
    "0",
    {
      "paymentCommit": {
        "paymentId": "AQICAAEAAgABAAECAQECAg",
        "commit": {
          "responseHash": "AgECAAACAQECAgIBAQACAQABAAAAAgIBAgEBAQABAAI",
          "srcPlainLock": "AQICAAIAAQAAAQACAgEBAAABAgIBAAICAQACAAIAAgA",
          "destHashedLock": "AQIBAAAAAgECAAIAAgACAgIBAAIAAQEAAgABAAAAAAE",
          "destPayment": "1",
          "totalDestPayment": "2",
          "invoiceId": "AgIBAgABAQEBAQACAQIBAAAAAgIAAQICAQIAAAIAAAE",
          "currency": "aadbaaaddbcc",
          "signature": "AQIBAAEAAAABAAIAAAIBAQECAAICAQECAAICAgACAgIAAgEBAAECAQECAAEAAQAAAAIBAQECAQIBAAACAgAAAg"
        }
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "0",
    {
      "paymentCommit": {
        "paymentId": "AAAAAAEBAQIAAgEAAAABAA",
        "commit": {
          "responseHash": "AAAAAgEAAAEBAgICAAEBAgABAQECAgICAQIBAQAAAgI",
          "srcPlainLock": "AAEAAAACAgACAQIBAAEBAQECAgEAAQECAQEAAQECAAE",
          "destHashedLock": "AgICAQIBAQABAgEAAgEAAAECAAACAgEAAQACAQECAgI",
          "destPayment": "0",
          "totalDestPayment": "0",
          "invoiceId": "AgEBAgACAAECAgIBAgICAgIAAgIAAQAAAAICAQEAAgE",
          "currency": "bdbdb",
          "signature": "AgIAAAEBAgABAQIBAQEBAAACAgIBAgIAAgIBAQEBAAIBAgACAgEBAgEBAQIAAAEAAQIAAgACAgEAAgIBAgIBAQ"
        }
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "0",
    {
      "paymentFees": {
        "paymentId": "AQECAQECAAECAAABAgIAAQ",
        "response": "unreachable"
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "Ύ4": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AQACAgEAAQICAAICAQIAAQEBAAEAAAIAAAICAgACAQE",
          "nodePublicKey": "AQIAAQIBAAAAAAICAAECAgECAAACAAEBAAEAAgACAgI",
          "nodeAddress": {
            "address": "adcddadcadcdccabbcbacabbbbaacbabddbcbcababbdacddbcbbbdcbbaddbdbacbabcdddcaabaacadaddadacadbcaacddcabdabbbabdaaabcddbcadcccdbcbdbadbbcaaaadbabbbdabbacaaccbacddabddbddacbbcaddbdbcddcadbdadbcdbadcaacccdccadcdddddcbcbadcdcbbdbddccbadcccccbca"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "]": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AAACAQACAgAAAgICAQECAgAAAAIAAAICAgECAgICAgE",
          "nodePublicKey": "AgAAAgIAAgECAQIBAgACAgECAgIBAAABAgEBAAECAAI",
          "nodeAddress": {
            "address": "dabadccdabdcacbdadbaacbbbcbdaabdacadbdaccabdbbbadcbcabccaddacabddadabbdcabdcbaabcdbabdddadadbdcbdbacbdbbbac"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "",
      "2",
      {
        "routes": false,
        "buyer": true,
        "seller": true,
        "config": true
      },
      {
        "localPublicKey": "AQIAAAIBAQACAQACAQAAAQIBAgAAAgABAQEBAQIBAQI",
        "indexServers": [
          {
            "publicKey": "AAICAgECAQAAAAEAAAACAAIAAQECAgAAAgIAAAABAAA",
            "address": {
              "address": "c"
            },
            "name": "⁄"
          },
          {
            "publicKey": "AQIBAgIBAgABAAIBAAEBAQIBAQEBAgECAgACAAIBAQI",
            "address": {
              "address": "abbcdaabccbaadaaccabdbabcdaaddcaaddabdadcaabacabacadcbadbbccdddacbadcbbaccccadcddbadbccadaaaadbaabbaaccabaddacdacdcdbdbbccdaccdacbdbdcaaacdbcbaaacdbbcddacbdbcaca"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": "AgEAAAEAAgIAAgECAQEBAQACAQEBAQABAgIAAgIAAAI",
        "relays": [
          {
            "publicKey": "AgIBAgAAAgIBAQACAgEAAgIBAgICAQACAgACAAICAgE",
            "address": {
              "address": "cbcadddddbdbabaacbcbacabbbcbddaccacdccaaadbbaabbbdaaaaadddacaaacaadabdddaabdacacabdabacbbdadbddcadcbdcdacaabccdabdcbaaabcdbacdcbabacdcadcadccabdbdbbaaabccabdcdcdbadddcbcba"
            },
            "name": ""
          }
        ],
        "friends": {
          "AQACAAECAgEAAgICAQEBAAICAgEAAQEAAAICAQIBAgI": {
            "name": "􀀀",
            "currencyConfigs": {
              "abdacaaabbaac": {
                "rate": {
                  "mul": 2,
                  "add": 1
                },
                "remoteMaxDebt": "2",
                "isOpen": true
              },
              "addaaac": {
                "rate": {
                  "mul": 2,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "da": "2",
                  "bcdbcabcbcbdd": "-3"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AQECAAIBAAIAAgECAgICAQAAAQACAgIBAAECAgICAQE": {
            "currency": "cacadbdddcd",
            "totalDestPayment": "1",
            "description": ""
          },
          "AQIAAQEAAAACAAEAAgEBAQEAAgIBAgICAAEAAAIBAAE": {
            "currency": "cddadcacba",
            "totalDestPayment": "2",
            "description": "\u0015"
          }
        },
        "openPayments": {
          "AAICAQICAAACAQABAgABAA": {
            "invoiceId": "AgIAAQECAQIAAAEAAQIBAgIBAQACAAIAAQIBAQICAAI",
            "currency": "abbd",
            "destPublicKey": "AgACAQABAQABAQIAAQEBAQAAAQACAQEAAgACAQIBAQE",
            "destPayment": "1",
            "description": "@\u001b",
            "status": {
              "failure": "AQABAAIBAgEBAAIBAQABAA"
            }
          },
          "AAACAQABAgIBAgIBAAEBAQ": {
            "invoiceId": "AQEAAgEAAgEBAgICAQIAAgEAAQIAAgAAAgECAAEAAQE",
            "currency": "babd",
            "destPublicKey": "AQEBAAECAQABAQAAAgIBAgAAAgECAQIBAAABAAEAAQI",
            "destPayment": "1",
            "description": "",
            "status": {
              "commit": [
                {
                  "responseHash": "AgIAAQACAQEBAgACAgEBAAACAQAAAQIAAQIAAQAAAQA",
                  "srcPlainLock": "AgEBAAECAQACAAABAgECAAEBAAAAAAIBAAIBAQAAAQI",
                  "destHashedLock": "AgIAAAACAQACAQABAQECAAEAAAABAAECAAIAAAEAAQA",
                  "destPayment": "0",
                  "totalDestPayment": "2",
                  "invoiceId": "AQICAQIBAQEBAgECAgACAQECAAECAgIAAAECAQECAgE",
                  "currency": "bdabccacbcca",
                  "signature": "AgIBAAECAQACAAECAgIAAAICAAEAAAICAQICAgIBAgACAQAAAQIBAAECAgECAgIAAgIBAAACAAEAAAAAAQABAg"
                },
                "0"
              ]
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
  "node": [
    "1",
    {
      "paymentDone": {
        "paymentId": "AAAAAAEBAAIAAQIBAAIBAQ",
        "status": {
          "failure": "AgECAgEBAgIBAgAAAAECAA"
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "node": [
    "2",
    {
      "responseVerifyCommit": {
        "requestId": "AgIAAgEAAQECAQICAAABAQ",
        "status": "failure"
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "_j"
  }
}
''',
r'''
{
  "node": [
    "2",
    {
      "responseVerifyCommit": {
        "requestId": "AgICAQIAAQEBAQEBAQAAAQ",
        "status": "failure"
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "failure": ""
  }
}
''',
r'''
{
  "node": [
    "2",
    {
      "paymentCommit": {
        "paymentId": "AQAAAgICAgIBAQICAQAAAQ",
        "commit": {
          "responseHash": "AQIAAgEAAAIBAAICAAEBAAIAAgEAAgABAgICAQABAQE",
          "srcPlainLock": "AQICAQEBAgICAAEBAQIBAQIBAgEBAgEAAAABAAIBAAE",
          "destHashedLock": "AAECAAEAAQAAAgAAAgACAQIAAgIBAgECAAICAQICAAI",
          "destPayment": "0",
          "totalDestPayment": "2",
          "invoiceId": "AAAAAQEAAgEAAQEBAAEAAQEAAgACAQEAAgACAQAAAgE",
          "currency": "abaa",
          "signature": "AQIAAQICAQAAAAEBAQIAAAEAAAACAAIAAgABAAEAAgABAgICAQICAQICAAABAgEAAgAAAAIBAAIAAgAAAAEBAA"
        }
      }
    }
  ]
}
''',
r'''
{
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
''',
r'''
{
  "nodesStatus": {
    "b": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAECAQAAAAACAAEBAQIAAgIBAAIAAgIBAgICAQIBAAE"
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AgICAAACAAICAQICAQACAQEBAAACAQABAQECAAABAgA"
        }
      }
    },
    " 󩣤": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AQICAQEBAgAAAgAAAAIBAgABAAAAAQABAgAAAAACAgA",
          "nodePublicKey": "AQIAAQECAgECAAACAQECAgEBAQAAAgIBAgACAgECAgA",
          "nodeAddress": {
            "address": "dbdadadabdccccadcbbaccbdbbabcaababdcdaaccdacdb"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "report": {
        "localPublicKey": "AQACAAICAgIAAgECAAACAQAAAAAAAAIAAgICAQIBAgA",
        "indexServers": [
          {
            "publicKey": "AAACAAEAAAABAgICAQEAAAEBAQACAgACAAEBAQAAAgA",
            "address": {
              "address": "aadbdcbbdadacddabbdbdcdacdddbccabbbbcaacccdcbbdbbadbcbdadbcdcdccbabdbcadbcbcdaddabbabddadccbaadabbaadacadbbbadcdaddbcddcbbccddddcdaabcdbdddcbaaccddaccabccbabdbadabbbbcbbabbdabdbc"
            },
            "name": "O?"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAACAQEBAAEBAQICAQIBAQICAQIBAgABAAABAQIAAAA",
            "address": {
              "address": "baacabaabadbcddacddcacadacccabcbdcaaccabbddbadbbdadbcdbacbd"
            },
            "name": ""
          },
          {
            "publicKey": "AQEAAQECAgABAgABAgACAQECAQECAgABAgEBAgECAQA",
            "address": {
              "address": "daddbcdacbbadccddbddadbcaadccbcbcdccddacaaacddacbcaaddcdbacaccdaddbabbcdbdbcdabb"
            },
            "name": "$"
          }
        ],
        "friends": {
          "AgIAAAABAgIAAAIBAQAAAgECAgAAAQIBAAECAQACAAI": {
            "name": "R￸",
            "currencyConfigs": {
              "ddbcbb": {
                "rate": {
                  "mul": 2,
                  "add": 0
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AQIAAQAAAQAAAgIAAQAAAAACAQICAAEAAQIAAQACAQI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgICAQACAAIAAQACAQACAQACAAACAAECAAEAAgECAgI",
                  "remotePublicKey": "AQAAAQAAAAICAAIBAQABAAIAAAICAAACAQICAgEAAQI",
                  "balances": {
                    "dadba": {
                      "balance": "-3",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "0"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "1",
                  "moveTokenCounter": "2"
                }
              },
              "randNonce": "AQEAAAABAQEBAgEBAQEBAA",
              "newToken": "AAAAAgECAgAAAAIBAAEBAQECAQICAAIAAgIBAgABAgABAQEBAgAAAQAAAgECAAIBAQIAAgIAAAECAAAAAQEBAQ"
            },
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "bccacd": "0"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AgAAAgIBAQEBAAIBAgABAAAAAgECAAAAAgACAAECAQICAAEBAgIAAQAAAQACAQIAAgIAAAICAgECAAICAAEBAQ",
                  "balanceForReset": {}
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {},
        "openPayments": {
          "AQIAAAEBAQEAAAABAQABAQ": {
            "invoiceId": "AQICAAICAgAAAQEBAgICAQIAAAICAAACAAACAQEAAgI",
            "currency": "bdcba",
            "destPublicKey": "AAABAgACAQIAAgAAAgACAgECAAAAAQEAAgIBAgACAAE",
            "destPayment": "1",
            "description": "",
            "status": {
              "failure": "AAEAAgEAAgECAQEAAAABAA"
            }
          }
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AQAAAAEAAQABAQECAQICAQEAAgACAgABAgACAQIAAQE"
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "P?": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AQAAAAIAAgICAgEAAAIAAAIBAgACAAEAAQIBAQICAgA",
          "nodePublicKey": "AgIBAQEAAgABAQIAAgICAQEBAAEAAAACAQEBAAAAAQA",
          "nodeAddress": {
            "address": "dbbdccbbdcbdaabdccbaaabbccabddcbabddaacadcdccdcbbccbaaaaaabdadbcdadccacabcabddcbaddabcbddaccbdbddaacbcabadabdbbacbbcacdbbccdccdddcacabaccdbab"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "\u0007": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAEBAQECAgACAgIAAAEBAQABAAECAAACAQECAgECAQE"
        }
      }
    },
    "=": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AQECAAEBAgABAgIBAgACAgEBAAIBAAEBAAEBAAABAAE"
        }
      }
    }
  }
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "Q",
      "2",
      {
        "routes": true,
        "buyer": true,
        "seller": true,
        "config": false
      },
      {
        "localPublicKey": "AQICAgEAAgEAAgIBAgEAAgEBAQIAAQIAAgACAQACAgE",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AQAAAAECAQACAQIBAAIAAAACAAIAAQABAQAAAgEBAQI",
            "address": {
              "address": "cbcddccaacccacaccdbbccddbcdaabbbbcadabbdccdbdcbbbcbadabcbacbbcabbacbcbdcdbaddababbdaaadabbbaccbcbbbadabcacaccbcaaddcdbcaaabbbccabadcbbcacdbccbccbccddaadbbbbdcbbccdbbcdddacddbaabaddbbbdbccccbbacdcdbadaacbbacbcbadbcbadcabdd"
            },
            "name": "©2"
          }
        ],
        "friends": {
          "AgIBAQACAQIBAgECAAEAAgIAAQEBAAIAAQIBAAACAgA": {
            "name": "y",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "bcbbcdd": {
                    "balance": "-3",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "1"
                  },
                  "cbbacddcc": {
                    "balance": "-1",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "1"
                  }
                }
              }
            },
            "status": "disabled"
          },
          "AAACAAAAAAIAAgECAgACAQIAAQECAgABAQICAQEAAgE": {
            "name": ";$",
            "currencyConfigs": {
              "caccdbcdccd": {
                "rate": {
                  "mul": 0,
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
                  "acdcbdba": "2"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {},
        "openPayments": {}
      }
    ]
  }
}
''',
r'''
{
  "node": [
    "2",
    {
      "report": {
        "localPublicKey": "AQICAQAAAgAAAgABAQEAAAIAAAAAAAICAAEAAAAAAgE",
        "indexServers": [
          {
            "publicKey": "AgICAQICAAAAAQEAAgEAAQIAAgACAAEAAQIAAQEAAgA",
            "address": {
              "address": "bcbbdbddbcdccdbabcaabdacbcbabacbabadbdbbadcbdcdaccacbcbcbbcbabbcadaabdddabcdacbacacbadaad"
            },
            "name": "ꧻs"
          }
        ],
        "optConnectedIndexServer": "AQACAQACAQACAgABAQEAAgACAgIBAQACAAEBAAAAAgA",
        "relays": [
          {
            "publicKey": "AAABAgICAQABAQACAAABAgEAAAIAAAIBAgIAAQECAgI",
            "address": {
              "address": "dbbcdcddbadcdbaadbdbbccbacdaacdabcdbaddddccabdadabbbccdababbdcbcdaadcaabbbdcbaabcddbacbbcdbcccdaaaaddadddddbcbddcbbddcbdababcbccabbdadbcabaddbabdadcbbbdaadbddbdaabdbdcadcaddbdcbbcdccbdcbadbbc"
            },
            "name": "?"
          }
        ],
        "friends": {},
        "openInvoices": {},
        "openPayments": {
          "AAABAAECAQACAQIAAQABAA": {
            "invoiceId": "AgICAQECAQABAAIAAgACAQABAAIBAAIAAgAAAAIAAgE",
            "currency": "dbcc",
            "destPublicKey": "AQACAQICAgAAAAECAgAAAQIBAQIAAQABAQIAAgAAAAI",
            "destPayment": "2",
            "description": "`",
            "status": {
              "commit": [
                {
                  "responseHash": "AQICAQEBAAEBAgIBAgICAgECAQABAQIAAgIAAAEAAQE",
                  "srcPlainLock": "AAEAAQAAAQECAgEBAgIAAQIAAQEBAAABAQICAgECAAI",
                  "destHashedLock": "AgECAQICAgIBAAIBAQECAQABAQAAAQIAAAABAgIBAQA",
                  "destPayment": "2",
                  "totalDestPayment": "2",
                  "invoiceId": "AQIBAgEAAAEBAAECAAECAAABAQABAAACAQIBAgEAAAI",
                  "currency": "dac",
                  "signature": "AAECAQIBAQIBAAECAAACAAECAgEAAQIBAAECAAICAAEBAAAAAAACAgACAAIBAQIBAAEAAQEAAgEAAgIAAQECAQ"
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
''',
r'''
{
  "node": [
    "2",
    {
      "responseVerifyCommit": {
        "requestId": "AAIAAgAAAAAAAgECAQABAA",
        "status": "failure"
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "?"
  }
}
''',
r'''
{
  "nodesStatus": {
    "󰀀i": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AgACAAIAAAEAAQACAgEBAQEAAQICAgIAAQABAQACAgA",
          "nodePublicKey": "AAACAgECAAICAQIAAgAAAAICAQICAQEAAAIAAgEBAgE",
          "nodeAddress": {
            "address": "cbcdccdcdbbbaccdddcbddacadcdbcaaadbddcacbbaaaaacbacaddbdabbccabacaabaabdbacbddcdaacbbcadadcdbbddcaadcdcddddddcacbbbdabcdccadcbccaabdccababbaccdaaabccbacdccddddbdadabbcdbddcadcbcbcadacdcaddcbddcacbbc"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "responseVerifyCommit": {
        "requestId": "AgACAgIAAgICAQAAAgICAg",
        "status": "failure"
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "",
      "2",
      {
        "routes": true,
        "buyer": false,
        "seller": true,
        "config": false
      },
      {
        "localPublicKey": "AAECAAAAAQIAAAECAQICAAABAAABAAIAAgAAAgEBAgE",
        "indexServers": [
          {
            "publicKey": "AQIBAAIAAAAAAAIAAAAAAQABAgIAAgABAQIAAAIAAAA",
            "address": {
              "address": "dccdacabbcbadadddccbacabbabcbcaccddcdbbddaccaababbcbbdccacacbcbbcbbbbbcdadbdddcdabaccacccbbdbbaccbdacaadbcbdddadbdbdacbcabbbdbbcaabbccbabdbdaca"
            },
            "name": "X"
          },
          {
            "publicKey": "AQACAAIBAgAAAgEAAAIBAQACAgACAgACAAECAAACAAE",
            "address": {
              "address": "dadccbaddcabdaacbbdbccddccdaabccbacbdccbcbcbcdacbdabcddbbdbcddcdbadddcbbbdbacdbcbcadaddccbddbbbaadbbdbcdcccbdad"
            },
            "name": "䎋\u0016"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {
          "AAEAAgIBAgICAAICAQEAAgABAAIAAQECAgABAQACAQA": {
            "name": "!",
            "currencyConfigs": {
              "aadbaacadccbab": {
                "rate": {
                  "mul": 2,
                  "add": 0
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {},
                "optRemoteResetTerms": {
                  "resetToken": "AgEBAAAAAgICAAECAAECAAABAQACAgIBAgECAQIBAQEAAAACAQICAgACAQECAgIAAQIBAAABAgABAQACAAEBAQ",
                  "balanceForReset": {
                    "aabca": "2",
                    "accbbabbbbc": "2"
                  }
                }
              }
            },
            "status": "disabled"
          },
          "AgEBAgIAAAECAQEBAQACAgACAgEAAQAAAAIAAgIAAgE": {
            "name": "",
            "currencyConfigs": {
              "accbbadbdbba": {
                "rate": {
                  "mul": 2,
                  "add": 1
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
                  "bdaad": {
                    "balance": "1",
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
          "AQICAgACAgACAAAAAAIAAAAAAAIAAQIBAgIBAQAAAgE": {
            "currency": "acddcbb",
            "totalDestPayment": "0",
            "description": ""
          },
          "AgEAAAECAgICAAIAAgABAgIBAQECAgEBAQIAAAEBAgE": {
            "currency": "dcdccbd",
            "totalDestPayment": "0",
            "description": ""
          }
        },
        "openPayments": {
          "AQEAAgIAAgEBAgABAQECAA": {
            "invoiceId": "AgIAAQIBAgEBAQEAAgAAAQECAAIBAgEBAQEBAQIAAQE",
            "currency": "cddaddacc",
            "destPublicKey": "AQIBAQABAgICAgABAAEBAQACAgEBAAEBAAIBAQICAgA",
            "destPayment": "1",
            "description": "큯",
            "status": {
              "foundRoute": [
                "AAIBAQAAAgIAAgAAAAECAA",
                "1"
              ]
            }
          },
          "AQICAQACAgECAQEBAAIBAA": {
            "invoiceId": "AAACAgEBAQABAgECAgECAQACAQEAAgICAQIAAgACAQA",
            "currency": "dd",
            "destPublicKey": "AQIAAQIBAgIBAAEAAQICAQEBAgIBAAACAQEBAAEBAAI",
            "destPayment": "1",
            "description": "",
            "status": {
              "searchingRoute": "AAECAgACAgIAAAICAgABAA"
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
  "nodesStatus": {
    "[": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AgECAQIBAAEBAAABAgAAAgAAAQAAAgECAgAAAAIAAgI"
        }
      }
    },
    "": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AQIAAQEBAAABAgIBAAEAAQICAQEBAAEAAAECAQACAQI",
          "nodePublicKey": "AgIAAAEAAQIBAQAAAQABAAACAgAAAQACAAAAAgIAAQI",
          "nodeAddress": {
            "address": "badbdcabcdacbdcbcac"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "񒃝": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AgIBAAIAAQIAAQECAAEAAAEAAQICAQEAAgEBAgICAAA",
          "nodePublicKey": "AQACAQEBAgIAAQEAAQIBAQIBAgICAQIBAAECAQICAgA",
          "nodeAddress": {
            "address": "ccadddccbbadccccdbadcdcbbdddddaaccdabcbdbbaadacbdadbabaadbddbbaddcdbbdacdcdadddbdaccccadbddcdbdabcadddadddbdcacbacaaddaddccabbdcaccdadcbbdbbbadbdabdddaabddcbacbacaccdbadbacbaddcdabddbaddaacbbcdabccbdcaccbbdabdbaaadbadadbababcacdddbaaabca"
          }
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {}
}
''',
r'''
{
  "nodesStatus": {
    "B": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AgACAAACAAICAgEBAAEAAQECAgABAAECAAEAAAIAAgI",
          "nodePublicKey": "AgIAAgIAAQEAAQECAAIBAAACAQAAAgACAAABAAABAAA",
          "nodeAddress": {
            "address": "dacbdbbbdadadbcabddbbdaaaccaaacacdacbadbcaacbbdcbccacdabababdcbddbdddcdbcacdbcddcaccdabccbaddadbacdbcbdadcbacaaaccdcaabcbbcbaacbccbbccacaabadabacdacdbaadaababdbcdacdabdccbbbacadaccbabcaabdcdadbcbaacbdcacbcabdc"
          }
        }
      }
    },
    " 2": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAECAQICAgABAAECAgICAAECAgACAAAAAAEAAgIAAgI"
        }
      }
    }
  }
}
''',
r'''
{
  "node": [
    "2",
    {
      "paymentCommit": {
        "paymentId": "AAABAAECAAACAgECAgACAQ",
        "commit": {
          "responseHash": "AQIAAAIAAgIBAAECAQICAgECAAACAQECAQICAQIBAQE",
          "srcPlainLock": "AgEBAAAAAgEAAAIBAQEBAAACAQABAAEBAAEBAgIBAQI",
          "destHashedLock": "AAIAAAAAAgEAAgACAgAAAQEBAAAAAAEBAgAAAQIBAQI",
          "destPayment": "2",
          "totalDestPayment": "2",
          "invoiceId": "AgEAAAICAAECAQEAAgEBAgIAAQICAQABAgABAgIBAQI",
          "currency": "bdccaacdbbca",
          "signature": "AQAAAgACAQEAAgAAAQAAAAIAAgEAAQEBAQABAQICAQICAAEBAgECAQIAAQICAAICAQIAAAAAAAEAAAABAAAAAg"
        }
      }
    }
  ]
}
''',
];

// -------------------------------------
final userToServer = [
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "",
      "appPrivateKey": "AQACAAIBAAECAQIBAQIBAgIBAAABAQEBAQIBAQEAAQIBAAEBAAAAAQAAAQECAQABAAEAAAIAAgICAAABAAICAgIBAgABAQECAQIAAgIBAgICAAICAQ",
      "nodePublicKey": "AQIBAQEAAQIBAQACAQABAAEBAQECAQIAAQIBAAECAgE",
      "nodeAddress": {
        "address": "caaaabcddcabbabdbacbdcddcbbcbdbdbadacaadbcacdadbbcdcabcddcaabcbddcabcdbabdbd"
      }
    }
  }
}
''',
r'''
{
  "removeNode": ""
}
''',
r'''
{
  "requestOpenNode": "㋠"
}
''',
r'''
{
  "removeNode": ""
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": ""
    }
  }
}
''',
r'''
{
  "removeNode": "@"
}
''',
r'''
{
  "closeNode": "0"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": " ",
      "appPrivateKey": "AgICAgEAAQEAAQIAAgEBAgIAAgIAAQEAAQEAAQECAAICAgEBAQICAAEBAgACAAABAQECAAACAQIAAQEAAQECAQECAAICAQICAgIBAgABAAEBAAECAQ",
      "nodePublicKey": "AQAAAQEAAgICAAEBAgIBAAEAAAIAAQACAgIBAgABAgE",
      "nodeAddress": {
        "address": "baabdacddbabcccaaddcdacdddaacddadbbabcabdbbbddcacaaddbadaaabcdaabccdacccbadaaddbdabcdddbbadabcbcbacdcbcacbacccddbbaacacacbdcacddbaccdcacaabccacbdabcbbcddaacbcadbbdbbccaabccabbbabbacdcabcaadadbccdadabacdcdbdbddbdaabccbdbcdcbbabacb"
      }
    }
  }
}
''',
r'''
{
  "removeNode": "="
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "5㣃"
    }
  }
}
''',
r'''
{
  "closeNode": "1"
}
''',
r'''
{
  "removeNode": "뚹&"
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": ""
    }
  }
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "removeNode": "^"
}
''',
r'''
{
  "removeNode": "⁈"
}
''',
r'''
{
  "requestOpenNode": "\u0015"
}
''',
r'''
{
  "removeNode": "\u000f"
}
''',
r'''
{
  "closeNode": "1"
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "3#"
    }
  }
}
''',
r'''
{
  "removeNode": ""
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "node": [
    "0",
    {
      "openFriendCurrency": {
        "friendPublicKey": "AgEAAQECAgEAAgAAAAAAAgEBAQEBAgICAAIAAAEAAQE",
        "currency": "badbbbbddcccaca"
      }
    }
  ]
}
''',
r'''
{
  "node": [
    "2",
    {
      "cancelPayment": "AQACAgICAAIAAQEBAQECAg"
    }
  ]
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "軟",
      "appPrivateKey": "AQACAgIBAQACAgIBAgEBAQEAAQACAgEBAgACAAEAAQAAAAABAAAAAgEAAgICAQABAgECAAAAAQECAAIAAgIBAgEAAQECAAEAAQICAAIBAAICAgECAQ",
      "nodePublicKey": "AQIAAAICAgIBAAAAAAICAAABAQABAQEBAgICAgACAAE",
      "nodeAddress": {
        "address": "daabbbbbbabcabbbabcabdacadcbdcaddadadccdaacabcbcdcdabababdacaaddccdabaccccabbdbaadcbbacbadcabaaacdcdaadbdcd"
      }
    }
  }
}
''',
r'''
{
  "removeNode": ""
}
''',
r'''
{
  "removeNode": ""
}
''',
r'''
{
  "closeNode": "1"
}
''',
r'''
{
  "closeNode": "1"
}
''',
r'''
{
  "node": [
    "0",
    {
      "disableFriend": "AAIBAgIBAAAAAgEBAQABAAEBAAAAAQIAAAEAAAEBAAE"
    }
  ]
}
''',
r'''
{
  "removeNode": "k"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "]⁋",
      "appPrivateKey": "AgACAQEAAAAAAAIAAgIAAAIBAQIBAQIAAQEAAAEBAgEAAAACAgIBAAACAAABAgECAgECAAAAAQACAgEBAAEAAQECAQACAQAAAAEBAQABAgEAAAABAA",
      "nodePublicKey": "AgIBAgABAQAAAQACAQECAAEAAgECAAECAQIAAgICAgI",
      "nodeAddress": {
        "address": "cbdaaababbbcbccdbbdcbcaabdbcdabadcdcacdadabbaaddaddcaabcbbcbcddcbddbacdbcaacabddddcabcadabdbcaccbbaadcdcd"
      }
    }
  }
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "᠎)"
    }
  }
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": ""
    }
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "ackPaymentDone": [
        "AAICAQEAAAEAAQICAAIBAg",
        "AAICAAABAQECAgICAgECAg"
      ]
    }
  ]
}
''',
r'''
{
  "requestOpenNode": "Z?"
}
''',
r'''
{
  "closeNode": "0"
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": ""
    }
  }
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "removeNode": "徊\""
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "requestOpenNode": "71"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "\t馈",
      "appPrivateKey": "AQECAQACAAICAgAAAQABAgEAAQEAAAIBAQIBAQACAgEBAgABAgIBAQACAQAAAgABAAEBAgAAAgEBAgACAAIBAQEBAQEAAAEAAAIAAQABAgACAQICAg",
      "nodePublicKey": "AQIAAAIBAQEAAQECAAICAQAAAAAAAAIAAQEAAgIBAgE",
      "nodeAddress": {
        "address": "bddababcddcdaabcccddbdcbdcbbaacdccaacdddbacabdacabdadcdadacabbddcabbdcccbccdbabaacadaddabbaadabbadadcabaccbbbabbdbbbcadccbbdabbbdddcbdcbbbdacddaccabcabaacaccb"
      }
    }
  }
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "=4",
      "appPrivateKey": "AgAAAgICAQACAgIAAAIAAQACAgEBAQICAQEAAAEAAQAAAAABAgECAgECAgAAAgICAQACAQEBAQEAAAEAAgIAAAIAAgECAgAAAgACAgABAgICAQABAQ",
      "nodePublicKey": "AAEAAgAAAAECAQAAAgAAAQECAAACAQABAQEBAQECAAA",
      "nodeAddress": {
        "address": "abcabcdacddaabcdaadbccdcccdabbadcbabdbcaaaaacccddcdcabbadbaaddbdddcaccdaabddbcacaaddbbaaccddbdddccbbaadcaacaadabbbcaaccaadcacddbdadbcaaadbcaddbaaacaaacdcbabcbdccadddbbaadcbdadcdcaaaadabdbbcbdcbbdabdbdacbddbdadcbacdadbdddaabaacdbbaaccdaa"
      }
    }
  }
}
''',
r'''
{
  "requestOpenNode": "ⳙ-"
}
''',
r'''
{
  "removeNode": "/￵"
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "requestOpenNode": "5"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "~",
      "appPrivateKey": "AAIAAQIBAAIAAgEAAQICAgIBAAIAAgABAAAAAQAAAAECAQACAgEAAQIAAAECAQIBAQICAgIAAQECAQEBAQIAAgICAQABAgICAQECAAEAAAEAAgACAg",
      "nodePublicKey": "AQECAgAAAAACAgABAAACAgICAQICAQECAAECAAECAgI",
      "nodeAddress": {
        "address": "cbccadcbcaacdbdbddbbacabbaaabbbddcabbbdcabbbcacbdaaaadcbabbbdddbccbcbdacccddddcbbbabbbabdcccacaaacdbdbaadabbbaddbdadccaacbccb"
      }
    }
  }
}
''',
r'''
{
  "removeNode": "t"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "9\u0010",
      "appPrivateKey": "AAEBAAACAQAAAQEBAQABAgIAAAECAgECAAEBAQABAQIBAQACAAAAAAIAAQEAAQACAQABAQIBAAEAAAECAAICAQIAAAACAQAAAQIBAgAAAgICAQIAAg",
      "nodePublicKey": "AAIAAgIBAgEBAgIBAQACAQECAAIBAgAAAQIAAAICAAI",
      "nodeAddress": {
        "address": "cdcadabbcdbdaadadaabdbcdabbcacadcddaddaccdbabddccabadbdccacddbdaccdabadbddbcdaccaababd"
      }
    }
  }
}
''',
r'''
{
  "removeNode": "\u001c"
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "p\u000e"
    }
  }
}
''',
r'''
{
  "removeNode": "\\."
}
''',
r'''
{
  "node": [
    "2",
    {
      "addIndexServer": {
        "publicKey": "AgEBAgABAAIAAgEAAgIAAgICAAEAAgEAAQEBAAACAAA",
        "address": {
          "address": "aacbccbcbdccbddbdbacaabaddbbaababbbacdbdbbbabddbabbdbadaddbbaccabcbcaaddbdababcddcdcbdcbdadbadcbdabddddbaaaabcabaccaacacdbbcbacaadcaaccbadaaccabacccacaadcbcbaacadddddbccaabcccaacacccbadbdcdbccbaddbbad"
        },
        "name": ""
      }
    }
  ]
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": " "
    }
  }
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "눒,"
    }
  }
}
''',
r'''
{
  "removeNode": "Q񑫶"
}
''',
r'''
{
  "node": [
    "2",
    {
      "cancelInvoice": "AAECAQICAQABAQIBAQECAAAAAQACAQECAQACAgIAAAI"
    }
  ]
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "",
      "appPrivateKey": "AgAAAgICAAABAQECAgIBAAAAAQEAAAEAAQABAAIAAgABAAEBAAACAQAAAgECAAICAgABAAABAAECAQICAQIAAAIAAgEAAQAAAAEBAQAAAgEAAAEBAg",
      "nodePublicKey": "AAAAAgEAAAEAAAIBAAAAAAIAAQABAgIBAQAAAgICAgE",
      "nodeAddress": {
        "address": "dacdccddacdacac"
      }
    }
  }
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "⁊",
      "appPrivateKey": "AQABAAAAAAEAAgICAQIAAAABAgEBAgECAQICAAABAAIBAgIBAQABAgEBAgIBAAEBAgACAgEAAQEAAAAAAQEAAAEBAQEAAAECAQEAAQAAAgAAAQACAQ",
      "nodePublicKey": "AAEBAAABAgICAgEAAgEBAQEAAgIBAgABAAACAgICAgI",
      "nodeAddress": {
        "address": "ddbacbbaaaabaabbcddbccbabccccacacdaaccdbcbcddbd"
      }
    }
  }
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "@O"
    }
  }
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "6揄",
      "appPrivateKey": "AAABAQIBAgECAAABAgIBAAEAAgEAAQAAAgACAgIBAAIBAQECAgECAgECAQIBAAICAAIAAQACAgIBAgAAAAEBAQACAgACAgICAAECAAACAgECAQECAA",
      "nodePublicKey": "AgACAgIAAAACAgEBAQIAAQEBAQIAAAIBAgEBAAIBAAA",
      "nodeAddress": {
        "address": "cdaabdbddccbbcbaabdcbdbdbacacbcdaccddcaddcdbbacdcbdcaddbbbdcdacdbadbbbbaaadbccddadbbcacbbaadacdcdccaa"
      }
    }
  }
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "requestOpenNode": "j$"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "",
      "appPrivateKey": "AgEAAQEAAgICAAEAAAABAgACAgIAAAICAgEBAQEAAQEAAQICAAAAAQIBAgECAAACAQECAgIBAQICAAABAgECAQICAAACAQIAAgICAQIBAAAAAAECAg",
      "nodePublicKey": "AgIAAQICAgEBAgIAAAECAQEBAgEAAQICAgEBAgIAAAI",
      "nodeAddress": {
        "address": "dadadbcaccccdbbbaaaacabdcbaabbcddadccbbbaadcdcbdacbcabddadcaacddcbacdcdabbbbbddbddbbcbacbdbbbdaababaccdddabdcadadd"
      }
    }
  }
}
''',
r'''
{
  "closeNode": "1"
}
''',
r'''
{
  "requestOpenNode": "«f"
}
''',
r'''
{
  "node": [
    "1",
    {
      "closeFriendCurrency": {
        "friendPublicKey": "AgIBAAICAgIAAgAAAAICAAIAAgABAAICAAAAAQACAgE",
        "currency": "cdcaa"
      }
    }
  ]
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "",
      "appPrivateKey": "AAIAAAICAgIBAQIBAAABAgACAQEBAQIAAQEAAgACAAEBAQIAAAABAQIAAQAAAgACAQECAgECAgICAgECAAEAAgACAAABAQIBAgECAQECAQICAAAAAA",
      "nodePublicKey": "AQABAQAAAQEAAgAAAQICAgEBAgAAAAECAgACAAABAAI",
      "nodeAddress": {
        "address": "bbdccdbddabdbdbccdadcacdbcaacddbadccdcccdacdcaacdbcbaacbbbdadbaddcaddcbcbbacbcab"
      }
    }
  }
}
''',
r'''
{
  "closeNode": "0"
}
''',
r'''
{
  "node": [
    "0",
    {
      "cancelInvoice": "AAECAQAAAQEAAgEBAAEAAgIAAgACAgEBAgECAQABAgA"
    }
  ]
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": ""
    }
  }
}
''',
r'''
{
  "requestOpenNode": "X¥"
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "K"
    }
  }
}
''',
r'''
{
  "node": [
    "1",
    {
      "addFriend": {
        "friendPublicKey": "AAIBAAEBAAEAAgEAAQIBAAABAAEBAAICAAACAQECAQI",
        "relays": [
          {
            "publicKey": "AAABAgIBAQEAAAIAAgEAAQEBAAIAAAEBAgEBAQAAAAI",
            "address": {
              "address": "dcbccccbccdccaccabcddcbbbbcdbaaabaddbcbbaaadbbacaccdaacdccddcbbaaaabdddabacabdadadcacddcdbbbccddbcaacaadadabccbbbabadbbbbaccbbdddcbabacddbdbadcddabdaccabdaaadadccaa"
            }
          }
        ],
        "name": ""
      }
    }
  ]
}
''',
r'''
{
  "closeNode": "1"
}
''',
r'''
{
  "closeNode": "1"
}
''',
r'''
{
  "node": [
    "0",
    {
      "setFriendName": {
        "friendPublicKey": "AQECAAABAAIAAAICAgACAAEAAgIBAAEBAgIAAAICAQI",
        "name": "雪H"
      }
    }
  ]
}
''',
r'''
{
  "closeNode": "1"
}
''',
r'''
{
  "node": [
    "2",
    {
      "cancelInvoice": "AQEAAQABAAEBAQIBAgACAgIBAgEAAAEAAAACAgICAgE"
    }
  ]
}
''',
r'''
{
  "requestOpenNode": "󏅤7"
}
''',
r'''
{
  "requestOpenNode": "A"
}
''',
r'''
{
  "requestOpenNode": "CY"
}
''',
r'''
{
  "requestOpenNode": "񝱘j"
}
''',
r'''
{
  "removeNode": "5"
}
''',
r'''
{
  "closeNode": "0"
}
''',
r'''
{
  "removeNode": ""
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": ""
    }
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "setFriendName": {
        "friendPublicKey": "AAAAAQEAAQECAQACAQEAAQECAgAAAgIBAgACAgIBAQE",
        "name": "¡6"
      }
    }
  ]
}
''',
r'''
{
  "removeNode": ""
}
''',
r'''
{
  "node": [
    "0",
    {
      "addInvoice": {
        "invoiceId": "AAAAAgABAgEAAAIAAQEBAgEAAAACAgIBAQACAgEAAQI",
        "currency": "ca",
        "totalDestPayment": "0",
        "description": "*"
      }
    }
  ]
}
''',
r'''
{
  "removeNode": "￳\u001e"
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "removeNode": "=;"
}
''',
r'''
{
  "node": [
    "2",
    {
      "cancelInvoice": "AgECAAABAQEAAQABAAEBAAABAgABAQAAAgAAAQECAAE"
    }
  ]
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
];

