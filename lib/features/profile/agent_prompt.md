# Design Export Context

- Generated at: `2026-04-21T17:24:29.472Z`
- Document ID: `5230f768-cbc2-414a-9eae-c8be387f41c7`
- Page count: 1

## Original Prompt

```text
Link saving and management app
```

## Theme (JSON)

```json
{
  "fonts": {
    "primary": "google:Oswald",
    "secondary": "google:Space Grotesk"
  },
  "colors": {
    "light": {
      "primary": "#D90429",
      "on_primary": "#EDF2F4",
      "secondary": "#8D99AE",
      "on_secondary": "#000000",
      "accent": "#EDF2F4",
      "background": "#000000",
      "surface": "#1A1A1A",
      "on_surface": "#EDF2F4",
      "primary_text": "#EDF2F4",
      "secondary_text": "#8D99AE",
      "hint": "#8D99AE",
      "error": "#D90429",
      "on_error": "#EDF2F4",
      "success": "#34C759",
      "divider": "#D90429",
      "transparent": "#00000000"
    },
    "dark": {
      "primary": "#D90429",
      "on_primary": "#EDF2F4",
      "secondary": "#8D99AE",
      "on_secondary": "#000000",
      "accent": "#EDF2F4",
      "background": "#000000",
      "surface": "#1A1A1A",
      "on_surface": "#EDF2F4",
      "primary_text": "#EDF2F4",
      "secondary_text": "#8D99AE",
      "hint": "#8D99AE",
      "error": "#D90429",
      "on_error": "#EDF2F4",
      "success": "#30D158",
      "divider": "#D90429",
      "transparent": "#00000000"
    }
  },
  "text_styles": {
    "headline_large": {
      "font": "primary",
      "size": 48,
      "weight": 700,
      "height": 1
    },
    "headline_medium": {
      "font": "primary",
      "size": 32,
      "weight": 700,
      "height": 1.1
    },
    "title_large": {
      "font": "primary",
      "size": 22,
      "weight": 600,
      "height": 1.2
    },
    "title_medium": {
      "font": "secondary",
      "size": 17,
      "weight": 700,
      "height": 1.2
    },
    "body_large": {
      "font": "secondary",
      "size": 17,
      "weight": 400,
      "height": 1.4
    },
    "body_medium": {
      "font": "secondary",
      "size": 15,
      "weight": 400,
      "height": 1.4
    },
    "body_small": {
      "font": "secondary",
      "size": 13,
      "weight": 400,
      "height": 1.4
    },
    "label_large": {
      "font": "primary",
      "size": 15,
      "weight": 600,
      "height": 1.2
    },
    "label_medium": {
      "font": "primary",
      "size": 13,
      "weight": 600,
      "height": 1.2
    },
    "label_small": {
      "font": "primary",
      "size": 11,
      "weight": 600,
      "height": 1.2
    }
  },
  "spacing": {
    "xs": 4,
    "sm": 8,
    "md": 16,
    "lg": 32,
    "xl": 64
  },
  "radii": {
    "sm": 0,
    "md": 0,
    "lg": 0,
    "full": 0
  },
  "shadows": {
    "sm": {
      "color": "#D90429",
      "dx": 2,
      "dy": 2,
      "blur": 0,
      "spread": 0
    },
    "md": {
      "color": "#8D99AE",
      "dx": 4,
      "dy": 4,
      "blur": 0,
      "spread": 0
    },
    "lg": {
      "color": "#D90429",
      "dx": 6,
      "dy": 6,
      "blur": 0,
      "spread": 0
    },
    "xl": {
      "color": "#D90429",
      "dx": 8,
      "dy": 8,
      "blur": 0,
      "spread": 0
    }
  }
}
```

## Pages

### 1. User Profile

- Frame ID: `frame5`
- Original page prompt: "User account settings and storage statistics"
- Follow-up prompts: _None_

#### DslDocument (JSON)

