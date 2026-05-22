# Design Export Context

- Generated at: `2026-04-21T17:20:33.305Z`
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

### 1. Collections

- Frame ID: `frame7`
- Original page prompt: "A grid view of folders and categorized link groups"
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
                  "value": 200,
                  "isInfinity": false
                }
              },
              "height": {
                "px": {
                  "value": 200,
                  "isInfinity": false
                }
              },
              "opacity": {
                "numberVal": {
                  "value": 0.05
                }
              },
              "transform_rotate": {
                "numberVal": {
                  "value": 45
                }
              },
              "bg": {
                "color": {
                  "color": "primary"
                }
              }
            },
            "editorId": "container38"
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
                      },
                      "line_height": {
                        "numberVal": {
                          "value": 0.8
                        }
                      }
                    },
                    "editorId": "text44"
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
                              "value": "COLLECTIONS_v2"
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
                        "editorId": "text45"
                      }
                    ],
                    "editorId": "container39"
                  }
                ],
                "editorId": "column27"
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
                      "topToken": "sm",
                      "rightToken": "md",
                      "bottomToken": "sm",
                      "leftToken": "md"
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
                              "name": "grid_view_rounded"
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
                          }
                        },
                        "editorId": "icon16"
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
                                  "value": "FILTER_COLLECTIONS..."
                                }
                              },
                              "hint_color": {
                                "stringVal": {
                                  "value": "secondary_text"
                                }
                              }
                            },
                            "editorId": "stdtextfield2"
                          }
                        ],
                        "editorId": "expanded6"
                      }
                    ],
                    "editorId": "row24"
                  }
                ],
                "editorId": "container40"
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
                          "value": "FOLDERS"
                        }
                      },
                      "shrink_wrap": {
                        "boolVal": {
                          "value": true
                        }
                      }
                    },
                    "editorId": "velocitysectionheader1"
                  },
                  {
                    "type": "grid",
                    "properties": {
                      "columns": {
                        "numberVal": {
                          "value": 2
                        }
                      },
                      "spacing": {
                        "stringVal": {
                          "value": "md"
                        }
                      },
                      "run_spacing": {
                        "stringVal": {
                          "value": "md"
                        }
                      },
                      "aspect_ratio": {
                        "numberVal": {
                          "value": 1.2
                        }
                      },
                      "shrink_wrap": {
                        "boolVal": {
                          "value": true
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "@collection_grid_card",
                        "properties": {
                          "title": {
                            "stringVal": {
                              "value": "WORK_PROJECTS"
                            }
                          },
                          "icon": {
                            "stringVal": {
                              "value": "folder_rounded"
                            }
                          },
                          "count": {
                            "stringVal": {
                              "value": "24"
                            }
                          },
                          "type": {
                            "stringVal": {
                              "value": "PRIVATE"
                            }
                          }
                        },
                        "editorId": "folder1"
                      },
                      {
                        "type": "@collection_grid_card",
                        "properties": {
                          "title": {
                            "stringVal": {
                              "value": "READ_LATER"
                            }
                          },
                          "icon": {
                            "stringVal": {
                              "value": "bookmark_rounded"
                            }
                          },
                          "count": {
                            "stringVal": {
                              "value": "112"
                            }
                          },
                          "type": {
                            "stringVal": {
                              "value": "QUEUE"
                            }
                          }
                        },
                        "editorId": "folder2"
                      },
                      {
                        "type": "@collection_grid_card",
                        "properties": {
                          "title": {
                            "stringVal": {
                              "value": "DESIGN_INSP"
                            }
                          },
                          "icon": {
                            "stringVal": {
                              "value": "auto_awesome_mosaic_rounded"
                            }
                          },
                          "count": {
                            "stringVal": {
                              "value": "45"
                            }
                          },
                          "type": {
                            "stringVal": {
                              "value": "SHARED"
                            }
                          }
                        },
                        "editorId": "folder3"
                      },
                      {
                        "type": "@collection_grid_card",
                        "properties": {
                          "title": {
                            "stringVal": {
                              "value": "DEV_RESOURCES"
                            }
                          },
                          "icon": {
                            "stringVal": {
                              "value": "terminal_rounded"
                            }
                          },
                          "count": {
                            "stringVal": {
                              "value": "89"
                            }
                          },
                          "type": {
                            "stringVal": {
                              "value": "SYSTEM"
                            }
                          }
                        },
                        "editorId": "folder4"
                      }
                    ],
                    "editorId": "grid1"
                  }
                ],
                "editorId": "column28"
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
                          "value": "TAG_GROUPS"
                        }
                      }
                    },
                    "editorId": "velocitysectionheader2"
                  },
                  {
                    "type": "wrap",
                    "properties": {
                      "spacing": {
                        "stringVal": {
                          "value": "sm"
                        }
                      },
                      "run_spacing": {
                        "stringVal": {
                          "value": "sm"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "chip",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "#TYPESCRIPT"
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
                          "radius": {
                            "radius": {
                              "topLeft": 0,
                              "topRight": 0,
                              "bottomLeft": 0,
                              "bottomRight": 0
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          }
                        },
                        "editorId": "t1"
                      },
                      {
                        "type": "chip",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "#ARCHITECTURE"
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
                          "radius": {
                            "radius": {
                              "topLeft": 0,
                              "topRight": 0,
                              "bottomLeft": 0,
                              "bottomRight": 0
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          }
                        },
                        "editorId": "t2"
                      },
                      {
                        "type": "chip",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "#UI_UX"
                            }
                          },
                          "bg": {
                            "color": {
                              "color": "primary"
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
                          "color": {
                            "color": {
                              "color": "on_primary"
                            }
                          }
                        },
                        "editorId": "t3"
                      },
                      {
                        "type": "chip",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "#MOTION"
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
                          "radius": {
                            "radius": {
                              "topLeft": 0,
                              "topRight": 0,
                              "bottomLeft": 0,
                              "bottomRight": 0
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          }
                        },
                        "editorId": "t4"
                      },
                      {
                        "type": "chip",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "#WEB3"
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
                          "radius": {
                            "radius": {
                              "topLeft": 0,
                              "topRight": 0,
                              "bottomLeft": 0,
                              "bottomRight": 0
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          }
                        },
                        "editorId": "t5"
                      },
                      {
                        "type": "chip",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "#AI_MODELS"
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
                          "radius": {
                            "radius": {
                              "topLeft": 0,
                              "topRight": 0,
                              "bottomLeft": 0,
                              "bottomRight": 0
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          }
                        },
                        "editorId": "t6"
                      },
                      {
                        "type": "chip",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "#RECIPES"
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
                          "radius": {
                            "radius": {
                              "topLeft": 0,
                              "topRight": 0,
                              "bottomLeft": 0,
                              "bottomRight": 0
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          }
                        },
                        "editorId": "t7"
                      }
                    ],
                    "editorId": "wrap3"
                  }
                ],
                "editorId": "column29"
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
                          "value": "VELOCITY_METRICS"
                        }
                      }
                    },
                    "editorId": "velocitysectionheader3"
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
                      "height": {
                        "px": {
                          "value": 180,
                          "isInfinity": false
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "bar_chart",
                        "properties": {
                          "data": {
                            "stringVal": {
                              "value": "40,70,55,90,30,80"
                            }
                          },
                          "labels": {
                            "stringVal": {
                              "value": "M,T,W,T,F,S"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary"
                            }
                          },
                          "bar_width": {
                            "numberVal": {
                              "value": 20
                            }
                          },
                          "bar_radius": {
                            "numberVal": {
                              "value": 0
                            }
                          },
                          "show_grid": {
                            "boolVal": {
                              "value": false
                            }
                          }
                        },
                        "editorId": "barchart1"
                      }
                    ],
                    "editorId": "container41"
                  }
                ],
                "editorId": "column30"
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
                "editorId": "sizedbox3"
              }
            ],
            "editorId": "column26"
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
                  },
                  "cross_align": {
                    "align": {
                      "named": "end"
                    }
                  }
                },
                "children": [
                  {
                    "type": "container",
                    "properties": {
                      "width": {
                        "px": {
                          "value": 60,
                          "isInfinity": false
                        }
                      },
                      "height": {
                        "px": {
                          "value": 60,
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
                          "value": "lg"
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
                              "name": "create_new_folder_rounded"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "on_primary"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 28
                            }
                          }
                        },
                        "editorId": "icon17"
                      }
                    ],
                    "editorId": "container43"
                  },
                  {
                    "type": "container",
                    "properties": {
                      "transform_rotate": {
                        "numberVal": {
                          "value": -3
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
                          "color": "primary"
                        }
                      },
                      "padding": {
                        "edgeInsets": {
                          "top": 4,
                          "right": 8,
                          "bottom": 4,
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
                              "value": "NEW_COLLECTION"
                            }
                          },
                          "style": {
                            "textStyle": {
                              "styleName": "label_small"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          },
                          "font_weight": {
                            "stringVal": {
                              "value": "bold"
                            }
                          }
                        },
                        "editorId": "text46"
                      }
                    ],
                    "editorId": "container44"
                  }
                ],
                "editorId": "column31"
              }
            ],
            "editorId": "container42"
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
                  "value": 2,
                  "isInfinity": false
                }
              },
              "bg": {
                "color": {
                  "color": "secondary",
                  "opacityPercent": 20
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
                      "value": 40
                    }
                  },
                  "bg": {
                    "color": {
                      "color": "primary"
                    }
                  },
                  "height": {
                    "px": {
                      "value": 2,
                      "isInfinity": false
                    }
                  }
                },
                "editorId": "container46"
              }
            ],
            "editorId": "container45"
          }
        ],
        "editorId": "stack4"
      }
    ],
    "editorId": "scaffold4"
  }
}
```