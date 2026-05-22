# Design Export Context

- Generated at: `2026-04-21T17:19:34.966Z`
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

### 1. Add New Link

- Frame ID: `frame4`
- Original page prompt: "A simple input screen for pasting URLs and adding initial tags"
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
            "editorId": "container33"
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
                  "value": "xl"
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
                  }
                },
                "children": [
                  {
                    "type": "iconbutton",
                    "properties": {
                      "name": {
                        "icon": {
                          "name": "arrow_back_ios_new_rounded"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      },
                      "size": {
                        "numberVal": {
                          "value": 24
                        }
                      }
                    },
                    "editorId": "iconbutton1"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "INPUT_v0.1"
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
                      "font_weight": {
                        "stringVal": {
                          "value": "bold"
                        }
                      }
                    },
                    "editorId": "text42"
                  }
                ],
                "editorId": "row21"
              },
              {
                "type": "@kinetic_input_header",
                "properties": {
                  "label": {
                    "stringVal": {
                      "value": "PASTE_URL"
                    }
                  }
                },
                "editorId": "kineticinputheader1"
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
                              "name": "link_rounded"
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
                        "editorId": "icon14"
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
                                  "value": "HTTPS://VAULT.IO/RESOURCE..."
                                }
                              },
                              "hint_color": {
                                "stringVal": {
                                  "value": "secondary_text"
                                }
                              }
                            },
                            "editorId": "stdtextfield1"
                          }
                        ],
                        "editorId": "expanded5"
                      }
                    ],
                    "editorId": "row22"
                  }
                ],
                "editorId": "container34"
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
                      "token": "lg"
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
                          "named": "start"
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
                            "type": "container",
                            "properties": {
                              "width": {
                                "px": {
                                  "value": 48,
                                  "isInfinity": false
                                }
                              },
                              "height": {
                                "px": {
                                  "value": 48,
                                  "isInfinity": false
                                }
                              },
                              "bg": {
                                "color": {
                                  "color": "background"
                                }
                              },
                              "border": {
                                "border": {
                                  "width": 1,
                                  "color": "divider"
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
                                      "name": "public_rounded"
                                    }
                                  },
                                  "color": {
                                    "color": {
                                      "color": "hint"
                                    }
                                  }
                                },
                                "editorId": "icon15"
                              }
                            ],
                            "editorId": "container36"
                          },
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
                              },
                              "expanded": {
                                "expanded": {
                                  "enabled": true,
                                  "flex": 1
                                }
                              }
                            },
                            "children": [
                              {
                                "type": "text",
                                "properties": {
                                  "content": {
                                    "stringVal": {
                                      "value": "FETCHING_METADATA..."
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
                                "editorId": "text43"
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
                                  "width": {
                                    "px": {
                                      "value": "Infinity",
                                      "isInfinity": true
                                    }
                                  },
                                  "bg": {
                                    "color": {
                                      "color": "divider"
                                    }
                                  },
                                  "radius": {
                                    "radius": {
                                      "topLeft": 2,
                                      "topRight": 2,
                                      "bottomLeft": 2,
                                      "bottomRight": 2
                                    }
                                  }
                                },
                                "editorId": "skeleton1"
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
                                  "width": {
                                    "percent": {
                                      "value": 60
                                    }
                                  },
                                  "bg": {
                                    "color": {
                                      "color": "divider"
                                    }
                                  },
                                  "radius": {
                                    "radius": {
                                      "topLeft": 2,
                                      "topRight": 2,
                                      "bottomLeft": 2,
                                      "bottomRight": 2
                                    }
                                  }
                                },
                                "editorId": "skeleton2"
                              }
                            ],
                            "editorId": "column24"
                          }
                        ],
                        "editorId": "row23"
                      }
                    ],
                    "editorId": "column23"
                  }
                ],
                "editorId": "container35"
              },
              {
                "type": "column",
                "properties": {
                  "cross_align": {
                    "align": {
                      "named": "stretch"
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
                    "type": "@kinetic_input_header",
                    "properties": {
                      "label": {
                        "stringVal": {
                          "value": "ASSIGN_TAGS"
                        }
                      }
                    },
                    "editorId": "kineticinputheader2"
                  },
                  {
                    "type": "@std.textfield",
                    "properties": {
                      "label": {
                        "stringVal": {
                          "value": "NEW_TAG"
                        }
                      },
                      "hint": {
                        "stringVal": {
                          "value": "ENTER_KEYWORD..."
                        }
                      },
                      "trailing_icon": {
                        "stringVal": {
                          "value": "add_box_rounded"
                        }
                      }
                    },
                    "editorId": "textfield2"
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
                        "type": "@velocity_tag_chip",
                        "properties": {
                          "name": {
                            "stringVal": {
                              "value": "DESIGN"
                            }
                          },
                          "selected": {
                            "boolVal": {
                              "value": true
                            }
                          },
                          "can_remove": {
                            "boolVal": {
                              "value": true
                            }
                          }
                        },
                        "editorId": "tag1"
                      },
                      {
                        "type": "@velocity_tag_chip",
                        "properties": {
                          "name": {
                            "stringVal": {
                              "value": "DEV"
                            }
                          },
                          "selected": {
                            "boolVal": {
                              "value": false
                            }
                          },
                          "can_remove": {
                            "boolVal": {
                              "value": false
                            }
                          }
                        },
                        "editorId": "tag2"
                      },
                      {
                        "type": "@velocity_tag_chip",
                        "properties": {
                          "name": {
                            "stringVal": {
                              "value": "RESEARCH"
                            }
                          },
                          "selected": {
                            "boolVal": {
                              "value": false
                            }
                          },
                          "can_remove": {
                            "boolVal": {
                              "value": false
                            }
                          }
                        },
                        "editorId": "tag3"
                      },
                      {
                        "type": "@velocity_tag_chip",
                        "properties": {
                          "name": {
                            "stringVal": {
                              "value": "ARCHIVE"
                            }
                          },
                          "selected": {
                            "boolVal": {
                              "value": false
                            }
                          },
                          "can_remove": {
                            "boolVal": {
                              "value": false
                            }
                          }
                        },
                        "editorId": "tag4"
                      },
                      {
                        "type": "@velocity_tag_chip",
                        "properties": {
                          "name": {
                            "stringVal": {
                              "value": "UTILITY"
                            }
                          },
                          "selected": {
                            "boolVal": {
                              "value": true
                            }
                          },
                          "can_remove": {
                            "boolVal": {
                              "value": true
                            }
                          }
                        },
                        "editorId": "tag5"
                      }
                    ],
                    "editorId": "wrap2"
                  }
                ],
                "editorId": "column25"
              },
              {
                "type": "sizedbox",
                "properties": {
                  "height": {
                    "px": {
                      "value": 100,
                      "isInfinity": false
                    }
                  }
                },
                "editorId": "sizedbox2"
              }
            ],
            "editorId": "column22"
          },
          {
            "type": "container",
            "properties": {
              "align": {
                "align": {
                  "named": "bottom_center"
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
              "height": {
                "px": {
                  "value": 120,
                  "isInfinity": false
                }
              },
              "gradient": {
                "gradient": {
                  "type": "GRADIENT_TYPE_LINEAR",
                  "direction": "to_top",
                  "stops": [
                    {
                      "color": "background"
                    },
                    {
                      "color": "background/0"
                    }
                  ]
                }
              }
            },
            "children": [
              {
                "type": "@std.button",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "SAVE_TO_VAULT"
                    }
                  },
                  "variant": {
                    "stringVal": {
                      "value": "primary"
                    }
                  },
                  "full_width": {
                    "boolVal": {
                      "value": true
                    }
                  },
                  "size": {
                    "stringVal": {
                      "value": "large"
                    }
                  },
                  "icon": {
                    "stringVal": {
                      "value": "arrow_forward_rounded"
                    }
                  }
                },
                "editorId": "button1"
              }
            ],
            "editorId": "container37"
          }
        ],
        "editorId": "stack3"
      }
    ],
    "editorId": "scaffold3"
  }
}
```