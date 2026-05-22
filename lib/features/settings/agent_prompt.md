# Design Export Context

- Generated at: `2026-04-21T17:25:06.584Z`
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

### 1. Settings

- Frame ID: `frame3`
- Original page prompt: "App preferences, theme selection, and export options"
- Follow-up prompts:
  1. "Continue with the design of this page"

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
          "cross_align": {
            "align": {
              "named": "stretch"
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
          }
        },
        "children": [
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "sm"
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
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "PREFERENCES"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "headline_medium"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "primary"
                    }
                  }
                },
                "editorId": "text65"
              },
              {
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "Customize your velocity experience"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "body_medium"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "secondary_text"
                    }
                  }
                },
                "editorId": "text66"
              }
            ],
            "editorId": "column50"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "md"
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
                "type": "@velocity_section_header",
                "properties": {
                  "title": {
                    "stringVal": {
                      "value": "ACCOUNT"
                    }
                  }
                },
                "editorId": "velocitysectionheader4"
              },
              {
                "type": "container",
                "properties": {
                  "bg": {
                    "color": {
                      "color": "surface"
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "divider"
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
                  "shadow": {
                    "stringVal": {
                      "value": "sm"
                    }
                  }
                },
                "children": [
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
                        "type": "@profile_setting_row",
                        "properties": {
                          "icon": {
                            "stringVal": {
                              "value": "person_rounded"
                            }
                          },
                          "title": {
                            "stringVal": {
                              "value": "Pro Plan"
                            }
                          },
                          "subtitle": {
                            "stringVal": {
                              "value": "Active until Dec 2024"
                            }
                          }
                        },
                        "editorId": "profilesettingrow5"
                      },
                      {
                        "type": "divider",
                        "properties": {
                          "color": {
                            "color": {
                              "color": "divider",
                              "opacityPercent": 30
                            }
                          }
                        },
                        "editorId": "divider1"
                      },
                      {
                        "type": "@profile_setting_row",
                        "properties": {
                          "icon": {
                            "stringVal": {
                              "value": "storage_rounded"
                            }
                          },
                          "title": {
                            "stringVal": {
                              "value": "Cloud Sync"
                            }
                          },
                          "subtitle": {
                            "stringVal": {
                              "value": "Last synced 2m ago"
                            }
                          }
                        },
                        "editorId": "profilesettingrow6"
                      }
                    ],
                    "editorId": "column52"
                  }
                ],
                "editorId": "container74"
              }
            ],
            "editorId": "column51"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "md"
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
                "type": "@velocity_section_header",
                "properties": {
                  "title": {
                    "stringVal": {
                      "value": "APPEARANCE"
                    }
                  }
                },
                "editorId": "velocitysectionheader5"
              },
              {
                "type": "container",
                "properties": {
                  "bg": {
                    "color": {
                      "color": "surface"
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "divider"
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
                  "shadow": {
                    "stringVal": {
                      "value": "sm"
                    }
                  }
                },
                "children": [
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
                            "type": "@velocity_setting_row",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "Dark Mode"
                                }
                              },
                              "subtext": {
                                "stringVal": {
                                  "value": "High contrast interface"
                                }
                              }
                            },
                            "editorId": "velocitysettingrow1"
                          },
                          {
                            "type": "@std.switch",
                            "properties": {
                              "active": {
                                "boolVal": {
                                  "value": true
                                }
                              },
                              "variant": {
                                "stringVal": {
                                  "value": "iOS"
                                }
                              }
                            },
                            "editorId": "stdswitch1"
                          }
                        ],
                        "editorId": "row40"
                      },
                      {
                        "type": "divider",
                        "properties": {
                          "color": {
                            "color": {
                              "color": "divider",
                              "opacityPercent": 30
                            }
                          }
                        },
                        "editorId": "divider2"
                      },
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
                            "type": "@velocity_setting_row",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "Kinetic Animations"
                                }
                              },
                              "subtext": {
                                "stringVal": {
                                  "value": "Fluid UI transitions"
                                }
                              }
                            },
                            "editorId": "velocitysettingrow2"
                          },
                          {
                            "type": "@std.switch",
                            "properties": {
                              "active": {
                                "boolVal": {
                                  "value": true
                                }
                              },
                              "variant": {
                                "stringVal": {
                                  "value": "iOS"
                                }
                              }
                            },
                            "editorId": "stdswitch2"
                          }
                        ],
                        "editorId": "row41"
                      },
                      {
                        "type": "divider",
                        "properties": {
                          "color": {
                            "color": {
                              "color": "divider",
                              "opacityPercent": 30
                            }
                          }
                        },
                        "editorId": "divider3"
                      },
                      {
                        "type": "column",
                        "properties": {
                          "spacing": {
                            "stringVal": {
                              "value": "sm"
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
                            "type": "@velocity_setting_row",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "Accent Color"
                                }
                              },
                              "subtext": {
                                "stringVal": {
                                  "value": "System-wide highlight"
                                }
                              }
                            },
                            "editorId": "velocitysettingrow3"
                          },
                          {
                            "type": "row",
                            "properties": {
                              "spacing": {
                                "stringVal": {
                                  "value": "md"
                                }
                              },
                              "padding": {
                                "edgeInsets": {
                                  "top": 0,
                                  "right": 0,
                                  "bottom": 0,
                                  "left": 0,
                                  "topToken": "sm",
                                  "bottomToken": "sm"
                                }
                              }
                            },
                            "children": [
                              {
                                "type": "container",
                                "properties": {
                                  "width": {
                                    "px": {
                                      "value": 32,
                                      "isInfinity": false
                                    }
                                  },
                                  "height": {
                                    "px": {
                                      "value": 32,
                                      "isInfinity": false
                                    }
                                  },
                                  "bg": {
                                    "color": {
                                      "color": "primary"
                                    }
                                  },
                                  "border": {
                                    "border": {
                                      "width": 2,
                                      "color": "primary_text"
                                    }
                                  }
                                },
                                "editorId": "container76"
                              },
                              {
                                "type": "container",
                                "properties": {
                                  "width": {
                                    "px": {
                                      "value": 32,
                                      "isInfinity": false
                                    }
                                  },
                                  "height": {
                                    "px": {
                                      "value": 32,
                                      "isInfinity": false
                                    }
                                  },
                                  "bg": {
                                    "color": {
                                      "color": "success"
                                    }
                                  }
                                },
                                "editorId": "container77"
                              },
                              {
                                "type": "container",
                                "properties": {
                                  "width": {
                                    "px": {
                                      "value": 32,
                                      "isInfinity": false
                                    }
                                  },
                                  "height": {
                                    "px": {
                                      "value": 32,
                                      "isInfinity": false
                                    }
                                  },
                                  "bg": {
                                    "color": {
                                      "color": "#007AFF"
                                    }
                                  }
                                },
                                "editorId": "container78"
                              },
                              {
                                "type": "container",
                                "properties": {
                                  "width": {
                                    "px": {
                                      "value": 32,
                                      "isInfinity": false
                                    }
                                  },
                                  "height": {
                                    "px": {
                                      "value": 32,
                                      "isInfinity": false
                                    }
                                  },
                                  "bg": {
                                    "color": {
                                      "color": "#FF9500"
                                    }
                                  }
                                },
                                "editorId": "container79"
                              }
                            ],
                            "editorId": "row42"
                          }
                        ],
                        "editorId": "column55"
                      }
                    ],
                    "editorId": "column54"
                  }
                ],
                "editorId": "container75"
              }
            ],
            "editorId": "column53"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "md"
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
                "type": "@velocity_section_header",
                "properties": {
                  "title": {
                    "stringVal": {
                      "value": "DATA & EXPORT"
                    }
                  }
                },
                "editorId": "velocitysectionheader6"
              },
              {
                "type": "container",
                "properties": {
                  "bg": {
                    "color": {
                      "color": "surface"
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "divider"
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
                  "shadow": {
                    "stringVal": {
                      "value": "sm"
                    }
                  }
                },
                "children": [
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
                        "type": "@velocity_button",
                        "properties": {
                          "icon": {
                            "stringVal": {
                              "value": "download_rounded"
                            }
                          },
                          "label": {
                            "stringVal": {
                              "value": "Export Library (.csv)"
                            }
                          },
                          "primary": {
                            "boolVal": {
                              "value": true
                            }
                          }
                        },
                        "editorId": "velocitybutton3"
                      },
                      {
                        "type": "@velocity_button",
                        "properties": {
                          "icon": {
                            "stringVal": {
                              "value": "upload_file_rounded"
                            }
                          },
                          "label": {
                            "stringVal": {
                              "value": "Import from Pocket/Raindrop"
                            }
                          }
                        },
                        "editorId": "velocitybutton4"
                      },
                      {
                        "type": "@velocity_button",
                        "properties": {
                          "icon": {
                            "stringVal": {
                              "value": "delete_forever_rounded"
                            }
                          },
                          "label": {
                            "stringVal": {
                              "value": "Clear Cache"
                            }
                          },
                          "primary": {
                            "boolVal": {
                              "value": false
                            }
                          }
                        },
                        "editorId": "velocitybutton5"
                      }
                    ],
                    "editorId": "column57"
                  }
                ],
                "editorId": "container80"
              }
            ],
            "editorId": "column56"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "sm"
                }
              },
              "align_child": {
                "align": {
                  "named": "center"
                }
              },
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "topToken": "lg",
                  "bottomToken": "lg"
                }
              }
            },
            "children": [
              {
                "type": "logo_icon",
                "properties": {
                  "name": {
                    "icon": {
                      "name": "speedtest"
                    }
                  },
                  "size": {
                    "numberVal": {
                      "value": 32
                    }
                  },
                  "color": {
                    "color": {
                      "color": "secondary_text"
                    }
                  }
                },
                "editorId": "logoicon2"
              },
              {
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "Velocity v2.4.0"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "label_medium"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "secondary_text"
                    }
                  }
                },
                "editorId": "text67"
              },
              {
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "Made for the fast-paced web"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "label_small"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "secondary_text",
                      "opacityPercent": 50
                    }
                  }
                },
                "editorId": "text68"
              }
            ],
            "editorId": "column58"
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
            "editorId": "sizedbox7"
          }
        ],
        "editorId": "column49"
      }
    ],
    "editorId": "id1"
  }
}
```