```json
{
  "root": {
    "type": "scaffold",
    "properties": {
      "bg": {
        "color": {
          "color": "background"
        }
      },
      "safe_area": {
        "boolVal": {
          "value": true
        }
      }
    },
    "children": [
      {
        "type": "column",
        "properties": {
          "scroll": {
            "boolVal": {
              "value": true
            }
          },
          "padding": {
            "edgeInsets": {
              "top": 0,
              "right": 0,
              "bottom": 0,
              "left": 0,
              "token": "lg"
            }
          },
          "spacing": {
            "stringVal": {
              "value": "lg"
            }
          },
          "cross_align": {
            "align": {
              "named": "stretch"
            }
          }
        },
        "children": [
          {
            "type": "row",
            "properties": {
              "align": {
                "align": {
                  "named": "space_between"
                }
              },
              "cross_align": {
                "align": {
                  "named": "start"
                }
              }
            },
            "children": [
              {
                "type": "column",
                "properties": {
                  "cross_align": {
                    "align": {
                      "named": "start"
                    }
                  },
                  "spacing": {
                    "stringVal": {
                      "value": "xs"
                    }
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "USER_CORE"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "headline_large"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      }
                    },
                    "editorId": "text57"
                  },
                  {
                    "type": "container",
                    "properties": {
                      "transform_rotate": {
                        "numberVal": {
                          "value": -1
                        }
                      },
                      "bg": {
                        "color": {
                          "color": "primary"
                        }
                      },
                      "padding": {
                        "edgeInsets": {
                          "top": 2,
                          "right": 8,
                          "bottom": 2,
                          "left": 8
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "AUTH_LEVEL_01"
                            }
                          },
                          "style": {
                            "textStyle": {
                              "styleName": "label_small"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "on_primary"
                            }
                          },
                          "font_weight": {
                            "numberVal": {
                              "value": 900
                            }
                          }
                        },
                        "editorId": "text58"
                      }
                    ],
                    "editorId": "container65"
                  }
                ],
                "editorId": "column44"
              },
              {
                "type": "container",
                "properties": {
                  "width": {
                    "px": {
                      "value": 64,
                      "isInfinity": false
                    }
                  },
                  "height": {
                    "px": {
                      "value": 64,
                      "isInfinity": false
                    }
                  },
                  "border": {
                    "border": {
                      "width": 2,
                      "color": "primary"
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 4,
                      "right": 4,
                      "bottom": 4,
                      "left": 4
                    }
                  },
                  "clip": {
                    "boolVal": {
                      "value": true
                    }
                  }
                },
                "children": [
                  {
                    "type": "image",
                    "properties": {
                      "source_desc": {
                        "imageSource": {
                          "type": "IMAGE_SOURCE_TYPE_URL",
                          "value": "https://dimg.dreamflow.cloud/v1/image/cyberpunk+male+portrait+high+contrast"
                        }
                      },
                      "fit": {
                        "stringVal": {
                          "value": "cover"
                        }
                      },
                      "width": {
                        "px": {
                          "value": "Infinity",
                          "isInfinity": true
                        }
                      },
                      "height": {
                        "px": {
                          "value": "Infinity",
                          "isInfinity": true
                        }
                      }
                    },
                    "editorId": "image2"
                  }
                ],
                "editorId": "container66"
              }
            ],
            "editorId": "row35"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "md"
                }
              }
            },
            "children": [
              {
                "type": "row",
                "properties": {
                  "align": {
                    "align": {
                      "named": "space_between"
                    }
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "STORAGE_CAPACITY"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "label_large"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      },
                      "font_weight": {
                        "numberVal": {
                          "value": 700
                        }
                      }
                    },
                    "editorId": "text59"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "68%"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "label_large"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary"
                        }
                      }
                    },
                    "editorId": "text60"
                  }
                ],
                "editorId": "row36"
              },
              {
                "type": "container",
                "properties": {
                  "height": {
                    "px": {
                      "value": 12,
                      "isInfinity": false
                    }
                  },
                  "bg": {
                    "color": {
                      "color": "surface"
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "secondary"
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 2,
                      "right": 2,
                      "bottom": 2,
                      "left": 2
                    }
                  }
                },
                "children": [
                  {
                    "type": "row",
                    "children": [
                      {
                        "type": "container",
                        "properties": {
                          "expanded": {
                            "expanded": {
                              "enabled": true,
                              "flex": 68
                            }
                          },
                          "bg": {
                            "color": {
                              "color": "primary"
                            }
                          },
                          "height": {
                            "px": {
                              "value": "Infinity",
                              "isInfinity": true
                            }
                          }
                        },
                        "editorId": "container68"
                      },
                      {
                        "type": "spacer",
                        "properties": {
                          "expanded": {
                            "expanded": {
                              "enabled": true,
                              "flex": 32
                            }
                          }
                        },
                        "editorId": "spacer2"
                      }
                    ],
                    "editorId": "row37"
                  }
                ],
                "editorId": "container67"
              },
              {
                "type": "row",
                "properties": {
                  "spacing": {
                    "stringVal": {
                      "value": "md"
                    }
                  }
                },
                "children": [
                  {
                    "type": "@stat_velocity_box",
                    "properties": {
                      "label": {
                        "stringVal": {
                          "value": "LINKS_SAVED"
                        }
                      },
                      "value": {
                        "stringVal": {
                          "value": "1,284"
                        }
                      },
                      "unit": {
                        "stringVal": {
                          "value": "OBJ"
                        }
                      }
                    },
                    "editorId": "statvelocitybox1"
                  },
                  {
                    "type": "@stat_velocity_box",
                    "properties": {
                      "label": {
                        "stringVal": {
                          "value": "DATA_USED"
                        }
                      },
                      "value": {
                        "stringVal": {
                          "value": "42.8"
                        }
                      },
                      "unit": {
                        "stringVal": {
                          "value": "MB"
                        }
                      }
                    },
                    "editorId": "statvelocitybox2"
                  }
                ],
                "editorId": "row38"
              }
            ],
            "editorId": "column45"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "sm"
                }
              }
            },
            "children": [
              {
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "LINK_VELOCITY_30D"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "label_small"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "secondary_text"
                    }
                  }
                },
                "editorId": "text61"
              },
              {
                "type": "container",
                "properties": {
                  "height": {
                    "px": {
                      "value": 180,
                      "isInfinity": false
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "secondary"
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 0,
                      "right": 0,
                      "bottom": 0,
                      "left": 0,
                      "token": "md"
                    }
                  },
                  "bg": {
                    "color": {
                      "color": "surface"
                    }
                  }
                },
                "children": [
                  {
                    "type": "line_chart",
                    "properties": {
                      "data": {
                        "stringVal": {
                          "value": "12,25,18,35,42,38,55"
                        }
                      },
                      "labels": {
                        "stringVal": {
                          "value": "M,T,W,T,F,S,S"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary"
                        }
                      },
                      "curved": {
                        "boolVal": {
                          "value": true
                        }
                      },
                      "filled": {
                        "boolVal": {
                          "value": true
                        }
                      },
                      "fill_opacity": {
                        "numberVal": {
                          "value": 0.2
                        }
                      },
                      "show_dots": {
                        "boolVal": {
                          "value": false
                        }
                      }
                    },
                    "editorId": "linechart1"
                  }
                ],
                "editorId": "container69"
              }
            ],
            "editorId": "column46"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "numberVal": {
                  "value": 0
                }
              },
              "cross_align": {
                "align": {
                  "named": "stretch"
                }
              }
            },
            "children": [
              {
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "SYSTEM_PREFERENCES"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "label_small"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "primary"
                    }
                  },
                  "margin": {
                    "edgeInsets": {
                      "top": 0,
                      "right": 0,
                      "bottom": 0,
                      "left": 0,
                      "bottomToken": "sm"
                    }
                  }
                },
                "editorId": "text62"
              },
              {
                "type": "@profile_setting_row",
                "properties": {
                  "icon": {
                    "stringVal": {
                      "value": "person_rounded"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "Identity Profile"
                    }
                  },
                  "subtitle": {
                    "stringVal": {
                      "value": "Manage your digital signature"
                    }
                  }
                },
                "editorId": "profilesettingrow1"
              },
              {
                "type": "@profile_setting_row",
                "properties": {
                  "icon": {
                    "stringVal": {
                      "value": "security_rounded"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "Encryption Keys"
                    }
                  },
                  "subtitle": {
                    "stringVal": {
                      "value": "Vault security & 2FA"
                    }
                  }
                },
                "editorId": "profilesettingrow2"
              },
              {
                "type": "@profile_setting_row",
                "properties": {
                  "icon": {
                    "stringVal": {
                      "value": "notifications_active_rounded"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "Pulse Alerts"
                    }
                  },
                  "subtitle": {
                    "stringVal": {
                      "value": "Sync and link notifications"
                    }
                  }
                },
                "editorId": "profilesettingrow3"
              },
              {
                "type": "@profile_setting_row",
                "properties": {
                  "icon": {
                    "stringVal": {
                      "value": "cloud_sync_rounded"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "Data Export"
                    }
                  },
                  "subtitle": {
                    "stringVal": {
                      "value": "Download vault archive (.json)"
                    }
                  }
                },
                "editorId": "profilesettingrow4"
              }
            ],
            "editorId": "column47"
          },
          {
            "type": "container",
            "properties": {
              "margin": {
                "edgeInsets": {
                  "top": 24,
                  "right": 0,
                  "bottom": 24,
                  "left": 0
                }
              },
              "border": {
                "border": {
                  "width": 2,
                  "color": "error"
                }
              },
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "token": "md"
                }
              },
              "align_child": {
                "align": {
                  "named": "center"
                }
              }
            },
            "children": [
              {
                "type": "row",
                "properties": {
                  "main_size": {
                    "stringVal": {
                      "value": "min"
                    }
                  },
                  "spacing": {
                    "stringVal": {
                      "value": "sm"
                    }
                  }
                },
                "children": [
                  {
                    "type": "icon",
                    "properties": {
                      "name": {
                        "icon": {
                          "name": "logout_rounded"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "error"
                        }
                      },
                      "size": {
                        "numberVal": {
                          "value": 20
                        }
                      }
                    },
                    "editorId": "icon20"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "TERMINATE_SESSION"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "label_large"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "error"
                        }
                      },
                      "font_weight": {
                        "numberVal": {
                          "value": 700
                        }
                      }
                    },
                    "editorId": "text63"
                  }
                ],
                "editorId": "row39"
              }
            ],
            "editorId": "container70"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "xs"
                }
              },
              "align": {
                "align": {
                  "named": "center"
                }
              }
            },
            "children": [
              {
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "LINKVAULT_OS v2.4.0-STABLE"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "label_small"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "hint"
                    }
                  }
                },
                "editorId": "text64"
              },
              {
                "type": "container",
                "properties": {
                  "width": {
                    "px": {
                      "value": 40,
                      "isInfinity": false
                    }
                  },
                  "height": {
                    "px": {
                      "value": 2,
                      "isInfinity": false
                    }
                  },
                  "bg": {
                    "color": {
                      "color": "secondary"
                    }
                  }
                },
                "editorId": "container71"
              }
            ],
            "editorId": "column48"
          },
          {
            "type": "sizedbox",
            "properties": {
              "height": {
                "stringVal": {
                  "value": "xl"
                }
              }
            },
            "editorId": "sizedbox6"
          }
        ],
        "editorId": "column43"
      },
      {
        "type": "container",
        "properties": {
          "align": {
            "align": {
              "named": "top_center"
            }
          },
          "height": {
            "px": {
              "value": 4,
              "isInfinity": false
            }
          },
          "bg": {
            "color": {
              "color": "primary",
              "opacityPercent": 10
            }
          },
          "width": {
            "px": {
              "value": "Infinity",
              "isInfinity": true
            }
          }
        },
        "children": [
          {
            "type": "container",
            "properties": {
              "align": {
                "align": {
                  "named": "left"
                }
              },
              "width": {
                "percent": {
                  "value": 100
                }
              },
              "bg": {
                "color": {
                  "color": "primary"
                }
              },
              "height": {
                "px": {
                  "value": 4,
                  "isInfinity": false
                }
              }
            },
            "editorId": "container73"
          }
        ],
        "editorId": "container72"
      }
    ],
    "editorId": "scaffold7"
  }
}
```