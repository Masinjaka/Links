# Design Export Context

- Generated at: `2026-04-21T17:23:12.352Z`
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

### 1. Search and Filters

- Frame ID: `frame6`
- Original page prompt: "Advanced search interface with filtering by date, tag, and domain"
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
            "type": "container",
            "properties": {
              "align": {
                "align": {
                  "named": "top_right"
                }
              },
              "width": {
                "px": {
                  "value": 150,
                  "isInfinity": false
                }
              },
              "height": {
                "px": {
                  "value": 150,
                  "isInfinity": false
                }
              },
              "transform_rotate": {
                "numberVal": {
                  "value": 15
                }
              },
              "bg": {
                "color": {
                  "color": "primary",
                  "opacityPercent": 5
                }
              },
              "margin": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0
                }
              }
            },
            "editorId": "container58"
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
                          "value": "ADVANCED"
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
                      "weight": {
                        "numberVal": {
                          "value": 900
                        }
                      }
                    },
                    "editorId": "head1"
                  },
                  {
                    "type": "row",
                    "properties": {
                      "spacing": {
                        "stringVal": {
                          "value": "sm"
                        }
                      },
                      "cross_align": {
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
                              "value": "SEARCH_SYS"
                            }
                          },
                          "style": {
                            "textStyle": {
                              "styleName": "headline_medium"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          },
                          "weight": {
                            "numberVal": {
                              "value": 800
                            }
                          }
                        },
                        "editorId": "head2"
                      },
                      {
                        "type": "container",
                        "properties": {
                          "expanded": {
                            "expanded": {
                              "enabled": true,
                              "flex": 1
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
                              "color": "primary"
                            }
                          }
                        },
                        "editorId": "container59"
                      }
                    ],
                    "editorId": "row31"
                  }
                ],
                "editorId": "column40"
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
                      "width": 2,
                      "color": "primary"
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
                              "value": 24
                            }
                          }
                        },
                        "editorId": "icon19"
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
                                  "value": "ENTER_KEYWORDS..."
                                }
                              },
                              "hint_color": {
                                "stringVal": {
                                  "value": "secondary_text"
                                }
                              }
                            },
                            "editorId": "stdtextfield3"
                          }
                        ],
                        "editorId": "expanded8"
                      },
                      {
                        "type": "iconbutton",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "tune_rounded"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 20
                            }
                          },
                          "tooltip": {
                            "stringVal": {
                              "value": "Advanced Filters"
                            }
                          }
                        },
                        "editorId": "iconbutton7"
                      }
                    ],
                    "editorId": "row32"
                  }
                ],
                "editorId": "container60"
              },
              {
                "type": "container",
                "properties": {
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
                      "color": "surface",
                      "opacityPercent": 50
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
                      "cross_align": {
                        "align": {
                          "named": "stretch"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "@filter_header",
                        "properties": {
                          "title": {
                            "stringVal": {
                              "value": "DOMAIN_SOURCE"
                            }
                          },
                          "icon": {
                            "stringVal": {
                              "value": "language_rounded"
                            }
                          }
                        },
                        "editorId": "filterheader1"
                      },
                      {
                        "type": "wrap",
                        "properties": {
                          "spacing": {
                            "numberVal": {
                              "value": 0
                            }
                          },
                          "run_spacing": {
                            "numberVal": {
                              "value": 0
                            }
                          }
                        },
                        "children": [
                          {
                            "type": "@kinetic_tag_chip",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "GITHUB.COM"
                                }
                              },
                              "selected": {
                                "boolVal": {
                                  "value": true
                                }
                              },
                              "show_icon": {
                                "boolVal": {
                                  "value": true
                                }
                              }
                            },
                            "editorId": "kinetictagchip1"
                          },
                          {
                            "type": "@kinetic_tag_chip",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "MEDIUM.COM"
                                }
                              },
                              "selected": {
                                "boolVal": {
                                  "value": false
                                }
                              },
                              "show_icon": {
                                "boolVal": {
                                  "value": false
                                }
                              }
                            },
                            "editorId": "kinetictagchip2"
                          },
                          {
                            "type": "@kinetic_tag_chip",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "DRIBBBLE.COM"
                                }
                              },
                              "selected": {
                                "boolVal": {
                                  "value": false
                                }
                              },
                              "show_icon": {
                                "boolVal": {
                                  "value": false
                                }
                              }
                            },
                            "editorId": "kinetictagchip3"
                          },
                          {
                            "type": "@kinetic_tag_chip",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "NOTION.SO"
                                }
                              },
                              "selected": {
                                "boolVal": {
                                  "value": true
                                }
                              },
                              "show_icon": {
                                "boolVal": {
                                  "value": true
                                }
                              }
                            },
                            "editorId": "kinetictagchip4"
                          }
                        ],
                        "editorId": "wrap5"
                      },
                      {
                        "type": "@filter_header",
                        "properties": {
                          "title": {
                            "stringVal": {
                              "value": "TEMPORAL_RANGE"
                            }
                          },
                          "icon": {
                            "stringVal": {
                              "value": "schedule_rounded"
                            }
                          }
                        },
                        "editorId": "filterheader2"
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
                            "type": "expanded",
                            "children": [
                              {
                                "type": "@std.textfield",
                                "properties": {
                                  "variant": {
                                    "stringVal": {
                                      "value": "outlined"
                                    }
                                  },
                                  "label": {
                                    "stringVal": {
                                      "value": "FROM"
                                    }
                                  },
                                  "hint": {
                                    "stringVal": {
                                      "value": "YYYY-MM-DD"
                                    }
                                  },
                                  "leading_icon": {
                                    "stringVal": {
                                      "value": "calendar_today_rounded"
                                    }
                                  }
                                },
                                "editorId": "stdtextfield4"
                              }
                            ],
                            "editorId": "expanded9"
                          },
                          {
                            "type": "expanded",
                            "children": [
                              {
                                "type": "@std.textfield",
                                "properties": {
                                  "variant": {
                                    "stringVal": {
                                      "value": "outlined"
                                    }
                                  },
                                  "label": {
                                    "stringVal": {
                                      "value": "TO"
                                    }
                                  },
                                  "hint": {
                                    "stringVal": {
                                      "value": "PRESENT"
                                    }
                                  },
                                  "leading_icon": {
                                    "stringVal": {
                                      "value": "arrow_forward_rounded"
                                    }
                                  }
                                },
                                "editorId": "textfield3"
                              }
                            ],
                            "editorId": "expanded10"
                          }
                        ],
                        "editorId": "row33"
                      },
                      {
                        "type": "@filter_header",
                        "properties": {
                          "title": {
                            "stringVal": {
                              "value": "TAG_INDEX"
                            }
                          },
                          "icon": {
                            "stringVal": {
                              "value": "local_offer_rounded"
                            }
                          }
                        },
                        "editorId": "filterheader3"
                      },
                      {
                        "type": "wrap",
                        "properties": {
                          "spacing": {
                            "numberVal": {
                              "value": 0
                            }
                          },
                          "run_spacing": {
                            "numberVal": {
                              "value": 0
                            }
                          }
                        },
                        "children": [
                          {
                            "type": "@kinetic_tag_chip",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "DEVELOPMENT"
                                }
                              },
                              "selected": {
                                "boolVal": {
                                  "value": true
                                }
                              },
                              "show_icon": {
                                "boolVal": {
                                  "value": true
                                }
                              }
                            },
                            "editorId": "kinetictagchip5"
                          },
                          {
                            "type": "@kinetic_tag_chip",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "UI_DESIGN"
                                }
                              },
                              "selected": {
                                "boolVal": {
                                  "value": false
                                }
                              },
                              "show_icon": {
                                "boolVal": {
                                  "value": false
                                }
                              }
                            },
                            "editorId": "kinetictagchip6"
                          },
                          {
                            "type": "@kinetic_tag_chip",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "RESEARCH"
                                }
                              },
                              "selected": {
                                "boolVal": {
                                  "value": true
                                }
                              },
                              "show_icon": {
                                "boolVal": {
                                  "value": true
                                }
                              }
                            },
                            "editorId": "kinetictagchip7"
                          },
                          {
                            "type": "@kinetic_tag_chip",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "FUTURISM"
                                }
                              },
                              "selected": {
                                "boolVal": {
                                  "value": false
                                }
                              },
                              "show_icon": {
                                "boolVal": {
                                  "value": false
                                }
                              }
                            },
                            "editorId": "kinetictagchip8"
                          },
                          {
                            "type": "@kinetic_tag_chip",
                            "properties": {
                              "label": {
                                "stringVal": {
                                  "value": "WEB3"
                                }
                              },
                              "selected": {
                                "boolVal": {
                                  "value": false
                                }
                              },
                              "show_icon": {
                                "boolVal": {
                                  "value": false
                                }
                              }
                            },
                            "editorId": "kinetictagchip9"
                          }
                        ],
                        "editorId": "wrap6"
                      }
                    ],
                    "editorId": "column41"
                  }
                ],
                "editorId": "container61"
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
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "FOUND: 12_OBJECTS"
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
                      },
                      "weight": {
                        "numberVal": {
                          "value": 700
                        }
                      }
                    },
                    "editorId": "text55"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "SORT: RECENT_DESC"
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
                      "decoration": {
                        "stringVal": {
                          "value": "underline"
                        }
                      }
                    },
                    "editorId": "text56"
                  }
                ],
                "editorId": "row34"
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
                      "named": "stretch"
                    }
                  }
                },
                "children": [
                  {
                    "type": "@result_item",
                    "properties": {
                      "title": {
                        "stringVal": {
                          "value": "Flutter Kinetic Animation Engine"
                        }
                      },
                      "domain": {
                        "stringVal": {
                          "value": "github.com"
                        }
                      },
                      "domain_icon": {
                        "stringVal": {
                          "value": "code_rounded"
                        }
                      },
                      "date": {
                        "stringVal": {
                          "value": "2024.05.12"
                        }
                      }
                    },
                    "editorId": "resultitem1"
                  },
                  {
                    "type": "@result_item",
                    "properties": {
                      "title": {
                        "stringVal": {
                          "value": "The Future of Grid Systems"
                        }
                      },
                      "domain": {
                        "stringVal": {
                          "value": "medium.com"
                        }
                      },
                      "domain_icon": {
                        "stringVal": {
                          "value": "description_rounded"
                        }
                      },
                      "date": {
                        "stringVal": {
                          "value": "2024.04.28"
                        }
                      }
                    },
                    "editorId": "resultitem2"
                  },
                  {
                    "type": "@result_item",
                    "properties": {
                      "title": {
                        "stringVal": {
                          "value": "Cyberpunk Interface Guidelines"
                        }
                      },
                      "domain": {
                        "stringVal": {
                          "value": "notion.so"
                        }
                      },
                      "domain_icon": {
                        "stringVal": {
                          "value": "architecture_rounded"
                        }
                      },
                      "date": {
                        "stringVal": {
                          "value": "2024.03.15"
                        }
                      }
                    },
                    "editorId": "resultitem3"
                  },
                  {
                    "type": "@result_item",
                    "properties": {
                      "title": {
                        "stringVal": {
                          "value": "High Velocity UX Research"
                        }
                      },
                      "domain": {
                        "stringVal": {
                          "value": "github.com"
                        }
                      },
                      "domain_icon": {
                        "stringVal": {
                          "value": "analytics_rounded"
                        }
                      },
                      "date": {
                        "stringVal": {
                          "value": "2024.02.10"
                        }
                      }
                    },
                    "editorId": "resultitem4"
                  }
                ],
                "editorId": "column42"
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
                "editorId": "sizedbox5"
              }
            ],
            "editorId": "column39"
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
                "type": "@std.button",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "EXECUTE_SEARCH"
                    }
                  },
                  "icon": {
                    "stringVal": {
                      "value": "search_rounded"
                    }
                  },
                  "variant": {
                    "stringVal": {
                      "value": "primary"
                    }
                  },
                  "size": {
                    "stringVal": {
                      "value": "large"
                    }
                  },
                  "shadow": {
                    "stringVal": {
                      "value": "xl"
                    }
                  }
                },
                "editorId": "stdbutton1"
              }
            ],
            "editorId": "container62"
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
                      "value": 45
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
                "editorId": "container64"
              }
            ],
            "editorId": "container63"
          }
        ],
        "editorId": "stack6"
      }
    ],
    "editorId": "scaffold6"
  }
}
```