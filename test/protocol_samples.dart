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
          },
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
                    "cadd": {
                      "balance": "0",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "1"
                    },
                    "aaccdcbccbabbbb": {
                      "balance": "-2",
                      "localPendingDebt": "2",
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
            "generation": "0",
            "status": {
              "searchingRoute": "AQECAgAAAQIBAQAAAAIAAQ"
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
  "responseOpenNode": {
    "success": [
      "",
      "0",
      {
        "routes": false,
        "buyer": false,
        "seller": false,
        "config": false
      },
      {
        "localPublicKey": "AAIBAQACAgAAAQICAQABAgECAgICAQECAgAAAgECAAA",
        "indexServers": [
          {
            "publicKey": "AgEAAQICAQICAgICAgECAQACAAEBAQEBAgAAAgABAAE",
            "address": {
              "address": "cabbacaabcaabcbacbdccaacaacaadbbaaaaacbadbcbccbdbabbdcabcabaaacabcadacdbcadaccdbbbabcbddcbcabaddaaaa"
            },
            "name": "5"
          },
          {
            "publicKey": "AAICAAAAAgACAgACAAAAAAABAAIBAAACAAACAQABAgE",
            "address": {
              "address": "cabbcabbaacccddacbababdddaaaaacccabbaaabdddbccdaabdadcaddccbccdcccdbddacaabdbbdbcdaaddacababbacdbbbadcbbaddbcdcdbcdaaacacccaaaadcccbbdbbdccabbdbdda"
            },
            "name": "« "
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AgECAgIBAgAAAAEBAAABAQABAQIAAQICAgABAAACAgI",
            "address": {
              "address": "aaaacabddcdcdabaaddbbdcdccbdadddcbddcddababbbababbcacadcdcacbcbbaadbcdcabcdcbacdaacbacdbdcdbaaadddabaacbaddcbccacbdaadcdbcbcabdbdcbcb"
            },
            "name": "󠀁@"
          }
        ],
        "friends": {},
        "openInvoices": {
          "AgEBAgAAAgACAAICAAIAAQABAAABAgIAAAABAQEBAgA": {
            "currency": "bcadcabbadbdbd",
            "totalDestPayment": "0",
            "description": "񸔖",
            "isCommited": false,
            "generation": "1"
          }
        },
        "openPayments": {
          "AAAAAgEBAAIBAgAAAQECAQ": {
            "invoiceId": "AQEBAAACAgIBAQABAQICAQACAQACAQICAAEAAQEAAgI",
            "currency": "acdaabcac",
            "destPublicKey": "AQEBAgEAAQECAQEBAAABAQIAAQICAQICAAACAQAAAQE",
            "destPayment": "1",
            "description": "",
            "generation": "0",
            "status": {
              "sending": "1"
            }
          },
          "AgACAQIAAAIBAAIBAQEAAA": {
            "invoiceId": "AAECAgABAAECAgIBAAECAAICAgIAAAAAAAIBAAIBAQA",
            "currency": "cbbcbddad",
            "destPublicKey": "AgECAgEAAQEAAgIAAAEAAQECAAEBAAEBAgICAAICAAI",
            "destPayment": "1",
            "description": "䎷",
            "generation": "1",
            "status": {
              "failure": "AAIBAgEBAgICAAEAAgEAAQ"
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
  "responseOpenNode": {
    "failure": ""
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
  "nodesStatus": {
    "8": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AgAAAgACAAEAAAAAAgIAAgACAQACAAECAgECAQEBAgA",
          "nodePublicKey": "AQEBAgABAgEBAQACAAABAgABAQACAQABAQEAAAEAAQA",
          "nodeAddress": {
            "address": "babbabcacabcaacbaaacbbcabbbcbadbadbdababaddcaaacacccdabbcbcccbcaccabbdaadcbcdbabccdbcddacaabdcbccababbaccccdddddddbcaddccbaaccadbbabbccddbaacabdbaadddbbdcbccacdcdccbbaab"
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
      "report": {
        "localPublicKey": "AQABAAEBAgICAQACAgIBAAABAgIBAgIAAQIAAAIBAQA",
        "indexServers": [],
        "optConnectedIndexServer": "AgIAAAIBAAEAAAEBAgIAAAABAAICAQABAAAAAAIBAQI",
        "relays": [
          {
            "publicKey": "AQIAAQIBAQICAgEAAQECAgEAAQECAgEBAgACAQAAAgA",
            "address": {
              "address": "acadbcdbcdddbcccdcdcbbbcaaaccddadddcddbdddabdbcbccabbcdadbdcabbdacccabadcbcdccbdcacdbdbdbccbdcddaccdadadcacacabbacdaaaadaabcbcdaabdcbdcdbbcbbbadabbadcabcdddabaadbdcdacadabcabcabdcdbccccddccbcdaaccadcdcdbbaaccbaaccdaababacdcbdacd"
            },
            "name": ""
          }
        ],
        "friends": {
          "AgECAQIBAAEAAQIAAAICAgECAgEBAgEAAAABAQICAAA": {
            "name": "",
            "currencyConfigs": {
              "dababaddcbc": {
                "rate": {
                  "mul": 2,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AQICAAEBAQEBAQECAQIBAAIBAQACAQEBAgECAQEBAQI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AQIBAQABAQIBAgABAgIAAQIAAAEAAgABAAICAAABAgI",
                  "remotePublicKey": "AgECAQAAAAABAAICAQAAAgIBAAABAQIAAAEAAQICAgI",
                  "balances": {
                    "ccaadacaacbb": {
                      "balance": "1",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "2"
                    },
                    "caaa": {
                      "balance": "2",
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
              "randNonce": "AgEBAAABAQIAAAEAAgIBAQ",
              "newToken": "AAIBAgIBAgEBAAICAgICAQICAAIBAgAAAAAAAgABAgICAgECAQACAAABAgIBAgIBAAACAQAAAgACAgIBAAECAA"
            },
            "liveness": "offline",
            "channelStatus": {
              "consistent": {
                "currencyReports": {}
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AQECAQAAAgAAAgEAAgIBAQECAgIAAgAAAAACAgABAQA": {
            "currency": "bddbccba",
            "totalDestPayment": "1",
            "description": "",
            "isCommited": false,
            "generation": "1"
          }
        },
        "openPayments": {
          "AgEAAAICAQEAAgIBAAICAg": {
            "invoiceId": "AgACAQACAgIBAQABAAIAAQACAAIAAgIAAQAAAAICAQI",
            "currency": "ddaccdcddbcbac",
            "destPublicKey": "AAICAgEAAQAAAQAAAQACAQAAAgACAQAAAAACAgIAAQE",
            "destPayment": "2",
            "description": "9",
            "generation": "0",
            "status": {
              "sending": "0"
            }
          },
          "AgEAAgEAAgACAAIAAgICAQ": {
            "invoiceId": "AQIBAAACAAICAAEBAgABAAEAAAEBAAECAgABAAEAAgA",
            "currency": "ddadabadc",
            "destPublicKey": "AgIAAgIBAQEAAAIBAAICAAEBAAEBAQIAAgICAQEAAQE",
            "destPayment": "1",
            "description": "",
            "generation": "0",
            "status": {
              "success": [
                {
                  "responseHash": "AAIBAgEBAQEAAgIBAQABAgACAAIBAAIBAgEAAgICAQA",
                  "invoiceId": "AgEAAgAAAQICAgACAgECAQIAAgAAAQIAAgICAQIBAgA",
                  "currency": {
                    "currency": "ddddcad"
                  },
                  "srcPlainLock": "AAAAAAEBAgACAgABAgABAAECAQACAgIAAQECAQEBAAI",
                  "destPlainLock": "AAACAAICAgAAAgIBAQAAAAACAQACAgEAAQIAAgACAAE",
                  "isComplete": true,
                  "destPayment": "0",
                  "totalDestPayment": "1",
                  "signature": "AgEAAQIAAQAAAAIAAAAAAgAAAQIBAAEBAAAAAgICAAEAAgABAQIAAAABAQIAAgACAgEAAQECAAIAAQIAAAAAAQ"
                },
                "0",
                "AQECAgECAQEBAQIBAQACAg"
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
  "responseOpenNode": {
    "failure": "0"
  }
}
''',
r'''
{
  "nodesStatus": {
    "�": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AgECAQIBAAICAQECAQIAAAIAAAEBAQEAAAAAAgEAAgE",
          "nodePublicKey": "AgEBAQEAAgICAgECAAEAAgAAAQAAAgABAAICAQECAgE",
          "nodeAddress": {
            "address": "daaacadaccaaacdacbcacadddccbccacccaaaccaadcbbbdbabcaaddacbacbbabbddd"
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
      "paymentCommit": {
        "paymentId": "AAECAgECAgECAgEAAQABAQ",
        "commit": {
          "responseHash": "AgAAAAAAAAACAgEAAAAAAAECAAICAAECAQICAgEBAQA",
          "srcPlainLock": "AAABAAAAAAICAAAAAAECAgEBAQEBAgEAAAEBAgIBAAI",
          "destHashedLock": "AgICAgEBAQEAAQIAAgIAAQABAQEBAgABAgABAQEBAAE",
          "destPayment": "0",
          "totalDestPayment": "2",
          "invoiceId": "AQIAAQABAAIBAAEAAgIBAQECAgEBAAECAAAAAgABAgA",
          "currency": "bbbdddabc",
          "signature": "AQEBAgEBAgACAQABAAAAAAABAgECAAIAAgECAQAAAQEAAAABAAACAAECAgABAgEAAQECAAECAgIBAgIBAQACAg"
        }
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "}傠"
  }
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "￶꺤"
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
  "nodesStatus": {
    "SR": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AgABAQICAQABAAEBAAEBAQABAAAAAgICAQEAAgEAAgE"
        }
      }
    },
    "": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAICAgEBAAICAQICAgICAQEAAgEBAgIBAAIAAgIAAQE"
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
      "paymentFees": {
        "paymentId": "AgACAgACAAEAAAAAAgIAAQ",
        "response": "unreachable"
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
  "nodesStatus": {
    "": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AQIAAgACAQIAAAAAAQEAAgEBAgICAgIAAQICAQEBAgA",
          "nodePublicKey": "AQACAQECAgEAAQEAAgAAAAIBAAECAgIBAgICAgEAAQA",
          "nodeAddress": {
            "address": "aababbddbcccaabacbcbbdbabbccdacadacbccadabbbaacddabbcdbccbdbcccccdcddbbcbdcdcdbabcbbacaacdcbabdcbdcad"
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
        "localPublicKey": "AAEBAgACAgAAAAIAAQACAAAAAgECAgABAAEBAAACAgA",
        "indexServers": [
          {
            "publicKey": "AAEAAAICAQEBAgAAAAEAAQACAQAAAAAAAAACAQECAQA",
            "address": {
              "address": "cdccabbbadcbbcdaccdabbbdadadcdbccccaadbbabcadcdacadbcabbacbbcdbabccdbdaccdddaddcbbacacddccdabacdbaddccbabdacdabdaaaacdcabbdccbcaddabbdacccbdccdbbcdacdbccaacdbadcccdcdabcdcbbbcddbdcbcacbaadbacaacadbaabbcbbbbdabcaccbcdbbcacddbccccaab"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAECAQAAAAABAgEAAgEBAgEBAgACAQAAAAEAAgABAAE",
            "address": {
              "address": "dbbcdcbbdabbadcbbbaccbcabcdbbabddaccadbcddbdaaadddaabcccddddcbdbaaccbddaacbbcdccaddbcccadbccbcdcbcabbdadccaabcaacdbdbadddadbbcaabaabadbdcddddaacdadbdaccbdbcdddbbccdaabcbdabcdaadbccacaabccbbaababdcabacabbabbbadbccbddcadaacacabaccadcdaadabbcbdbcbdadbdcc"
            },
            "name": "V"
          }
        ],
        "friends": {},
        "openInvoices": {
          "AAIAAQEAAQIBAAEBAQAAAAIAAAAAAQIAAQEAAQIAAgA": {
            "currency": "adbb",
            "totalDestPayment": "2",
            "description": "}",
            "isCommited": false,
            "generation": "2"
          }
        },
        "openPayments": {
          "AQAAAgABAgABAgEAAgEBAg": {
            "invoiceId": "AgAAAAIBAQAAAAICAgIAAAEAAQAAAAEAAgIBAAIBAgA",
            "currency": "aabaa",
            "destPublicKey": "AQICAAABAAAAAAEAAAEBAQACAgIAAQICAgAAAQABAQI",
            "destPayment": "2",
            "description": "񤡆",
            "generation": "2",
            "status": {
              "searchingRoute": "AgEBAAIAAAACAQACAAAAAQ"
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
    "1",
    {
      "responseVerifyCommit": {
        "requestId": "AgAAAgEBAgAAAAABAQEBAg",
        "status": "success"
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
        "remote": {
          "appPublicKey": "AQICAgIAAAICAQABAQABAAIAAAACAAICAQACAAACAQE",
          "nodePublicKey": "AQICAAEAAgICAAEAAQICAgAAAQIBAAECAAAAAQABAAE",
          "nodeAddress": {
            "address": "cbcdcdddbacdbacadbbcadacabadbcddaccabdaaaabddbacacbabcadaccbcbaccdacaacdccabcbabadcabadcbbdadadcdaabbacddbbbdbacbadccdcbdbbbcdadbdababdcbcdabcdbdbddabacddbddddabaaabddccbaabccdbdcaccbbacacacbbaddadadcccaacaabbbcaddddccbcdbbbbadba"
          }
        }
      }
    },
    ";󿿾": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AgIAAQAAAQECAQEBAQIAAAECAgACAgIBAgIBAgABAgA"
        }
      }
    }
  }
}
''',
r'''
{
  "nodesStatus": {
    "\u001d": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AgAAAAIAAAAAAAECAgECAgEBAQIBAgIAAgIBAAIAAAE",
          "nodePublicKey": "AAECAQAAAAEAAQICAQICAgACAAIAAgAAAgICAQABAgE",
          "nodeAddress": {
            "address": "aaacacaaaacababdadaccddcdabbcdaccbaadbcbbbccabdbbcdaadbaccdacdbbbadcdbbcbddaaddbdabacbdda"
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
      "paymentCommit": {
        "paymentId": "AAIAAgAAAgEAAAICAQEAAQ",
        "commit": {
          "responseHash": "AgACAAIBAAACAQAAAgEAAQICAgEAAgIBAQIAAgICAQE",
          "srcPlainLock": "AQECAQEBAQIAAAECAAECAgABAgEAAgEBAAAAAQABAgA",
          "destHashedLock": "AQEAAAEBAQACAQABAgAAAgACAQIAAAECAgIBAQEAAAI",
          "destPayment": "0",
          "totalDestPayment": "2",
          "invoiceId": "AAIAAgACAgEAAgICAQABAAIBAgICAQACAgIAAgEAAAA",
          "currency": "acdbcdaba",
          "signature": "AAIAAgECAAEBAgEBAgECAgICAQABAQEBAgICAAECAgECAAIAAgICAAABAAICAAEAAgABAAEAAQICAgAAAQAAAg"
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
        "paymentId": "AAIBAAEAAQACAAIBAgEBAA",
        "response": "unreachable"
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "ᭆ": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AAIAAQAAAAEBAQEAAQACAQEAAQECAQIAAQABAAEBAgI",
          "nodePublicKey": "AQIAAQIBAAEBAgECAgACAgACAAEBAQAAAQAAAQICAAI",
          "nodeAddress": {
            "address": "abbcaaabcdcddbcbacbddabcbcddabaaabcdbaddadaacddbabcacbabccdadcdd"
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
    "": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AQAAAQIBAAACAQEAAAIAAgIAAgABAQIAAgEBAQABAgI",
          "nodePublicKey": "AgIBAgACAgEAAgEBAgEAAQECAQECAQEAAQIBAQICAgE",
          "nodeAddress": {
            "address": "bddbdaacbadcdcdaadbdddbcddcbbccacdaabbcddacdacdcbbadcdcdada"
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
        "localPublicKey": "AAEBAAEAAAEAAQABAQECAgABAQEBAQIAAgICAgAAAAI",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAEAAAIBAgIAAAECAAEBAQECAQEAAAEBAgECAQEBAQA",
            "address": {
              "address": "dacadabcbcccaccdbdbadadadccb"
            },
            "name": ""
          }
        ],
        "friends": {},
        "openInvoices": {},
        "openPayments": {
          "AAABAgABAAIAAQICAQEBAA": {
            "invoiceId": "AQAAAAIBAgEAAQACAAIAAAEAAgEBAgIAAQICAgIBAgE",
            "currency": "d",
            "destPublicKey": "AQABAQEBAgICAQACAQABAAEAAQIAAgEBAQAAAgAAAgI",
            "destPayment": "1",
            "description": "",
            "generation": "2",
            "status": {
              "foundRoute": [
                "AAIBAgEAAgABAgEAAQECAQ",
                "2"
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
  "nodesStatus": {
    "": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAABAgIAAgABAgEBAAEAAgEAAAICAQIAAgECAAABAgA"
        }
      }
    },
    "": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AAABAAEAAgIBAQIBAQEBAQICAgECAgACAQEBAgABAAE",
          "nodePublicKey": "AAACAgACAAICAgEAAAIBAgIAAAEAAAECAAIBAgACAgA",
          "nodeAddress": {
            "address": "ccdbbdcadbbbbaabdadcdddbaacdbcabcadbdabcacdbdaddabbbbdbcdcbaabdacbcabcacbacacccaacbdddddccbbdbbbabdddcccababdccdbbbadacbdcbdaaaacabbcdaabdccccdaaccbaacdabbddaccbbaacaadbcccbadbdbbbcaaabacddcdbdccadcab"
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
        "config": false
      },
      {
        "localPublicKey": "AAAAAgEAAAECAgAAAAECAgABAQAAAQICAQABAQIBAgI",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [],
        "friends": {
          "AQAAAgAAAAABAgIBAQACAgEBAQIAAQAAAAIBAQEAAAE": {
            "name": "",
            "currencyConfigs": {
              "dbcacdddbcbdbdb": {
                "rate": {
                  "mul": 1,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              },
              "bb": {
                "rate": {
                  "mul": 2,
                  "add": 2
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "dbdacabcc": "1"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AAACAAABAQICAQEBAgACAQIBAAEBAgECAAECAQABAgICAgIAAAIBAAABAQIAAgIAAgEAAQACAAACAAIBAAEAAA",
                  "balanceForReset": {
                    "cabbbdddcabcdcb": "1",
                    "bbbdc": "2"
                  }
                }
              }
            },
            "status": "enabled"
          },
          "AgEAAQEAAgECAQIBAAICAgECAgECAgIAAQIBAQECAgE": {
            "name": "&\u0001",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": {
              "prefixHash": "AAIBAAEBAgAAAQAAAQECAAIBAAECAAEAAgICAQACAAI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AQIAAQEAAAABAgICAgEAAQAAAQEBAgIAAgEAAQAAAgI",
                  "remotePublicKey": "AAACAgEBAQEBAgECAAABAQEBAAIAAQACAgAAAQIBAQE",
                  "balances": {}
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "0"
                }
              },
              "randNonce": "AgIBAAAAAgAAAQABAQEBAA",
              "newToken": "AQAAAQABAQICAAICAAICAQIBAgABAgIBAgIAAgACAAAAAQAAAgICAgEBAgEAAQICAgIBAgEAAgAAAQEBAQACAA"
            },
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "dbcaac": "-1"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AgEAAAECAQEAAQECAQAAAAEAAgEAAQECAAEAAAAAAgAAAgAAAgICAgABAAIBAAABAQEAAQIAAgECAAEAAAEAAA",
                  "balanceForReset": {
                    "b": "-3"
                  }
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AQABAQEBAgIBAQABAAEAAQIAAgIBAgACAgACAgEBAgA": {
            "currency": "dcaad",
            "totalDestPayment": "2",
            "description": "p",
            "isCommited": false,
            "generation": "0"
          },
          "AgEBAQABAQIAAQACAQIAAQEAAQEAAQEBAQAAAgEBAgA": {
            "currency": "aaaacdbacccdabc",
            "totalDestPayment": "2",
            "description": "3}",
            "isCommited": true,
            "generation": "1"
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
  "responseOpenNode": {
    "success": [
      "",
      "1",
      {
        "routes": true,
        "buyer": false,
        "seller": false,
        "config": true
      },
      {
        "localPublicKey": "AAIAAQIAAgEAAQICAgACAAACAQEAAQEBAgEBAgACAQA",
        "indexServers": [
          {
            "publicKey": "AAACAgABAQAAAAIAAAEAAgEBAAAAAAECAAIAAQECAQE",
            "address": {
              "address": "abdbadbbdcbbccdaaccccacbcdbaabcaaddadbadacaadcbdaaabbbdccabcdbdccbddbddbdbdadddcccccdbacbbcddbcddacbabaccacddcdcbaddadcbabcaadabbadbbabadddaddbbccbaababcaabdadbabcadcbddaaaaaabbdadacaaadbacaabcaadcadacaadaadbcdabcabd"
            },
            "name": "4"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAEBAQEBAgEBAAAAAAEAAAECAQIAAAEAAAIBAQIAAAE",
            "address": {
              "address": "acdcabccaabdccbcabcbdabbcdcddbabddacbbadbacddadddddbdabbddadacbcbcbdacaddccabbcadcbbacdbaabdcdcbdbcbbccacdbadbbbbdaaadacdcbadaabdddccadcbccccbdcdaaddabacbbbdacbbdbbdcdcadabdbdbbdcbadbababadbadaadcbbbaddadbdacc"
            },
            "name": ">끆"
          },
          {
            "publicKey": "AgACAAABAAICAAIAAQEBAgECAQIAAgEAAAEBAgAAAgE",
            "address": {
              "address": "bddcbdcabddadbbaaadabdccbbdadcbbdaacdbbbdccdbcccbdbbddcadcbdbadcacaadabacdbadbcadbbbacbcdbbddacdcccbadddaaaddddabaddbcaacaadadaaddbcbdcdccbaacbcabaadadbabddddbdcbacdacbccabdbdcbdccdabadcacbddcdaacbdacabbcccccddcb"
            },
            "name": "1"
          }
        ],
        "friends": {
          "AQABAAACAQABAAICAAACAAEBAAACAgIBAgIAAQECAAI": {
            "name": "\u0006񑘜",
            "currencyConfigs": {
              "dbadcbadaa": {
                "rate": {
                  "mul": 2,
                  "add": 1
                },
                "remoteMaxDebt": "2",
                "isOpen": false
              },
              "dbabdaabcaca": {
                "rate": {
                  "mul": 0,
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
                "currencyReports": {}
              }
            },
            "status": "disabled"
          },
          "AgABAgECAAIBAQICAgAAAAACAAIBAgABAAIAAQABAAE": {
            "name": "",
            "currencyConfigs": {
              "aadcabddabccccd": {
                "rate": {
                  "mul": 0,
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
                  "cdddaacdcacd": {
                    "balance": "-3",
                    "localPendingDebt": "1",
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
          "AgEBAgEBAgIBAgIAAQEAAA": {
            "invoiceId": "AgABAgAAAAAAAAIAAgECAgIBAAIAAgIBAAIBAAICAgA",
            "currency": "ad",
            "destPublicKey": "AQACAAIBAAAAAgECAAABAgEAAgECAgIBAAACAQECAgE",
            "destPayment": "0",
            "description": "",
            "generation": "2",
            "status": {
              "commit": [
                {
                  "responseHash": "AgIBAQEBAgECAQICAgABAQEAAgECAgICAAEBAQIAAgE",
                  "srcPlainLock": "AgECAAICAAEBAAAAAAABAAAAAgICAgACAAACAgAAAgE",
                  "destHashedLock": "AgAAAQABAQIAAAEAAAIBAQIBAgECAQIAAgACAAEBAAI",
                  "destPayment": "2",
                  "totalDestPayment": "2",
                  "invoiceId": "AAEAAAAAAQIBAQIAAgAAAQEBAgECAQABAgACAgICAAI",
                  "currency": "bdadadcaca",
                  "signature": "AgICAAICAgEAAQICAgIAAAEBAQABAgACAAAAAgECAAEAAQACAQIBAgEBAgIAAgIBAAAAAAACAQECAQIBAAABAQ"
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
      "paymentFees": {
        "paymentId": "AQAAAgIBAAEAAQEAAAIAAQ",
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
  "node": [
    "2",
    {
      "paymentCommit": {
        "paymentId": "AgECAgECAAEBAgAAAgIAAQ",
        "commit": {
          "responseHash": "AAICAgIBAQACAAIAAgECAQABAQICAgACAQAAAAIAAQI",
          "srcPlainLock": "AQAAAAEBAgABAAIBAAICAAIBAgIBAAIAAAICAAABAQI",
          "destHashedLock": "AAEAAQECAgIBAQABAQECAQIAAgIAAAEAAgABAQACAQA",
          "destPayment": "1",
          "totalDestPayment": "0",
          "invoiceId": "AAECAQECAQIAAQAAAAIBAQEAAAIAAQICAgICAQIBAQI",
          "currency": "babbdacaacbbac",
          "signature": "AQACAgIBAgAAAAICAAAAAQABAgIAAQICAQIAAAEBAQEAAgIBAAAAAgAAAgEAAgICAgABAgIBAgIAAQAAAgACAg"
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AQACAQEAAgECAgIBAgABAgIAAAEAAQICAQIBAQACAAI",
          "nodePublicKey": "AgABAgICAgABAAACAgIAAgIAAgAAAgECAgIBAQABAgE",
          "nodeAddress": {
            "address": "bbadbbbbaadacbbccdbbbbbabdbcbbbdcdbcdbcbdbddccabbdccdbcbabdbccaabbddcaaccdbcbdabdcdcdccacddbaddbbaacdbabbcbdaa"
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
    "failure": "‬["
  }
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "B@"
  }
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
                    "dcbadd": {
                      "balance": "-3",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "2"
                    },
                    "dcdbabcada": {
                      "balance": "-3",
                      "localPendingDebt": "1",
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
            "generation": "2",
            "status": {
              "success": [
                {
                  "responseHash": "AQAAAAIBAQEAAgEAAQIAAAEBAAIAAAECAAECAgAAAAI",
                  "invoiceId": "AAIBAQACAAACAgIAAAECAgABAAECAAAAAQIAAQACAAI",
                  "currency": {
                    "currency": "bcdccbddbba"
                  },
                  "srcPlainLock": "AgICAgICAAECAgABAAEAAAACAAECAQIAAgAAAAACAAI",
                  "destPlainLock": "AgEAAAIAAAEBAgICAQACAAEBAQIAAQIAAQIAAAIBAAE",
                  "isComplete": false,
                  "destPayment": "2",
                  "totalDestPayment": "1",
                  "signature": "AAIAAgAAAgEAAQECAQECAAAAAAIAAAAAAAIAAgIBAgABAQICAQIBAQICAgICAgACAQABAAEAAAACAQABAAICAQ"
                },
                "0",
                "AQECAQECAgABAAIAAgACAA"
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
  "responseOpenNode": {
    "success": [
      "`",
      "0",
      {
        "routes": true,
        "buyer": true,
        "seller": false,
        "config": false
      },
      {
        "localPublicKey": "AgIAAAICAgICAQECAAACAgABAQEAAQAAAAABAgICAgI",
        "indexServers": [],
        "optConnectedIndexServer": "AQICAgIAAgEBAgEBAAIAAgEAAgECAQIBAgEAAQICAgE",
        "relays": [
          {
            "publicKey": "AAAAAQEBAQICAQICAAICAAICAAABAQIBAgEAAQEAAQE",
            "address": {
              "address": "bccbbbadbcadbdcbccababadaaddbdad"
            },
            "name": "u"
          }
        ],
        "friends": {
          "AQEAAgIBAQIBAQIBAgICAQICAQACAgECAQIBAgEBAAE": {
            "name": "",
            "currencyConfigs": {
              "dcacbddbdcb": {
                "rate": {
                  "mul": 1,
                  "add": 0
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              },
              "a": {
                "rate": {
                  "mul": 0,
                  "add": 0
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AgICAgABAgECAgECAQEAAAIBAgAAAgECAAAAAQACAAI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AQIBAQACAAECAgICAAIAAAEBAgIBAgACAAIBAgEBAQI",
                  "remotePublicKey": "AQABAQECAAEAAgICAgAAAAEAAAIAAAABAQAAAgAAAgA",
                  "balances": {
                    "bcbddaa": {
                      "balance": "1",
                      "localPendingDebt": "2",
                      "remotePendingDebt": "2"
                    },
                    "baacbbc": {
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
              "randNonce": "AAACAQAAAAAAAQABAQABAA",
              "newToken": "AQECAgABAgACAgACAQEBAAIBAQECAAACAQIAAQEBAgECAgACAgECAQECAgAAAgAAAgICAQICAQEBAQIBAAAAAQ"
            },
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
          "AQECAAEBAgAAAAAAAAABAgACAQECAAIAAgECAgEAAQI": {
            "currency": "babcb",
            "totalDestPayment": "0",
            "description": "",
            "isCommited": false,
            "generation": "2"
          }
        },
        "openPayments": {
          "AQABAAEAAgIAAgEBAQIAAA": {
            "invoiceId": "AAEBAAABAQEBAgICAgACAgIAAAIBAAECAAACAQIBAAE",
            "currency": "cdadddaddbbdbcb",
            "destPublicKey": "AAACAgECAAAAAgECAQABAQABAQICAAACAgABAQABAQE",
            "destPayment": "1",
            "description": "‾⁜",
            "generation": "2",
            "status": {
              "commit": [
                {
                  "responseHash": "AgABAAIBAgEAAgECAAIBAQAAAgEBAAAAAQAAAQEAAQE",
                  "srcPlainLock": "AAACAAACAAECAgACAAIBAgEAAAIAAAEAAQEBAAIBAQA",
                  "destHashedLock": "AgICAQEBAQABAQEBAAECAQIAAQIAAQEAAAECAQIAAAA",
                  "destPayment": "2",
                  "totalDestPayment": "1",
                  "invoiceId": "AgAAAQEBAQEAAAICAAEAAQECAgABAAECAQAAAAICAgI",
                  "currency": "ddcccbacbaba",
                  "signature": "AAACAAECAgEBAQAAAQEBAQEBAAACAQIBAAIAAgAAAQIAAQACAgICAQABAgEAAAABAAIBAgIAAAICAAECAgIAAg"
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
    "2",
    {
      "report": {
        "localPublicKey": "AQIBAgEBAQACAAACAAIBAQEAAAEBAQAAAAEBAAAAAQE",
        "indexServers": [
          {
            "publicKey": "AQEAAQECAQIBAQAAAQECAQICAQABAAECAQACAgEBAQE",
            "address": {
              "address": "dabcabdadcdcccacdaadbdaddbddbdcacdcaccdaadbbadabbbabcaadcaacacbcacdbdbdbbaadbcddbdacccdaadccdbdacdcbdcbbbcaccaadacbb"
            },
            "name": "￸"
          },
          {
            "publicKey": "AgIBAAABAgACAgAAAAACAgAAAAECAAICAgEAAAAAAQE",
            "address": {
              "address": "adaabdaaaddcdcbbbcddbdadcbbcbbaaacaabdaaaabcdbcccbddadddbaabbacbbcabadcadabdbdabbbdabccadbbacdcdddbdcaaabccaadbcaaadaaadcbacdbcdacdcbbcccbabbbddbabccdcbccccddbaadbbadaadcbdbdbabcbabdddbdabdadaaccddadbbcdaaddadccacbddccacadb"
            },
            "name": "\u00064"
          }
        ],
        "optConnectedIndexServer": "AgIAAAIBAQIBAgIBAgECAgICAgECAQIBAQAAAQECAQE",
        "relays": [
          {
            "publicKey": "AgACAQABAAEBAgIBAQAAAQACAAABAQICAQECAQEBAAE",
            "address": {
              "address": "bbdcacadbacdaabaccdbdbdcdbcacbadddcbdccaaaccdccbbbaacdddbcbcccddacbcbcabbcbbdcabbaabcaacababdbdccddaabccaacccccbb"
            },
            "name": "5A"
          },
          {
            "publicKey": "AgABAAEAAgIBAAIBAgECAQABAAIBAgACAAEAAAACAQA",
            "address": {
              "address": "babaddaddcbbbcbaccdbddcabaacbabccdacaaadbcdaccbcdbaddacbaaadddcbdddacbdaabddccdbcaccdadccaddaddabaccdaabcaaadabdaacbcddb"
            },
            "name": "]"
          }
        ],
        "friends": {
          "AgIBAAAAAgIAAQABAgICAAECAAICAAICAgICAAIBAgA": {
            "name": "",
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
        "openInvoices": {},
        "openPayments": {
          "AAIAAgECAAACAAIBAgEAAg": {
            "invoiceId": "AAEBAAIAAAAAAgIBAQIBAQIBAQACAAACAgACAAACAQA",
            "currency": "dabdb",
            "destPublicKey": "AgICAQECAQABAQIBAgACAgACAAIAAQACAAACAAABAAE",
            "destPayment": "1",
            "description": "팏",
            "generation": "0",
            "status": {
              "success": [
                {
                  "responseHash": "AQEBAAIAAAABAgEAAgIAAAACAQEAAAEBAQIBAQECAAI",
                  "invoiceId": "AAEAAgACAQIAAQACAgAAAgICAgAAAgACAgEAAgABAgI",
                  "currency": {
                    "currency": "bccccbbda"
                  },
                  "srcPlainLock": "AQICAAEBAQEAAgIAAgABAAABAAABAQAAAAAAAAICAgI",
                  "destPlainLock": "AAICAAICAgIAAgIBAgEBAgEBAgEAAQIBAgECAAABAQA",
                  "isComplete": true,
                  "destPayment": "0",
                  "totalDestPayment": "0",
                  "signature": "AgECAAEAAAEBAgIBAgACAQEAAQACAAEBAgACAAICAAICAgEAAAEAAAABAQECAgIAAAIBAgICAQICAAEAAQICAA"
                },
                "2",
                "AQEAAgEAAQIBAgEAAAABAQ"
              ]
            }
          },
          "AgECAgABAgAAAAABAQAAAA": {
            "invoiceId": "AAICAgECAAIBAQIAAQEAAAAAAAICAAACAAIBAgICAAA",
            "currency": "ddcaccaaacdbb",
            "destPublicKey": "AQEBAAECAAEAAgIBAQICAgABAQEAAAABAgICAAICAAA",
            "destPayment": "2",
            "description": ")",
            "generation": "1",
            "status": {
              "success": [
                {
                  "responseHash": "AgEAAQACAAECAgABAgAAAgACAgIAAQIBAAICAAICAgE",
                  "invoiceId": "AgICAgEAAgICAQEAAAACAgICAgACAAIAAQACAAACAgA",
                  "currency": {
                    "currency": "dbadddcdddcdbbc"
                  },
                  "srcPlainLock": "AQEAAgECAQECAQIBAQEAAgAAAgIBAQEAAQICAgEAAgE",
                  "destPlainLock": "AAEAAgACAQEBAgABAgICAgECAAACAQEAAQICAAEAAAE",
                  "isComplete": false,
                  "destPayment": "0",
                  "totalDestPayment": "1",
                  "signature": "AAAAAQEBAQECAAABAgIBAAEBAAEBAQEAAgEBAgEBAQEBAgABAgECAQICAAIAAgAAAQIBAgACAQACAQACAQACAg"
                },
                "0",
                "AAEAAAAAAQABAQIAAQEBAA"
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
    "1",
    {
      "report": {
        "localPublicKey": "AAIBAQECAAIBAgIBAQIBAQEBAQIAAgIBAgIBAQAAAAA",
        "indexServers": [
          {
            "publicKey": "AgIAAgACAQIAAgABAAEBAAECAgEAAAIBAAIAAQAAAQI",
            "address": {
              "address": "ddbcdaadbadbbbabcacbccdcddcacbacbbdcbbabcddcbbdcdcbbbadcbbbcadabbacdacabbdacccaabaaddabacbddbdaddccdbdbbaddadccacbbbabbdcdcbdcccdbacaacbbadddddbcaaaaabaacabbbbaadaccdcdcbaadbbdbccabbdcddddbaabbcddcdcdcdbadabbdcdabdbbcbacddbadabc"
            },
            "name": ""
          },
          {
            "publicKey": "AAICAgAAAAECAgABAQEAAgIAAQACAgEBAgICAgAAAAI",
            "address": {
              "address": "cdaddadcacadcaadaaadbddccdbacbcabaddbabacccdabadcbcbaaaaaadcdcabcaccdcaabdbabbccacccabdababdbaddabdcaadacadadddcaadaccdabdcdcbdbadacadcdacacadababdabdbbcaaadabbaacbbdaabbbadccddaadadcddbdccbaadbadbaadcdcacdaabaacbabddadbddbdadbadccdcaabaabddacac"
            },
            "name": ","
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAEBAQEBAgEBAAABAgICAgECAAEBAQEBAQECAQAAAgE",
            "address": {
              "address": "cdddbabaaacdaddbcccbdcacbaaadaacacabbcbbaabdacbddbaaddcabcccbdbaadddbabcbbb"
            },
            "name": "­\u0003"
          },
          {
            "publicKey": "AAEBAgACAAABAAIAAAABAgABAAIAAAEBAAEBAAAAAAI",
            "address": {
              "address": "caccbcdadadcacaaaabaadbbbdbccacaaccbbacbddcdccbdccdcdacbcacccbabbdbccdaacabaabaaddcccacdcaadcdddaaaadbbdddabaccdcdabcbcbcdccadabbabaababcdbda"
            },
            "name": "‌𘨯"
          }
        ],
        "friends": {
          "AAEBAgICAQAAAQECAAEAAQAAAgECAgABAgIAAQIAAgA": {
            "name": "",
            "currencyConfigs": {},
            "optLastIncomingMoveToken": null,
            "liveness": "offline",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "ddbcabcdcadccca": "2"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {
          "AgEAAQAAAAICAQIBAQEAAQACAQICAAIAAQAAAQACAgE": {
            "currency": "dcd",
            "totalDestPayment": "2",
            "description": "\u0017",
            "isCommited": true,
            "generation": "2"
          },
          "AAECAAICAAAAAQICAQIAAQIBAQABAAICAQACAAECAgA": {
            "currency": "cbdc",
            "totalDestPayment": "2",
            "description": "8",
            "isCommited": true,
            "generation": "0"
          }
        },
        "openPayments": {
          "AQEBAAACAgIBAgIAAgIBAQ": {
            "invoiceId": "AQEAAgECAAICAQECAQEBAgAAAQABAgACAAICAQACAgE",
            "currency": "dddabcacbcdbbbb",
            "destPublicKey": "AAECAQICAQAAAAIAAQIBAQEBAAEBAQACAgEAAQICAAI",
            "destPayment": "0",
            "description": "",
            "generation": "0",
            "status": {
              "failure": "AAACAgIAAgEBAQIAAQIBAA"
            }
          },
          "AAIAAgICAQACAAEBAAIAAQ": {
            "invoiceId": "AAAAAAEBAgIBAgACAgICAQIAAQEBAQEAAgECAQAAAAI",
            "currency": "dadadaadbaa",
            "destPublicKey": "AAAAAAACAgAAAQEBAgEAAQAAAAEAAgAAAgEBAQIAAgI",
            "destPayment": "0",
            "description": "￻)",
            "generation": "1",
            "status": {
              "commit": [
                {
                  "responseHash": "AQIAAQABAAAAAgEBAQIBAgEAAAICAAACAAEAAgICAgA",
                  "srcPlainLock": "AgAAAAAAAQEBAgACAQAAAAEAAAAAAgEAAAEBAgICAAE",
                  "destHashedLock": "AQIAAQEBAgICAgECAQEAAAICAAEAAAACAgACAQIBAAE",
                  "destPayment": "2",
                  "totalDestPayment": "1",
                  "invoiceId": "AQIBAQABAQIAAQICAgECAQEAAQIBAAIBAAABAgAAAgI",
                  "currency": "b",
                  "signature": "AAIBAQICAgIBAQAAAgAAAgEBAgACAAECAgIBAgICAgIAAgIAAQAAAAICAQEAAgEAAAACAAACAgACAgAAAQECAA"
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
  "responseOpenNode": {
    "success": [
      "⁍\u0001",
      "0",
      {
        "routes": true,
        "buyer": true,
        "seller": false,
        "config": true
      },
      {
        "localPublicKey": "AAIAAgICAgIAAAACAgACAAIBAgEAAgICAAEAAgEAAgE",
        "indexServers": [
          {
            "publicKey": "AAECAQIAAAABAQEAAQACAQABAQAAAAEBAgAAAgIBAQI",
            "address": {
              "address": "bcbcababbdacddbcbbbdcbbaddbdbacbabcdddcaabaacadaddadacadbcaacddcabdabbbabdaaabcddbcadcccdbcbdbadbbcaaaadbabbbdabbacaaccbacddabddbddacbbcaddbdbcddcadbdadbcdbadca"
            },
            "name": ""
          },
          {
            "publicKey": "AQACAQEBAgIBAgEBAAIBAgICAgICAQEBAAIBAQEBAQI",
            "address": {
              "address": "dcdcbbdbddccbadcccccbc"
            },
            "name": " ஫"
          }
        ],
        "optConnectedIndexServer": "AQEAAQECAAABAAACAQACAgAAAgICAQECAgAAAAIAAAI",
        "relays": [
          {
            "publicKey": "AQICAgICAQIAAAICAAIBAgECAQIAAgIBAgICAQAAAQI",
            "address": {
              "address": "abdabadccdabdcacbdadbaacbbbcbdaabdacadbdaccabdbbbadcbcabccaddacabddadabbdcabdcbaabcdbabdddadadbdcbdbacbdbbbacadbdcddacacca"
            },
            "name": "Uk"
          },
          {
            "publicKey": "AQECAQECAQIAAgICAQIBAAAAAQAAAAIAAgABAQICAAA",
            "address": {
              "address": "abaacccddcdaabbbbdccdadbabbcdaabccbaadaaccabdbabcdaaddcaaddabdadcaabacabacadcbadbbccdddacbadcbbaccccadcddbadbccadaaaadbaabbaaccabaddacdacdcdbdbbccdaccdacbdbdcaaacdbcbaaacdbbcddacbdbcacabdaacdbbcbcaccccdbbadacbdbdcddc"
            },
            "name": "텠3"
          }
        ],
        "friends": {},
        "openInvoices": {
          "AAIAAgICAQACAQEBAAECAQIAAAACAgABAAICAgACAgI": {
            "currency": "babaacbcbaca",
            "totalDestPayment": "2",
            "description": "",
            "isCommited": true,
            "generation": "1"
          },
          "AQECAQICAgIAAgICAQECAAECAQIBAQAAAAIAAgEAAAA": {
            "currency": "abbbdaaaaad",
            "totalDestPayment": "2",
            "description": "",
            "isCommited": false,
            "generation": "0"
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
  "responseOpenNode": {
    "failure": ""
  }
}
''',
r'''
{
  "node": [
    "1",
    {
      "responseVerifyCommit": {
        "requestId": "AgABAgEAAAIBAAACAQIBAQ",
        "status": "success"
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
  "responseOpenNode": {
    "failure": "p"
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
    "failure": "1"
  }
}
''',
r'''
{
  "node": [
    "1",
    {
      "paymentFees": {
        "paymentId": "AQEBAgIAAAIBAgICAgACAA",
        "response": {
          "fees": [
            "1",
            "AgEBAQICAAIAAQIBAQAAAA"
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
    "failure": "￷"
  }
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "<―",
      "2",
      {
        "routes": false,
        "buyer": true,
        "seller": true,
        "config": true
      },
      {
        "localPublicKey": "AQIAAAACAgECAAICAAABAAECAgAAAAAAAQICAQEAAAA",
        "indexServers": [
          {
            "publicKey": "AgECAQECAgEAAQIBAgICAgECAgABAgICAgECAQEBAQA",
            "address": {
              "address": "abcadcbddbbbddcbcbaacbccdbdabdacaaabbaacdcadaddaaacdddadabcaddbcdbcabcbcbddaaaadacdddbbddbaadddaacbdddbdddcacadbdddcddcacbdaacbcddabbcddadcacbadddaaaaaabcdddacccccbdcddcdabbacdacbabdccbaaadccacaaabacacbacdababadcbaccbcbcababccaabdacacccbbbbdbcab"
            },
            "name": "%"
          }
        ],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AgECAQEBAQIBAgIAAgEBAgABAgICAAABAgEBAgIBAAI",
            "address": {
              "address": "bdabccacbccadbacdbabbdbdabbbadcdacabbccdadbadcbaddabddbbbbdddcaddcbcbcabbdbaccdbcaabadcccbbbdbdbaaccbcb"
            },
            "name": ""
          },
          {
            "publicKey": "AgEBAAEAAAAAAQEAAgABAgEAAgEBAgACAQICAQECAgE",
            "address": {
              "address": "bacaddcbcacbbaababcdbabcddacccbaacaaaddddbabacbcaddbdcdbcccddd"
            },
            "name": "￰"
          }
        ],
        "friends": {},
        "openInvoices": {},
        "openPayments": {
          "AAEAAQIAAQABAAACAAACAA": {
            "invoiceId": "AgECAAICAQIBAgACAgECAgACAQIBAAIBAgIAAAABAQA",
            "currency": "acbcaccb",
            "destPublicKey": "AgEAAAIBAAACAAEAAAIAAAECAAECAgEAAAABAQECAAA",
            "destPayment": "0",
            "description": "",
            "generation": "0",
            "status": {
              "failure": "AgIBAgIBAgIAAAECAQACAA"
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
  "responseOpenNode": {
    "failure": "\t"
  }
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
    },
    "": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AgICAAACAAICAQICAQACAQEBAAACAQABAQECAAABAgA"
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
            "generation": "2",
            "status": {
              "foundRoute": [
                "AgECAQEAAAABAAABAgECAA",
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
  "nodesStatus": {
    "": {
      "isOpen": true,
      "info": {
        "remote": {
          "appPublicKey": "AAEBAQIBAgIBAQACAAICAAECAAIBAgABAQIBAgECAgA",
          "nodePublicKey": "AQICAAEAAgIBAQEAAAACAAICAgIBAAACAAACAQIAAgA",
          "nodeAddress": {
            "address": "bcddccdbccdddccbaabcacdbbdccbbdcbdaabdccbaaabbccabddcbabddaacadcdccdcbbccbaaaaaabd"
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
      "Hﰑ",
      "1",
      {
        "routes": true,
        "buyer": false,
        "seller": true,
        "config": true
      },
      {
        "localPublicKey": "AAABAgIAAAECAAABAQABAgIBAAEBAgICAQABAgAAAgA",
        "indexServers": [],
        "optConnectedIndexServer": "AQEBAgIAAQEAAQIAAAIBAgIAAQABAAECAAIAAAEBAAA",
        "relays": [],
        "friends": {},
        "openInvoices": {
          "AQACAQEBAgEAAQEBAQIBAQAAAAEBAAABAQEBAgIAAgI": {
            "currency": "accb",
            "totalDestPayment": "2",
            "description": "",
            "isCommited": true,
            "generation": "2"
          },
          "AAEAAAIBAgIAAQIAAQACAAECAQAAAAACAQACAAEAAQI": {
            "currency": "bccd",
            "totalDestPayment": "2",
            "description": "{’",
            "isCommited": false,
            "generation": "0"
          }
        },
        "openPayments": {
          "AQEBAgIAAAEBAgABAQIAAQ": {
            "invoiceId": "AgIBAgACAgEBAAIBAAEBAAEBAAABAAEBAAECAAIBAAI",
            "currency": "ccbcdd",
            "destPublicKey": "AgEAAgEAAgIBAgEAAgEBAQIAAQIAAgACAQACAgEBAAI",
            "destPayment": "0",
            "description": "",
            "generation": "1",
            "status": {
              "commit": [
                {
                  "responseHash": "AAIAAAACAAIAAQABAQAAAgEBAQICAgECAgEAAQACAQI",
                  "srcPlainLock": "AgECAQIBAQAAAgABAgECAgEBAQEAAQIAAQECAAEBAAI",
                  "destHashedLock": "AgEAAAEAAgIAAgAAAgECAgAAAQAAAQABAQAAAgECAAI",
                  "destPayment": "0",
                  "totalDestPayment": "2",
                  "invoiceId": "AQIAAgECAgIAAAECAQACAAACAAICAgIBAQIAAQEAAQE",
                  "currency": "cabbacbcbdc",
                  "signature": "AQICAAACAgAAAgABAgIAAAEAAQIAAAICAAIAAAEAAgABAAECAQACAQABAAEBAgEBAAAAAQEBAQECAgEAAQABAg"
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
  "responseOpenNode": {
    "success": [
      "%",
      "0",
      {
        "routes": true,
        "buyer": false,
        "seller": false,
        "config": true
      },
      {
        "localPublicKey": "AgIBAQIBAQEAAAAAAQAAAAEBAQEBAgAAAAIBAgIBAQE",
        "indexServers": [
          {
            "publicKey": "AQABAAECAQACAQEBAgIBAQIBAgEBAAIAAQECAQEBAQI",
            "address": {
              "address": "daadbbbbdcbbccdbbcdddacddbaabaddbbbdbccccbbacdcdbadaacbbacbcbadbcbadcabdddbabdbdaabddbdcbddabbdabbcaccdbcdccdb"
            },
            "name": " 嚯"
          }
        ],
        "optConnectedIndexServer": "AQAAAAEBAAABAAECAAEAAAIBAAACAgIAAQIAAQECAAA",
        "relays": [
          {
            "publicKey": "AgACAgEBAAIBAgECAQIAAQACAgABAQEAAgABAgEAAAI",
            "address": {
              "address": "dddabbcbbcddbcddccaadcaccbbacddccacdbbdadcdacaddccdcabaaacbadaabaddbbdcbdaacb"
            },
            "name": "$"
          }
        ],
        "friends": {},
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
    "1",
    {
      "paymentDone": {
        "paymentId": "AQABAAICAAIBAgICAAIBAQ",
        "status": {
          "success": [
            {
              "responseHash": "AQIBAgECAQIAAAEAAAABAAECAAABAQABAAIAAAACAgA",
              "invoiceId": "AQAAAAIAAAIBAQICAAECAAECAAABAAIBAQECAAIBAgE",
              "currency": {
                "currency": "accacbc"
              },
              "srcPlainLock": "AQIBAQECAgEAAQAAAQIAAQACAAICAAABAQICAQICAAA",
              "destPlainLock": "AQECAAECAgABAAABAQABAAIBAQAAAAIAAQAAAAICAgI",
              "isComplete": false,
              "destPayment": "0",
              "totalDestPayment": "2",
              "signature": "AgABAQEAAgACAgIBAQACAAEBAAAAAgABAQAAAQICAgEAAQEAAgAAAQIBAAACAAACAQICAAEBAgICAAIBAgECAQ"
            },
            "0",
            "AgECAgIAAAICAgIAAAECAA"
          ]
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
    "#": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AQICAgICAQAAAQACAQABAgEBAgIBAAAAAgABAAIBAgA"
        }
      }
    }
  }
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "|"
  }
}
''',
r'''
{
  "node": [
    "0",
    {
      "report": {
        "localPublicKey": "AgACAAICAAAAAQACAgABAQIAAAAAAQICAgIBAQABAQI",
        "indexServers": [],
        "optConnectedIndexServer": null,
        "relays": [
          {
            "publicKey": "AAEAAAAAAAEAAgIBAQAAAQEBAAIAAQICAQABAAAAAAI",
            "address": {
              "address": "bcccdaaaaddadddddbcbddcbbddcbdababcbccabbdadbcabaddbabdadcbbbdaadbddbdaabdbdcadcaddbdcbbcdccbdcbadbbcbcddadababcacdcadabcaddcbcbdbbabadadbbdbccbdbdbbcccbcbaddbddcbbcdccccdadacacbbaaccdcbadccbbdddcdaccbbaaaabcdaccbaccbdbac"
            },
            "name": ""
          }
        ],
        "friends": {},
        "openInvoices": {
          "AQEAAgEAAgIAAQECAQAAAQEAAgIBAgICAgACAAIAAgA": {
            "currency": "aac",
            "totalDestPayment": "1",
            "description": "N",
            "isCommited": true,
            "generation": "1"
          },
          "AQIBAgEAAAIAAAAAAAIAAQIAAQABAgECAQECAQABAgA": {
            "currency": "cadabdaaccaba",
            "totalDestPayment": "2",
            "description": ":_",
            "isCommited": false,
            "generation": "0"
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
  "node": [
    "0",
    {
      "paymentCommit": {
        "paymentId": "AgIBAgICAgABAgEBAgACAA",
        "commit": {
          "responseHash": "AgAAAQABAAICAQEBAQABAgICAgABAAEBAAICAAAAAgI",
          "srcPlainLock": "AQIAAgIBAgACAAAAAgIBAgIBAQAAAgACAQECAQECAQI",
          "destHashedLock": "AQABAQEBAgAAAAEBAgICAgIBAgABAgABAAEAAAABAAI",
          "destPayment": "1",
          "totalDestPayment": "2",
          "invoiceId": "AQACAgIBAgABAQIAAAICAQEBAAECAQIAAQICAQIBAgI",
          "currency": "a",
          "signature": "AgEAAgIBAQIBAgAAAQEBAQABAgACAAABAAABAAACAgEAAQAAAgEAAgIBAQACAgACAgABAQEBAQEAAAAAAgEBAA"
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
        "paymentId": "AgICAAECAgECAQAAAQEBAA",
        "commit": {
          "responseHash": "AQEBAQABAQICAAICAQIAAAAAAAACAgAAAQABAgICAAE",
          "srcPlainLock": "AAEBAAABAQACAgIBAgEBAgICAgICAgICAQEAAQAAAAE",
          "destHashedLock": "AAECAQAAAQEAAgIBAQABAQECAAIAAgEAAQECAQAAAgE",
          "destPayment": "2",
          "totalDestPayment": "2",
          "invoiceId": "AQIBAAIAAQIAAAAAAgIBAQEBAgAAAAABAAEAAQACAAE",
          "currency": "cddddbdada",
          "signature": "AAABAgEBAgICAQACAQEBAQEAAQEAAAIAAQACAQEAAgECAgIBAQACAQICAQABAQICAgIBAgABAgABAAIBAAECAg"
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
        "requestId": "AQAAAgICAgEBAQACAAEAAg",
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
      "paymentFees": {
        "paymentId": "AAECAAABAgECAgAAAQAAAQ",
        "response": "unreachable"
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "񝫰": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAAAAAIAAAAAAQABAgIAAgABAQIAAAIAAAABAQICAQI"
        }
      }
    },
    "➹": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AAABAAEBAAIBAQIAAAIAAgICAAECAQEAAAACAQAAAAI",
          "nodePublicKey": "AAAAAAEBAQABAQECAgICAAECAAICAQECAQIAAAICAgA",
          "nodeAddress": {
            "address": "ccaababbcbbdccacacbcbbcbbbbbcdadbdddcdabaccacccbbdbbaccbdacaadbcbdddadbdbdacbcabbbdbbcaabbccbabdbdacabdcbddadadbdddaacdadabadadccbaddcabdaacbbdbccddccdaabccbacbdccbcbcbcdacbdabcddbbdbcddcdbadddcbbbdbacdbcbcadaddccbddbbbaadbbdbcdccc"
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
      "responseVerifyCommit": {
        "requestId": "AAIBAgIBAAAAAQAAAQICAg",
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
      "paymentCommit": {
        "paymentId": "AgIBAQACAAEAAgABAQICAA",
        "commit": {
          "responseHash": "AQEAAgEAAgECAQAAAQICAAEAAgAAAgIAAQEAAgIBAgE",
          "srcPlainLock": "AAEAAAICAAEBAgABAQIBAgAAAAIAAAIBAQAAAAICAgA",
          "destHashedLock": "AQIAAQIAAAEBAAICAgECAQIBAgEBAQAAAAIBAgICAAI",
          "destPayment": "2",
          "totalDestPayment": "2",
          "invoiceId": "AQAAAQIAAQEAAgABAQEBAAECAQICAgAAAQEBAAABAQA",
          "currency": "abb",
          "signature": "AAEBAQABAAIBAAIAAAABAgIAAAAAAQEAAgACAgECAAEBAQICAgECAgECAQEAAgIBAQICAAABAgEBAQEAAgIAAg"
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "¡>": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AQECAgACAQACAQEBAgIAAgIAAAIAAgAAAgACAAACAgE"
        }
      }
    }
  }
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "쐉縖"
  }
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AQICAQACAAIBAgEAAgECAQABAgECAQICAgACAgACAAA"
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
      "0",
      {
        "routes": true,
        "buyer": false,
        "seller": false,
        "config": true
      },
      {
        "localPublicKey": "AQICAQEAAAIBAQEBAAEBAgICAgEAAAICAgACAgAAAgE",
        "indexServers": [],
        "optConnectedIndexServer": "AgICAgACAAIAAQICAQEBAgIBAQECAAABAQIBAQECAQE",
        "relays": [
          {
            "publicKey": "AgIBAgAAAAICAQIAAgAAAgECAgEAAgIBAgEBAQACAQA",
            "address": {
              "address": "dccacddcadddcaaddacddcacbcddbaabcacadaaacddaaab"
            },
            "name": ""
          }
        ],
        "friends": {
          "AQIAAQEBAgACAgABAgECAQEBAQACAAABAQIAAgECAQE": {
            "name": "",
            "currencyConfigs": {
              "addacccddacab": {
                "rate": {
                  "mul": 1,
                  "add": 1
                },
                "remoteMaxDebt": "1",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AQEAAgEBAgICAAIAAAEAAAIBAQEBAgAAAAIBAQAAAgI",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AAIAAAABAgACAgEBAQEAAgIAAAECAQIAAQEBAAABAgI",
                  "remotePublicKey": "AQABAAECAgEBAQABAAABAgEAAgECAgIAAAEAAQIBAQA",
                  "balances": {
                    "aaaabab": {
                      "balance": "-3",
                      "localPendingDebt": "0",
                      "remotePendingDebt": "2"
                    }
                  }
                },
                "counters": {
                  "inconsistencyCounter": "0",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AgEBAgIBAgAAAQABAAECAg",
              "newToken": "AgIBAQICAAIBAAIBAgECAQABAQAAAQIAAAIAAAEAAAIBAgIAAAACAAICAgEBAQEBAgAAAgIBAQICAQACAAECAA"
            },
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "cabbccacd": {
                    "balance": "-1",
                    "localPendingDebt": "1",
                    "remotePendingDebt": "0"
                  },
                  "ccadddccbbadcc": {
                    "balance": "2",
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
          "AgACAgICAgICAgEAAQABAQEAAAEBAgAAAQEAAgABAAI": {
            "currency": "aadacbd",
            "totalDestPayment": "1",
            "description": "",
            "isCommited": false,
            "generation": "0"
          },
          "AgEBAQICAgAAAAACAgICAgECAQIBAgACAQIAAQAAAgE": {
            "currency": "ddd",
            "totalDestPayment": "0",
            "description": "祋",
            "isCommited": true,
            "generation": "1"
          }
        },
        "openPayments": {
          "AQICAAIBAQAAAQIAAQABAQ": {
            "invoiceId": "AAIBAQACAgECAAAAAAICAgAAAgAAAQICAAEBAgIBAgI",
            "currency": "acbaca",
            "destPublicKey": "AQIBAgICAQIAAgIAAAEAAAECAgIBAgECAAECAgEBAAE",
            "destPayment": "2",
            "description": "",
            "generation": "2",
            "status": {
              "failure": "AAACAQECAgABAQACAQABAA"
            }
          },
          "AQECAgEBAAICAAEBAgIAAg": {
            "invoiceId": "AQEBAQEBAAEBAQECAgICAAIAAQIAAQICAgECAAEBAgE",
            "currency": "cb",
            "destPublicKey": "AAIBAQIBAAIAAAIBAQICAQACAgEAAgIBAQECAQABAgE",
            "destPayment": "0",
            "description": "󿿾",
            "generation": "2",
            "status": {
              "sending": "2"
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
  "responseOpenNode": {
    "failure": ""
  }
}
''',
r'''
{
  "nodesStatus": {
    "": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAICAAICAAAAAAICAQACAgICAAABAAAAAQAAAAIBAQI"
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
      "paymentCommit": {
        "paymentId": "AQAAAQAAAQEAAQEAAAEBAQ",
        "commit": {
          "responseHash": "AgABAgEBAAIBAgACAAACAAICAgEBAAEAAQECAgABAAE",
          "srcPlainLock": "AgABAAACAAICAgIAAgIAAQEAAQECAAIBAAACAQAAAgA",
          "destHashedLock": "AgAAAQAAAQAAAgICAgABAQACAgIBAQEAAgAAAgIBAQE",
          "destPayment": "2",
          "totalDestPayment": "2",
          "invoiceId": "AQABAAACAAACAAABAgIBAgIAAgAAAAAAAgIAAQABAQI",
          "currency": "acbadbc",
          "signature": "AgEAAgEAAAABAgAAAAECAQACAAEBAgABAgACAAACAAEAAQACAgABAgECAQICAAICAQACAgIAAgICAgICAAECAQ"
        }
      }
    }
  ]
}
''',
r'''
{
  "responseOpenNode": {
    "failure": "^"
  }
}
''',
r'''
{
  "node": [
    "2",
    {
      "report": {
        "localPublicKey": "AQEBAAACAQIBAQIAAQECAQEAAAACAgABAQICAQACAAA",
        "indexServers": [
          {
            "publicKey": "AAICAgEBAAEAAgICAAECAQAAAgACAgIAAQABAAEAAAA",
            "address": {
              "address": "dcaabcbbcbaacbccbbccacaabadabacdacdbaadaababdbcdacdabdccbbbacadaccbabcaabdcdadbcbaacbdcacbcabdcdacabccdabcdddbddaaabcaddbddabdddcbbaac"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": "AgIBAgIAAgEBAgAAAgACAgEAAQIBAgICAQIAAAIBAQI",
        "relays": [
          {
            "publicKey": "AgECAQEBAgEBAAAAAgEAAAIBAQEBAAACAQABAAEBAAE",
            "address": {
              "address": "dccbaaacbabbbbcdccdcbddacdbddcccdbbdaccdadbdccaacdbbcaabbdcbdbbbabacbbddbcccbdcbaabbdacdacbdacdcccbccdccbdcaababcbabbaddacadddbcbdcddcdcbbbadbcacccdacdbdbcaaaabcddcabbabdbacbdcd"
            },
            "name": "K"
          },
          {
            "publicKey": "AgEAAQIAAAEBAgEAAQACAAIAAAECAAABAQACAgACAQE",
            "address": {
              "address": "cdadbbcdcabcddcaabcbddcabcdbabdbdbdaddcccbbcabadddbdacaaabbadaddbbccdddacbbddcdbdaadadcacbbcbadcdabcaddacaaadadcbdbaabdacddbabcccaaddcdacdddaacddadbbabcabdbbbddcacaaddbadaa"
            },
            "name": ""
          }
        ],
        "friends": {
          "AQABAQECAgAAAAEBAAECAAEBAAEBAgEAAgEAAgACAgA": {
            "name": "q/",
            "currencyConfigs": {
              "cd": {
                "rate": {
                  "mul": 1,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              },
              "ddb": {
                "rate": {
                  "mul": 0,
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
                  "ac": "-3"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AQEAAgIBAQIAAgECAgABAAECAQICAQABAQECAAEAAAIBAQIBAQABAAICAgACAgECAAIAAQABAgAAAgEBAgICAg",
                  "balanceForReset": {}
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AQACAQIBAAACAgEAAgAAAgICAAABAQEAAgAAAAEBAgE": {
            "currency": "bbb",
            "totalDestPayment": "2",
            "description": "k~",
            "isCommited": false,
            "generation": "2"
          },
          "AgACAAABAgIBAgECAAAAAQACAgAAAAEBAgECAQECAAI": {
            "currency": "bdaabccbdbc",
            "totalDestPayment": "1",
            "description": "",
            "isCommited": false,
            "generation": "1"
          }
        },
        "openPayments": {
          "AAECAAECAQICAgACAQEBAQ": {
            "invoiceId": "AQEAAgAAAgABAgECAAEAAAACAQIBAgEAAQIAAgIBAAE",
            "currency": "bcaddbdccdbb",
            "destPublicKey": "AQAAAQIAAgAAAQIBAgECAQABAQACAAIBAAACAgIBAgA",
            "destPayment": "2",
            "description": "#?",
            "generation": "1",
            "status": {
              "commit": [
                {
                  "responseHash": "AgAAAAIBAQEBAQICAAICAgABAAEBAAECAQABAQICAQA",
                  "srcPlainLock": "AgAAAAAAAgEBAQEBAgICAAIAAAEAAQECAgIAAgAAAQI",
                  "destHashedLock": "AgIAAQAAAAIBAQACAgICAQIBAgEAAQEAAQIAAAIBAQA",
                  "destPayment": "1",
                  "totalDestPayment": "2",
                  "invoiceId": "AgACAAEBAQEBAgICAAIAAgEAAQICAAEBAQEAAgICAQE",
                  "currency": "dccadbadaccbcab",
                  "signature": "AAIBAAICAgEAAQIBAgAAAAEBAgACAAICAQIBAAEBAgABAAECAgACAQACAgIBAgEBAgAAAgICAgEAAAAAAgIAAA"
                },
                "2"
              ]
            }
          },
          "AgICAAIAAQABAgACAAABAQ": {
            "invoiceId": "AQEBAAEAAgABAAEAAAEAAQIAAAEBAQACAQICAgABAQI",
            "currency": "adcbdcadda",
            "destPublicKey": "AgACAQECAgAAAAEBAQAAAAEAAAABAgEBAgACAgAAAgI",
            "destPayment": "1",
            "description": "5'",
            "generation": "0",
            "status": {
              "searchingRoute": "AAICAgACAgECAQIAAAECAA"
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
    "failure": "#"
  }
}
''',
r'''
{
  "responseOpenNode": {
    "success": [
      "N",
      "1",
      {
        "routes": false,
        "buyer": false,
        "seller": false,
        "config": true
      },
      {
        "localPublicKey": "AgEAAQIAAQICAgEBAAICAgAAAgAAAgIAAgAAAQABAgI",
        "indexServers": [
          {
            "publicKey": "AgABAgIBAAABAgEAAgECAgIBAQICAAEAAAICAQAAAAA",
            "address": {
              "address": "acacadbccbadcaacabadbcbcbcccabd"
            },
            "name": "u⁋"
          },
          {
            "publicKey": "AgACAQEAAAAAAAIAAgIAAAIBAQIBAQIAAQEAAAEBAgE",
            "address": {
              "address": "ddcdda"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": "AAICAQEAAQABAQIBAAIBAAAAAQEBAAECAQAAAAEAAgI",
        "relays": [
          {
            "publicKey": "AAEBAAABAAIBAQIAAQACAQIAAQIBAgACAgICAgIBAQA",
            "address": {
              "address": "aaababbbcbccdbbdcbcaabdbcdabadcdcacdadabbaaddaddcaabcbbcbcddcbddbacdbcaacabddddcabcadabdbcaccbbaadcdcdacabaddcaabccadddccbadcddbccdddddbccbcddabccdaaccbbdcbcbbbcacbdddcccbbaadaccdbaadbadbaabcc"
            },
            "name": "礳"
          },
          {
            "publicKey": "AQIAAQICAQEAAgEAAAIAAQABAQIAAAIBAQIAAgACAQE",
            "address": {
              "address": "cacaadbadddaccabdbcabaaccdcdcbddababcddcdaabcccddbdcbdcbbaacdccaacdddbacabdacabdadcdadacabbddcabbdcccbccdbabaacadaddabbaadabbadadcabaccbbbabbdbbbcadc"
            },
            "name": "z"
          }
        ],
        "friends": {
          "AAIAAQEAAQECAgICAgECAQACAQIBAAIAAAECAAABAgI": {
            "name": "",
            "currencyConfigs": {
              "acc": {
                "rate": {
                  "mul": 0,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": true
              },
              "abaacaccb": {
                "rate": {
                  "mul": 2,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "dcccbbcacbaac": "2",
                  "abdcbcddadaa": "0"
                },
                "optRemoteResetTerms": null
              }
            },
            "status": "enabled"
          },
          "AQEAAQACAAAAAQIBAAACAAABAQIAAAIBAAEBAQEBAQI": {
            "name": "",
            "currencyConfigs": {
              "bca": {
                "rate": {
                  "mul": 1,
                  "add": 1
                },
                "remoteMaxDebt": "0",
                "isOpen": false
              }
            },
            "optLastIncomingMoveToken": null,
            "liveness": "online",
            "channelStatus": {
              "consistent": {
                "currencyReports": {
                  "cbabdbcaaaaa": {
                    "balance": "-1",
                    "localPendingDebt": "0",
                    "remotePendingDebt": "1"
                  },
                  "adbc": {
                    "balance": "2",
                    "localPendingDebt": "2",
                    "remotePendingDebt": "0"
                  }
                }
              }
            },
            "status": "disabled"
          }
        },
        "openInvoices": {
          "AgABAAEAAQEBAAICAgABAgIBAQAAAgAAAgACAQACAgA": {
            "currency": "accdaabdd",
            "totalDestPayment": "0",
            "description": "",
            "isCommited": true,
            "generation": "0"
          }
        },
        "openPayments": {
          "AAAAAgABAQIBAAAAAAEAAQ": {
            "invoiceId": "AAIBAQICAAICAQIBAgICAQEBAQABAAAAAAICAQEAAgE",
            "currency": "aadabbbcaa",
            "destPublicKey": "AQECAAICAQEAAAABAAACAgEAAQICAAACAgACAAEAAAE",
            "destPayment": "0",
            "description": "(\n",
            "generation": "2",
            "status": {
              "success": [
                {
                  "responseHash": "AQABAAIAAgAAAgECAAABAgABAQAAAQIAAQIBAgEBAQA",
                  "invoiceId": "AgECAAEBAAIBAAEBAAIBAgIAAgICAQAAAgEAAAIAAgE",
                  "currency": {
                    "currency": "bdad"
                  },
                  "srcPlainLock": "AAECAgIBAAAAAgACAQIAAAACAgABAgABAQICAgACAgI",
                  "destPlainLock": "AAIBAQAAAAIAAAABAgACAgABAAICAgIAAAICAgACAQA",
                  "isComplete": false,
                  "destPayment": "1",
                  "totalDestPayment": "2",
                  "signature": "AgAAAgACAgABAAACAQAAAAEAAQEAAQIAAgAAAgABAQIAAAABAAEBAQIAAAIBAQECAgEAAgEBAgEAAQICAgEAAg"
                },
                "0",
                "AgABAAACAQIBAgICAAECAg"
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
    "2",
    {
      "paymentFees": {
        "paymentId": "AQIAAAIAAQIBAAIAAgEAAQ",
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
      "",
      "0",
      {
        "routes": false,
        "buyer": false,
        "seller": false,
        "config": true
      },
      {
        "localPublicKey": "AQACAgEAAQIAAAECAQIBAQICAgIAAQECAQEBAQIAAgI",
        "indexServers": [
          {
            "publicKey": "AAECAgIBAQIAAQAAAQACAAICAQECAgAAAAACAgABAAA",
            "address": {
              "address": "cccdbcdacacbccadcbcaacdbdbddbbacabbaaabbbddcabbbdcabbbcacbdaaaadcbabbbdddbccbcbdacccddddcbbbabbbabdcccacaaacdbdbaadabbbaddbdadccaacbccbcbbaacdcdaabbbcbcbdbbcccdabbbdbcaababaabbcabcddaabddccdbdbdaabdabbcdcadabbcdbdaadadaabdbcdabbcacadcddaddaccd"
            },
            "name": ""
          }
        ],
        "optConnectedIndexServer": "AgABAQICAQIBAQIAAAAAAgIAAgIAAgACAAIBAgECAgE",
        "relays": [
          {
            "publicKey": "AAIBAAIBAgABAgABAQACAgAAAQECAgEAAgIAAAICAAE",
            "address": {
              "address": "ddbcdaccaababdcbbdacabadbaadcdbddaaccdacadbdcbddadddcadccccabbdaacbccbcbdccbddbdbacaabaddbbaababbbacdbdbbbabddbabbdbadaddbbaccabcbcaaddbdababcddcdcbdcbdadbadcbdabddddba"
            },
            "name": ""
          }
        ],
        "friends": {},
        "openInvoices": {},
        "openPayments": {
          "AQAAAQAAAgEAAAAAAgABAA": {
            "invoiceId": "AQICAQEAAAICAgIBAAAAAgICAAEBAgABAQICAAEAAgI",
            "currency": "acdaccbba",
            "destPublicKey": "AQAAAAABAAICAgECAAAAAQIBAQIBAgECAgAAAQACAQI",
            "destPayment": "0",
            "description": "B󩎼",
            "generation": "0",
            "status": {
              "searchingRoute": "AgIBAAEBAAAAAAEBAAABAQ"
            }
          },
          "AQEBAAAAAAICAAECAQAAAQ": {
            "invoiceId": "AQABAgABAQECAQEBAAABAAACAQAAAgIBAQACAAICAQE",
            "currency": "accabacccacaad",
            "destPublicKey": "AQABAAACAQAAAgAAAQABAAICAgAAAgICAAEBAgAAAgA",
            "destPayment": "0",
            "description": "",
            "generation": "0",
            "status": {
              "commit": [
                {
                  "responseHash": "AQEBAgEAAAICAgABAgEBAQECAQIAAAIBAAICAQEBAQA",
                  "srcPlainLock": "AgICAAECAAACAgAAAgICAgICAQAAAgACAgABAgIAAAI",
                  "destHashedLock": "AQAAAgAAAQABAgAAAAECAQECAgECAAACAAAAAgECAAA",
                  "destPayment": "1",
                  "totalDestPayment": "2",
                  "invoiceId": "AQICAQABAQIBAQECAAAAAQACAQECAQACAgIAAAIBAQI",
                  "currency": "dcaaddacdaaba",
                  "signature": "AAEAAQABAAIAAgABAAEBAAACAQAAAgECAAICAgABAAABAAECAQICAQIAAAIAAgEAAQAAAAEBAQAAAgEAAAEBAg"
                },
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
  "nodesStatus": {}
}
''',
r'''
{
  "node": [
    "1",
    {
      "report": {
        "localPublicKey": "AAACAAABAAIBAAEBAAABAgICAgEAAgEBAQEAAgIBAgA",
        "indexServers": [],
        "optConnectedIndexServer": "AgICAgICAgACAgIBAAEAAAEAAQIAAgIBAAACAgEAAAE",
        "relays": [],
        "friends": {
          "AQICAAABAQACAQAAAQAAAQEBAQEAAgEAAgECAQIBAAA": {
            "name": "",
            "currencyConfigs": {
              "dbcbcddb": {
                "rate": {
                  "mul": 1,
                  "add": 1
                },
                "remoteMaxDebt": "1",
                "isOpen": true
              }
            },
            "optLastIncomingMoveToken": {
              "prefixHash": "AgEAAQICAAACAgABAgACAgICAgICAgECAAABAQIBAgE",
              "tokenInfo": {
                "mc": {
                  "localPublicKey": "AgAAAQICAQABAAIBAAEAAAIAAgICAQACAQEBAgIBAgI",
                  "remotePublicKey": "AQIBAgEAAgIAAgABAAICAgECAAAAAQEBAAICAAICAgI",
                  "balances": {}
                },
                "counters": {
                  "inconsistencyCounter": "2",
                  "moveTokenCounter": "1"
                }
              },
              "randNonce": "AQIAAgACAgIAAAACAgEBAQ",
              "newToken": "AgABAQEBAgAAAgECAQEAAgEAAAABAQEAAgACAAACAAAAAAACAgAAAgECAgEBAQEBAQAAAAAAAgECAgEAAgEAAg"
            },
            "liveness": "online",
            "channelStatus": {
              "inconsistent": {
                "localResetTerms": {
                  "caddcdbbacdcb": "-2"
                },
                "optRemoteResetTerms": {
                  "resetToken": "AQECAgAAAAAAAAIBAQEAAgECAgEAAAEBAgAAAAIBAQECAAAAAAABAgECAgICAgAAAgACAQEAAQEBAgECAAEBAg",
                  "balanceForReset": {
                    "bbcacbb": "2"
                  }
                }
              }
            },
            "status": "enabled"
          }
        },
        "openInvoices": {},
        "openPayments": {
          "AQIAAgEBAAIBAAICAQAAAQ": {
            "invoiceId": "AQAAAQICAQEBAgIAAQIBAAIAAgIBAAIBAAEBAAICAgA",
            "currency": "b",
            "destPublicKey": "AAICAgEBAQEAAQEAAQICAAAAAQIBAgECAAACAQECAgI",
            "destPayment": "2",
            "description": "",
            "generation": "2",
            "status": {
              "failure": "AQICAAACAQIAAgICAQIBAA"
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
    "􊍂": {
      "isOpen": false,
      "info": {
        "local": {
          "nodePublicKey": "AAECAQEBAgEAAQICAgEBAgIAAAIBAQIAAQICAAACAAA"
        }
      }
    },
    "\u001cm": {
      "isOpen": true,
      "info": {
        "local": {
          "nodePublicKey": "AAIAAAEAAQECAgIAAgAAAAECAAIAAQECAQIBAQAAAAE"
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
      "responseVerifyCommit": {
        "requestId": "AgACAgEAAQEBAAEAAQICAA",
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
      "paymentCommit": {
        "paymentId": "AQEAAQICAgACAAACAAEAAA",
        "commit": {
          "responseHash": "AgEAAgACAgIBAgABAgACAQAAAQICAQIBAgIBAAICAgA",
          "srcPlainLock": "AgECAQIBAAAAAQAAAAEAAAEBAQIAAQIBAAICAQECAgE",
          "destHashedLock": "AgAAAAIAAQECAAEBAAEAAgIAAAIBAgAAAgACAAECAQA",
          "destPayment": "0",
          "totalDestPayment": "0",
          "invoiceId": "AgECAAIAAgAAAgECAAABAgACAgACAAABAAEBAAIAAQA",
          "currency": "bca",
          "signature": "AQACAAICAQABAgECAgEAAgICAgACAAAAAgIAAgACAAEAAgIAAAABAAICAQEAAQICAAEBAQEBAgIBAAEAAgAAAQ"
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
    "2",
    {
      "paymentCommit": {
        "paymentId": "AQIAAgEBAQECAAEBAAIAAg",
        "commit": {
          "responseHash": "AAEBAQIAAAABAQIAAQAAAgACAQECAgECAgICAgECAAE",
          "srcPlainLock": "AAIAAgAAAQECAQIBAgEBAgECAgAAAAABAAEBAAABAQA",
          "destHashedLock": "AgAAAQICAgEBAgAAAAECAgACAAABAAICAAACAgABAgE",
          "destPayment": "0",
          "totalDestPayment": "0",
          "invoiceId": "AgIBAQIAAgEAAQECAAICAQICAgEBAAEBAgACAQABAgA",
          "currency": "bcaacddbadccd",
          "signature": "AQEBAgABAAIBAQACAAEBAgICAAABAAAAAQEAAgECAgABAgICAAECAgEAAAEAAgEBAgEBAgACAgABAAAAAAIBAA"
        }
      }
    }
  ]
}
''',
r'''
{
  "nodesStatus": {
    "5 ": {
      "isOpen": false,
      "info": {
        "remote": {
          "appPublicKey": "AgEAAAEBAAIBAQABAAICAAIAAgIBAQIBAgEAAQIAAgA",
          "nodePublicKey": "AAIAAgIAAQACAgABAAIBAgEBAgIAAAEAAgACAQABAAA",
          "nodeAddress": {
            "address": "dcdcbbcbcdcabcbcbabadaccadaccaddcbccccbccdccaccabcddcbbbbcdbaaabaddbcbbaaadbbacaccdaacdccddcbbaaaabdd"
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
    "failure": "~"
  }
}
''',
r'''
{
  "node": [
    "2",
    {
      "paymentCommit": {
        "paymentId": "AAIAAQEBAgACAQABAAABAg",
        "commit": {
          "responseHash": "AgEAAAECAAICAgEBAQICAAAAAQEBAAAAAAABAAIBAAA",
          "srcPlainLock": "AAECAQIBAgAAAQAAAAEBAQEAAAIBAgIAAAICAQAAAAA",
          "destHashedLock": "AAIBAgEBAAIAAgABAAEAAgIBAQICAAECAAECAgIBAQA",
          "destPayment": "2",
          "totalDestPayment": "0",
          "invoiceId": "AAIAAgACAQICAQEBAAAAAAICAQIAAQIBAgICAgEBAQE",
          "currency": "badbbcdadabdac",
          "signature": "AQICAAACAgECAQIBAQEBAgECAgIBAgICAgACAQIBAgEBAAEAAQABAQECAQIAAgICAQIBAAABAAAAAgICAgIBAg"
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
        "paymentId": "AQIAAQACAgECAgEBAQAAAQ",
        "commit": {
          "responseHash": "AAECAQACAAIBAgEAAQEAAgECAgEBAAIBAQIBAAIAAAE",
          "srcPlainLock": "AAACAQABAAAAAgAAAQECAAIAAQIAAQAAAAABAQABAQI",
          "destHashedLock": "AQACAQEAAQECAgAAAgIBAgACAgIBAQECAgECAAIAAgA",
          "destPayment": "1",
          "totalDestPayment": "1",
          "invoiceId": "AAICAAAAAgABAgEAAAIAAQEBAgEAAAACAgIBAQACAgE",
          "currency": "ddacaacbc",
          "signature": "AAACAAACAgAAAAIBAQEAAAIAAAAAAgIAAQEBAgEBAQACAQIBAgIBAgAAAQEBAAEAAQABAQAAAQIAAQEAAAIAAA"
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
];

// -------------------------------------
final userToServer = [
r'''
{
  "node": [
    "0",
    {
      "addFriend": {
        "friendPublicKey": "AgIAAQICAQABAAECAgIAAgICAQIAAQACAQABAAABAgE",
        "relays": [],
        "name": ""
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
  "closeNode": "1"
}
''',
r'''
{
  "removeNode": "e"
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "requestOpenNode": "𞼾"
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
  "removeNode": "啻￸"
}
''',
r'''
{
  "removeNode": "􏿿"
}
''',
r'''
{
  "removeNode": "\""
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "8"
    }
  }
}
''',
r'''
{
  "removeNode": "$―"
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "["
    }
  }
}
''',
r'''
{
  "removeNode": "A`"
}
''',
r'''
{
  "removeNode": "򸈣"
}
''',
r'''
{
  "removeNode": "\u0010R"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "㚭",
      "appPrivateKey": "AgIAAgACAAABAAECAgAAAgACAQACAAACAAAAAAAAAgAAAAACAQACAgECAQIBAQIBAAEAAQICAAAAAAICAAICAgABAQECAAECAgACAgIAAgICAQIBAA",
      "nodePublicKey": "AQECAAEAAQIBAQEBAQAAAQEAAQIBAgIBAgICAAEAAQI",
      "nodeAddress": {
        "address": "caaacabaabcdcacadacb"
      }
    }
  }
}
''',
r'''
{
  "requestOpenNode": ">"
}
''',
r'''
{
  "removeNode": "_X"
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "",
      "appPrivateKey": "AQEAAAABAAIAAgABAgIBAQIBAgABAQECAgEBAAICAgEBAgEBAQIAAQABAgABAQEBAAIBAgAAAAECAQEAAAIBAgIBAAIAAQICAAAAAQIAAQIAAQACAQ",
      "nodePublicKey": "AQICAAICAQICAAEAAAECAgACAAAAAAEBAQICAQACAQE",
      "nodeAddress": {
        "address": "cdcbbacdaabbbcbdbcbbbcdbdccbabdabcdacbcaaabdacdcdacaabddcabaadbcccdabbdcbbaadccbccbcbddabcacabacacdadcbcddbacbababcbdbbabcaddccbacbdaccdcbcdccbccbcdacbdacbdabdacbdacaccdccbaabadbadcdccddaac"
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
      "setFriendRelays": {
        "friendPublicKey": "AQIAAAICAgIBAgICAgIBAQIAAQABAAECAAABAAAAAgI",
        "relays": []
      }
    }
  ]
}
''',
r'''
{
  "closeNode": "0"
}
''',
r'''
{
  "requestOpenNode": "\u0013"
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "requestOpenNode": "O"
}
''',
r'''
{
  "node": [
    "2",
    {
      "enableFriend": "AAEBAQECAgAAAQEAAAIAAAEBAgECAQICAQEBAgAAAgI"
    }
  ]
}
''',
r'''
{
  "node": [
    "0",
    {
      "addInvoice": {
        "invoiceId": "AQEBAAACAgABAAABAAEBAgEBAgACAQICAAABAAEBAgI",
        "currency": "accadbcbbc",
        "totalDestPayment": "2",
        "description": "#"
      }
    }
  ]
}
''',
r'''
{
  "removeNode": "k⁊"
}
''',
r'''
{
  "requestOpenNode": "z"
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
    "createNodeRemote": {
      "nodeName": "󬈗/",
      "appPrivateKey": "AQICAgAAAAIBAgACAAIAAQIAAgEAAgIAAAIAAQIAAQIBAAABAgIBAgAAAgEBAAAAAgEBAQIAAAACAQABAgABAAACAgECAgEBAQEAAQECAAABAQIBAA",
      "nodePublicKey": "AAACAgAAAgABAgECAgEBAAIBAAABAAEAAgAAAgICAgA",
      "nodeAddress": {
        "address": "cdacbadbbcdabaabaacabb"
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
  "removeNode": " "
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
  "closeNode": "1"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "",
      "appPrivateKey": "AgIAAQABAgEBAQIAAAIBAQIBAgECAAECAAEBAAABAAACAQEBAAACAAABAQABAQEAAAACAAACAgIBAAEAAQECAQACAgIBAQIAAgABAAIBAAICAAECAA",
      "nodePublicKey": "AAEAAQAAAQICAQAAAgEAAQACAQACAgEBAQECAgABAAE",
      "nodeAddress": {
        "address": "baaaddcddbddbcbcaadabaabbbdbdbaddccacdcbadbcbcb"
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
    "2",
    {
      "requestVerifyCommit": {
        "requestId": "AQECAAEBAQEBAAEBAAIAAQ",
        "commit": {
          "responseHash": "AgEBAAIBAAEAAQEAAgICAAICAQACAAIBAQACAQEAAQE",
          "srcPlainLock": "AQABAgEAAQIBAQACAAEAAgAAAgABAAIBAQEBAQIBAQI",
          "destHashedLock": "AgIBAAAAAQIAAgAAAQEBAAEBAgEBAAEBAAAAAQICAQE",
          "destPayment": "2",
          "totalDestPayment": "1",
          "invoiceId": "AgIBAgIAAgEAAgECAAECAgAAAAICAgABAgIAAAEBAgA",
          "currency": "cbadaa",
          "signature": "AgICAAIAAQABAgECAQIBAAABAgIAAgIBAAACAgEBAgICAgIAAAEAAAECAgAAAgEAAgAAAQEBAAICAQIBAAABAA"
        }
      }
    }
  ]
}
''',
r'''
{
  "requestOpenNode": "\u0015\u0011"
}
''',
r'''
{
  "removeNode": "횓"
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
      "enableFriend": "AAECAAEAAAEAAQIAAAICAQIAAQICAAEAAAABAgIBAAE"
    }
  ]
}
''',
r'''
{
  "node": [
    "0",
    {
      "removeIndexServer": "AQEAAQEBAAIAAgICAQAAAAAAAAIAAAABAAEBAgIBAAI"
    }
  ]
}
''',
r'''
{
  "node": [
    "2",
    {
      "addRelay": {
        "publicKey": "AQACAgICAAABAQAAAAECAAEBAAABAgACAAACAQIBAQI",
        "address": {
          "address": "accbadbdbddabccaadbbabbbcabbdaaadbaccaabcdbbddabcbdcdcbbdbaaadbaccacdbbbbdcacbaaaacddddcacacbcbdbcdaaabbdddbcdadbaabaaaccdbaaaadddccccdbcddaadabaaabdddddaacadcabcbd"
        },
        "name": "@"
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
      "initPayment": {
        "paymentId": "AAIAAgEAAQEBAQABAAECAA",
        "invoiceId": "AAECAgABAAICAAEBAQIBAgABAQACAQEAAQICAgABAgA",
        "currency": "aa",
        "destPublicKey": "AAAAAAEBAgIBAAECAgIBAAABAQECAgABAQIBAAABAAA",
        "destPayment": "0",
        "description": "~"
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
      "appPrivateKey": "AQACAQECAgAAAQEAAgEBAAECAgIBAgECAQICAgAAAAICAAIBAAECAgEBAgIAAQABAQEAAgACAgAAAAEAAgACAQECAQICAQICAAICAgECAgICAAICAg",
      "nodePublicKey": "AgEBAAIBAQACAQIAAgAAAAACAQIBAQEAAgACAAIBAAA",
      "nodeAddress": {
        "address": "cbadabcadacbbcbacaaadadbbcb"
      }
    }
  }
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "믫"
    }
  }
}
''',
r'''
{
  "removeNode": "⁁\t"
}
''',
r'''
{
  "requestOpenNode": "!{"
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "removeNode": "⁕"
}
''',
r'''
{
  "requestOpenNode": ""
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
    "createNodeRemote": {
      "nodeName": "󿿾",
      "appPrivateKey": "AAAAAAACAgECAQIAAQABAQECAAIBAQIBAAEAAQEAAAACAAACAgIBAgACAAAAAgIAAgIBAQECAQABAAEAAQEAAAACAgEAAAICAQECAQAAAAECAQECAQ",
      "nodePublicKey": "AAAAAgIBAQECAQICAQABAAICAAIAAQABAQABAQEBAQA",
      "nodeAddress": {
        "address": "ddacccbaccdcddddbbcaabaacaabddbbdbccbbccbabccbcdbccdccacbdadcadbadbaacccadaadadadddbcdcabdcbacdadacbdacaacbabbbcabdbadacabaacdaadadcbbdabccdabbabdddbdbbcbabaabbadddabcdbcccab"
      }
    }
  }
}
''',
r'''
{
  "removeNode": "©"
}
''',
r'''
{
  "requestOpenNode": ""
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
      "openFriendCurrency": {
        "friendPublicKey": "AgABAQIAAAIAAgAAAQICAAEBAAEAAgABAgAAAAIAAgI",
        "currency": "da"
      }
    }
  ]
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
      "addRelay": {
        "publicKey": "AAEAAAECAAIAAgIAAAABAgIAAQIAAAEBAgIAAgACAAA",
        "address": {
          "address": "dcdbbdcddccbabddbdcdcacdbbbbdbaacaacacbdcdcdadcddabccbbbbabbccbacbdcdcdcbabcdcbdbdbaaaadadaaabacddbdcbbdacaddbcdccbaddbba"
        },
        "name": "\u0010"
      }
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
  "closeNode": "1"
}
''',
r'''
{
  "removeNode": "⁈"
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
      "initPayment": {
        "paymentId": "AQICAgAAAgAAAAEBAAAAAA",
        "invoiceId": "AgIBAQICAQICAgABAQACAAIBAQECAQICAAEAAAEBAAE",
        "currency": "aa",
        "destPublicKey": "AgECAQAAAgEAAgICAAIAAAIBAgIAAAIAAQICAgEBAgI",
        "destPayment": "0",
        "description": "~󷅂"
      }
    }
  ]
}
''',
r'''
{
  "removeNode": "&y"
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "",
      "appPrivateKey": "AAICAgACAQEAAQIBAQACAQAAAQEBAQEBAgIAAQABAgIBAgIBAAACAQIAAQEAAQABAQABAAEBAgICAQIBAQIBAgEAAQICAQIBAAIAAAICAgAAAgIAAg",
      "nodePublicKey": "AQECAAABAQECAgACAgEAAgACAAICAgAAAQABAQECAQI",
      "nodeAddress": {
        "address": "ccddbcbcaaabdbbcadaccabbdbddcdccaacbdbbdbdabcddbacbddcccacaabbcddadacbcadaacdabcbcacddbccacbcabbdabacbbdcbbbdbcbcdaadbcc"
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
  "createNode": {
    "createNodeLocal": {
      "nodeName": "\n"
    }
  }
}
''',
r'''
{
  "requestOpenNode": "0⁔"
}
''',
r'''
{
  "node": [
    "2",
    {
      "ackPaymentDone": [
        "AQABAAIBAAICAQIAAAABAQ",
        "AgABAAABAgIBAAAAAAECAQ"
      ]
    }
  ]
}
''',
r'''
{
  "node": [
    "2",
    {
      "setFriendCurrencyRate": {
        "friendPublicKey": "AAAAAgECAQEAAgABAAABAQABAAEAAAAAAQICAgIAAQI",
        "currency": "cdcaaccbda",
        "rate": {
          "mul": 1,
          "add": 2
        }
      }
    }
  ]
}
''',
r'''
{
  "requestOpenNode": ">R"
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
      "nodeName": ""
    }
  }
}
''',
r'''
{
  "requestOpenNode": "§B"
}
''',
r'''
{
  "node": [
    "1",
    {
      "removeIndexServer": "AgEAAAIBAQAAAQEBAQABAgECAAEBAQABAAACAQEBAQE"
    }
  ]
}
''',
r'''
{
  "createNode": {
    "createNodeLocal": {
      "nodeName": "`"
    }
  }
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": "",
      "appPrivateKey": "AQEAAAECAgIBAgIBAQIAAAAAAAIAAQIAAgIBAQABAgIAAgAAAgAAAQAAAQABAgEBAQIAAgIBAAIAAQEAAgABAQACAgIAAQACAAEBAQEBAgECAAACAA",
      "nodePublicKey": "AAEBAgAAAgABAQEAAQECAgIAAAIBAQACAgIAAQECAQA",
      "nodeAddress": {
        "address": "adababcdacbccbaaccbddbabacdbadcdbcacabadadcccaadbbdbacbcabcdcabcbdabcbbddbcacdbcbbadcdbdabdabccadccbabdbaabbacadcaaacbbadaabbbaabaaabadbb"
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
  "node": [
    "1",
    {
      "cancelPayment": "AgEBAQIBAQEBAAICAQEAAQ"
    }
  ]
}
''',
r'''
{
  "requestOpenNode": "/阝"
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
  "createNode": {
    "createNodeLocal": {
      "nodeName": "M"
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
  "node": [
    "1",
    {
      "ackPaymentDone": [
        "AAACAAECAQIAAAAAAgEBAQ",
        "AQIBAQICAgEBAgEBAQAAAA"
      ]
    }
  ]
}
''',
r'''
{
  "createNode": {
    "createNodeRemote": {
      "nodeName": ">\n",
      "appPrivateKey": "AAICAAIBAQAAAAEBAAAAAAIAAgEBAAICAAIAAgACAgIAAgABAQIAAQEAAAEBAAECAAIAAgIAAQIBAQICAQICAQEBAgECAQEBAgIBAAECAAABAQEBAg",
      "nodePublicKey": "AgACAgICAAIBAAIBAgICAQEAAAEAAAEBAQICAQABAgA",
      "nodeAddress": {
        "address": "bbbaadadcacdccbcbaadabbabcbcdaaadccdcbabbdaabcdbbcaddcbcdadbcbcdcadabcccddcaacbbbcaaabbdabcbabdadddbacdbbadbcbccbbcacbbcbadbcacabcbbbbabdadbaabccbbdcbdbcdacbbcbacdacbdadbabcbbccaddacbcdbccddbdbabdbbcdacdbbbcbccacdbaadbbbc"
      }
    }
  }
}
''',
r'''
{
  "removeNode": ""
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "requestOpenNode": "­"
}
''',
r'''
{
  "requestOpenNode": "򈩴"
}
''',
r'''
{
  "removeNode": "¨"
}
''',
r'''
{
  "requestOpenNode": ""
}
''',
r'''
{
  "removeNode": ""
}
''',
r'''
{
  "closeNode": "2"
}
''',
r'''
{
  "closeNode": "0"
}
''',
];

