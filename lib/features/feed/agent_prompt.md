# Design Export Context

- Generated at: `2026-04-21T17:18:08.256Z`
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

### 1. Main Link Feed

- Frame ID: `frame1`
- Original page prompt: "A searchable list of all saved links with tags and quick actions"
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
        "type": "stack",
        "children": [
          {
            "type": "shader_fill",
            "properties": {
              "preset": {
                "stringVal": {
                  "value": "emberFlow"
                }
              },
              "gradient_angle": {
                "numberVal": {
                  "value": 135
                }
              },
              "color0": {
                "color": {
                  "color": "background"
                }
              },
              "color1": {
                "color": {
                  "color": "surface"
                }
              },
              "color2": {
                "color": {
                  "color": "primary",
                  "opacityPercent": 20
                }
              }
            },
            "editorId": "shaderfill1"
          },
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
                          "value": "LINK"
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
                    "editorId": "text39"
                  },
                  {
                    "type": "container",
                    "properties": {
                      "transform_rotate": {
                        "numberVal": {
                          "value": 2
                        }
                      },
                      "bg": {
                        "color": {
                          "color": "primary"
                        }
                      },
                      "padding": {
                        "edgeInsets": {
                          "top": 4,
                          "right": 12,
                          "bottom": 4,
                          "left": 12
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "VAULT_v2"
                            }
                          },
                          "style": {
                            "textStyle": {
                              "styleName": "headline_medium"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "on_primary"
                            }
                          }
                        },
                        "editorId": "text40"
                      }
                    ],
                    "editorId": "container26"
                  }
                ],
                "editorId": "column19"
              },
              {
                "type": "container",
                "properties": {
                  "border": {
                    "borderSided": {
                      "side": "bottom",
                      "width": 4,
                      "color": "primary"
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 0,
                      "right": 0,
                      "bottom": 0,
                      "left": 0,
                      "bottomToken": "sm"
                    }
                  }
                },
                "children": [
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
                        "type": "icon",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "search_rounded"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 28
                            }
                          }
                        },
                        "editorId": "icon12"
                      },
                      {
                        "type": "expanded",
                        "children": [
                          {
                            "type": "@std.textfield",
                            "properties": {
                              "variant": {
                                "stringVal": {
                                  "value": "ghost"
                                }
                              },
                              "hint": {
                                "stringVal": {
                                  "value": "SEARCH_SYSTEM..."
                                }
                              },
                              "hint_color": {
                                "stringVal": {
                                  "value": "secondary_text"
                                }
                              }
                            },
                            "editorId": "textfield1"
                          }
                        ],
                        "editorId": "expanded4"
                      }
                    ],
                    "editorId": "row19"
                  }
                ],
                "editorId": "container27"
              },
              {
                "type": "row",
                "properties": {
                  "scroll": {
                    "boolVal": {
                      "value": true
                    }
                  },
                  "spacing": {
                    "stringVal": {
                      "value": "md"
                    }
                  }
                },
                "children": [
                  {
                    "type": "chip",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "ALL_ASSETS"
                        }
                      },
                      "selected": {
                        "boolVal": {
                          "value": true
                        }
                      },
                      "bg": {
                        "color": {
                          "color": "primary"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "on_primary"
                        }
                      },
                      "radius": {
                        "radius": {
                          "topLeft": 0,
                          "topRight": 0,
                          "bottomLeft": 0,
                          "bottomRight": 0
                        }
                      }
                    },
                    "editorId": "chip1"
                  },
                  {
                    "type": "chip",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "DESIGN"
                        }
                      },
                      "variant": {
                        "stringVal": {
                          "value": "filter"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      },
                      "radius": {
                        "radius": {
                          "topLeft": 0,
                          "topRight": 0,
                          "bottomLeft": 0,
                          "bottomRight": 0
                        }
                      },
                      "border": {
                        "border": {
                          "width": 1,
                          "color": "secondary"
                        }
                      }
                    },
                    "editorId": "chip2"
                  },
                  {
                    "type": "chip",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "DEV_LOGS"
                        }
                      },
                      "variant": {
                        "stringVal": {
                          "value": "filter"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      },
                      "radius": {
                        "radius": {
                          "topLeft": 0,
                          "topRight": 0,
                          "bottomLeft": 0,
                          "bottomRight": 0
                        }
                      },
                      "border": {
                        "border": {
                          "width": 1,
                          "color": "secondary"
                        }
                      }
                    },
                    "editorId": "chip3"
                  },
                  {
                    "type": "chip",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "ARCHIVE"
                        }
                      },
                      "variant": {
                        "stringVal": {
                          "value": "filter"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      },
                      "radius": {
                        "radius": {
                          "topLeft": 0,
                          "topRight": 0,
                          "bottomLeft": 0,
                          "bottomRight": 0
                        }
                      },
                      "border": {
                        "border": {
                          "width": 1,
                          "color": "secondary"
                        }
                      }
                    },
                    "editorId": "chip4"
                  }
                ],
                "editorId": "row20"
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
                    "type": "@kinetic_link_card",
                    "properties": {
                      "title": {
                        "stringVal": {
                          "value": "FUTURISM MANIFESTO 2024"
                        }
                      },
                      "url": {
                        "stringVal": {
                          "value": "manifesto.io/kinetic"
                        }
                      },
                      "tag": {
                        "stringVal": {
                          "value": "PHILOSOPHY"
                        }
                      },
                      "date": {
                        "stringVal": {
                          "value": "04.12"
                        }
                      }
                    },
                    "editorId": "kineticlinkcard1"
                  },
                  {
                    "type": "@kinetic_link_card",
                    "properties": {
                      "title": {
                        "stringVal": {
                          "value": "HIGH-VELOCITY GRID SYSTEMS"
                        }
                      },
                      "url": {
                        "stringVal": {
                          "value": "grid.dev/sharp-edges"
                        }
                      },
                      "tag": {
                        "stringVal": {
                          "value": "DESIGN"
                        }
                      },
                      "date": {
                        "stringVal": {
                          "value": "03.28"
                        }
                      }
                    },
                    "editorId": "kineticlinkcard2"
                  },
                  {
                    "type": "@kinetic_link_card",
                    "properties": {
                      "title": {
                        "stringVal": {
                          "value": "METAL_GEAR_SOLID_REF_UI"
                        }
                      },
                      "url": {
                        "stringVal": {
                          "value": "vault.com/mgs-interface"
                        }
                      },
                      "tag": {
                        "stringVal": {
                          "value": "INSPIRATION"
                        }
                      },
                      "date": {
                        "stringVal": {
                          "value": "02.15"
                        }
                      }
                    },
                    "editorId": "kineticlinkcard3"
                  },
                  {
                    "type": "@kinetic_link_card",
                    "properties": {
                      "title": {
                        "stringVal": {
                          "value": "OSWALD TYPEFACE SPECIMEN"
                        }
                      },
                      "url": {
                        "stringVal": {
                          "value": "fonts.google.com/oswald"
                        }
                      },
                      "tag": {
                        "stringVal": {
                          "value": "TYPOGRAPHY"
                        }
                      },
                      "date": {
                        "stringVal": {
                          "value": "01.10"
                        }
                      }
                    },
                    "editorId": "kineticlinkcard4"
                  },
                  {
                    "type": "@kinetic_link_card",
                    "properties": {
                      "title": {
                        "stringVal": {
                          "value": "REACT_KINETIC_ANIMATIONS"
                        }
                      },
                      "url": {
                        "stringVal": {
                          "value": "github.com/motion/logic"
                        }
                      },
                      "tag": {
                        "stringVal": {
                          "value": "DEV"
                        }
                      },
                      "date": {
                        "stringVal": {
                          "value": "12.22"
                        }
                      }
                    },
                    "editorId": "kineticlinkcard5"
                  }
                ],
                "editorId": "column20"
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
                "editorId": "sizedbox1"
              }
            ],
            "editorId": "column18"
          },
          {
            "type": "container",
            "properties": {
              "align": {
                "align": {
                  "named": "bottom_right"
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
                  },
                  "main_size": {
                    "stringVal": {
                      "value": "min"
                    }
                  }
                },
                "children": [
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
                      "bg": {
                        "color": {
                          "color": "primary"
                        }
                      },
                      "shadow": {
                        "stringVal": {
                          "value": "md"
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
                        "type": "icon",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "add_rounded"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "on_primary"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 32
                            }
                          }
                        },
                        "editorId": "icon13"
                      }
                    ],
                    "editorId": "container29"
                  },
                  {
                    "type": "container",
                    "properties": {
                      "transform_rotate": {
                        "numberVal": {
                          "value": -5
                        }
                      },
                      "align": {
                        "align": {
                          "named": "self_end"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "SYNC_NOW"
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
                          },
                          "decoration": {
                            "stringVal": {
                              "value": "underline"
                            }
                          }
                        },
                        "editorId": "text41"
                      }
                    ],
                    "editorId": "container30"
                  }
                ],
                "editorId": "column21"
              }
            ],
            "editorId": "container28"
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
                  "opacityPercent": 30
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
                      "value": 65
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
                "editorId": "container32"
              }
            ],
            "editorId": "container31"
          }
        ],
        "editorId": "stack2"
      }
    ],
    "editorId": "scaffold2"
  }
}
```