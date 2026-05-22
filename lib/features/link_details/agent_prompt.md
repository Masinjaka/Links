# Design Export Context

- Generated at: `2026-04-21T17:21:05.826Z`
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

### 1. Link Details

- Frame ID: `frame8`
- Original page prompt: "A detailed view showing a link preview, full description, and metadata"
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
          "cross_align": {
            "align": {
              "named": "stretch"
            }
          }
        },
        "children": [
          {
            "type": "container",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "token": "lg"
                }
              },
              "border": {
                "borderSided": {
                  "side": "bottom",
                  "width": 1,
                  "color": "divider"
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
                          "name": "arrow_back_rounded"
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
                    "editorId": "iconbutton2"
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
                        "type": "iconbutton",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "share_rounded"
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
                        "editorId": "iconbutton3"
                      },
                      {
                        "type": "iconbutton",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "inventory_2_rounded"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "secondary_text"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 24
                            }
                          }
                        },
                        "editorId": "iconbutton4"
                      },
                      {
                        "type": "iconbutton",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "delete_outline_rounded"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "error"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 24
                            }
                          }
                        },
                        "editorId": "iconbutton5"
                      }
                    ],
                    "editorId": "row26"
                  }
                ],
                "editorId": "row25"
              }
            ],
            "editorId": "container47"
          },
          {
            "type": "container",
            "properties": {
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
                    "type": "column",
                    "properties": {
                      "spacing": {
                        "stringVal": {
                          "value": "xs"
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
                              "value": "VAULT / ASSET_VIEW"
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
                        "editorId": "text47"
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
                              "top": 8,
                              "right": 16,
                              "bottom": 8,
                              "left": 16
                            }
                          }
                        },
                        "children": [
                          {
                            "type": "text",
                            "properties": {
                              "content": {
                                "stringVal": {
                                  "value": "FUTURISM MANIFESTO 2024"
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
                              },
                              "max_lines": {
                                "numberVal": {
                                  "value": 2
                                }
                              },
                              "overflow": {
                                "stringVal": {
                                  "value": "ellipsis"
                                }
                              }
                            },
                            "editorId": "text48"
                          }
                        ],
                        "editorId": "container49"
                      }
                    ],
                    "editorId": "column34"
                  },
                  {
                    "type": "container",
                    "properties": {
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
                      "width": {
                        "px": {
                          "value": "Infinity",
                          "isInfinity": true
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
                                  "color": "surface"
                                }
                              },
                              "border": {
                                "border": {
                                  "width": 1,
                                  "color": "secondary"
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
                                      "name": "language_rounded"
                                    }
                                  },
                                  "color": {
                                    "color": {
                                      "color": "primary"
                                    }
                                  },
                                  "size": {
                                    "numberVal": {
                                      "value": 18
                                    }
                                  }
                                },
                                "editorId": "icon18"
                              }
                            ],
                            "editorId": "container51"
                          },
                          {
                            "type": "expanded",
                            "children": [
                              {
                                "type": "text",
                                "properties": {
                                  "content": {
                                    "stringVal": {
                                      "value": "https://manifesto.io/kinetic-typography-design-2024"
                                    }
                                  },
                                  "style": {
                                    "textStyle": {
                                      "styleName": "body_small"
                                    }
                                  },
                                  "color": {
                                    "color": {
                                      "color": "primary"
                                    }
                                  },
                                  "max_lines": {
                                    "numberVal": {
                                      "value": 1
                                    }
                                  },
                                  "overflow": {
                                    "stringVal": {
                                      "value": "ellipsis"
                                    }
                                  }
                                },
                                "editorId": "text49"
                              }
                            ],
                            "editorId": "expanded7"
                          },
                          {
                            "type": "iconbutton",
                            "properties": {
                              "name": {
                                "icon": {
                                  "name": "content_copy_rounded"
                                }
                              },
                              "size": {
                                "numberVal": {
                                  "value": 18
                                }
                              },
                              "color": {
                                "color": {
                                  "color": "secondary_text"
                                }
                              }
                            },
                            "editorId": "iconbutton6"
                          }
                        ],
                        "editorId": "row27"
                      }
                    ],
                    "editorId": "container50"
                  }
                ],
                "editorId": "column33"
              }
            ],
            "editorId": "container48"
          },
          {
            "type": "container",
            "properties": {
              "margin": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "rightToken": "lg",
                  "leftToken": "lg"
                }
              },
              "height": {
                "px": {
                  "value": 220,
                  "isInfinity": false
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
              "clip": {
                "boolVal": {
                  "value": true
                }
              },
              "border": {
                "border": {
                  "width": 2,
                  "color": "secondary"
                }
              },
              "shadow": {
                "stringVal": {
                  "value": "md"
                }
              }
            },
            "children": [
              {
                "type": "stack",
                "children": [
                  {
                    "type": "image",
                    "properties": {
                      "source_desc": {
                        "imageSource": {
                          "type": "IMAGE_SOURCE_TYPE_URL",
                          "value": "https://dimg.dreamflow.cloud/v1/image/abstract+kinetic+typography+poster+with+bold+black+and+white+letters+and+neon+accents"
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
                          "value": 220,
                          "isInfinity": false
                        }
                      }
                    },
                    "editorId": "image1"
                  },
                  {
                    "type": "container",
                    "properties": {
                      "gradient": {
                        "gradient": {
                          "type": "GRADIENT_TYPE_LINEAR",
                          "direction": "to_top",
                          "stops": [
                            {
                              "color": "on_secondary/67",
                              "position": 0
                            },
                            {
                              "color": "transparent",
                              "position": 50
                            }
                          ]
                        }
                      },
                      "align_y": {
                        "numberVal": {
                          "value": 1
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
                                  "value": "SOURCE_PREVIEW.JPG"
                                }
                              },
                              "style": {
                                "textStyle": {
                                  "styleName": "label_small"
                                }
                              },
                              "color": {
                                "color": {
                                  "color": "#FFFFFF"
                                }
                              }
                            },
                            "editorId": "text50"
                          },
                          {
                            "type": "text",
                            "properties": {
                              "content": {
                                "stringVal": {
                                  "value": "1240 x 800"
                                }
                              },
                              "style": {
                                "textStyle": {
                                  "styleName": "label_small"
                                }
                              },
                              "color": {
                                "color": {
                                  "color": "#FFFFFF"
                                }
                              }
                            },
                            "editorId": "text51"
                          }
                        ],
                        "editorId": "row28"
                      }
                    ],
                    "editorId": "container53"
                  }
                ],
                "editorId": "stack5"
              }
            ],
            "editorId": "container52"
          },
          {
            "type": "column",
            "properties": {
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
                      "value": "sm"
                    }
                  }
                },
                "children": [
                  {
                    "type": "container",
                    "properties": {
                      "width": {
                        "px": {
                          "value": 4,
                          "isInfinity": false
                        }
                      },
                      "height": {
                        "px": {
                          "value": 20,
                          "isInfinity": false
                        }
                      },
                      "bg": {
                        "color": {
                          "color": "primary"
                        }
                      }
                    },
                    "editorId": "container54"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "AUTO_SUMMARY"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "title_medium"
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
                    "editorId": "text52"
                  }
                ],
                "editorId": "row29"
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
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "This document explores the intersection of high-velocity motion graphics and traditional Swiss typography. It defines a new framework for 'Kinetic Futurism' where information density is balanced with rhythmic animation loops. Key takeaways include the use of monospaced fonts for technical precision and high-contrast color palettes for readability in low-light environments."
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "body_medium"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      },
                      "line_height": {
                        "numberVal": {
                          "value": 1.6
                        }
                      }
                    },
                    "editorId": "text53"
                  }
                ],
                "editorId": "container55"
              }
            ],
            "editorId": "column35"
          },
          {
            "type": "column",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "rightToken": "lg",
                  "bottomToken": "lg",
                  "leftToken": "lg"
                }
              },
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
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "METADATA_TAGS"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "label_large"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "secondary_text"
                    }
                  }
                },
                "editorId": "text54"
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
                    "type": "@metadata_tag",
                    "properties": {
                      "icon": {
                        "stringVal": {
                          "value": "tag_rounded"
                        }
                      },
                      "label": {
                        "stringVal": {
                          "value": "PHILOSOPHY"
                        }
                      }
                    },
                    "editorId": "metadatatag1"
                  },
                  {
                    "type": "@metadata_tag",
                    "properties": {
                      "icon": {
                        "stringVal": {
                          "value": "design_services_rounded"
                        }
                      },
                      "label": {
                        "stringVal": {
                          "value": "KINETIC_UI"
                        }
                      }
                    },
                    "editorId": "metadatatag2"
                  },
                  {
                    "type": "@metadata_tag",
                    "properties": {
                      "icon": {
                        "stringVal": {
                          "value": "speed_rounded"
                        }
                      },
                      "label": {
                        "stringVal": {
                          "value": "VELOCITY"
                        }
                      }
                    },
                    "editorId": "metadatatag3"
                  },
                  {
                    "type": "@metadata_tag",
                    "properties": {
                      "icon": {
                        "stringVal": {
                          "value": "history_rounded"
                        }
                      },
                      "label": {
                        "stringVal": {
                          "value": "ADDED_APR_12"
                        }
                      }
                    },
                    "editorId": "metadatatag4"
                  },
                  {
                    "type": "@metadata_tag",
                    "properties": {
                      "icon": {
                        "stringVal": {
                          "value": "schedule_rounded"
                        }
                      },
                      "label": {
                        "stringVal": {
                          "value": "READ_5_MIN"
                        }
                      }
                    },
                    "editorId": "metadatatag5"
                  }
                ],
                "editorId": "wrap4"
              }
            ],
            "editorId": "column36"
          },
          {
            "type": "container",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "token": "lg"
                }
              },
              "border": {
                "borderSided": {
                  "side": "top",
                  "width": 4,
                  "color": "primary/20"
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
                              "value": "open_in_new_rounded"
                            }
                          },
                          "label": {
                            "stringVal": {
                              "value": "OPEN_LINK"
                            }
                          },
                          "primary": {
                            "boolVal": {
                              "value": true
                            }
                          }
                        },
                        "editorId": "velocitybutton1"
                      },
                      {
                        "type": "@velocity_button",
                        "properties": {
                          "icon": {
                            "stringVal": {
                              "value": "edit_note_rounded"
                            }
                          },
                          "label": {
                            "stringVal": {
                              "value": "EDIT_VAULT"
                            }
                          },
                          "primary": {
                            "boolVal": {
                              "value": false
                            }
                          }
                        },
                        "editorId": "velocitybutton2"
                      }
                    ],
                    "editorId": "row30"
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
                      }
                    },
                    "children": [
                      {
                        "type": "column",
                        "properties": {
                          "spacing": {
                            "stringVal": {
                              "value": "xs"
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
                                  "value": "LAST_SYNC: 2024-04-12 14:30:01"
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
                            "editorId": "log1"
                          },
                          {
                            "type": "text",
                            "properties": {
                              "content": {
                                "stringVal": {
                                  "value": "OBJECT_ID: LV-9928-X"
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
                            "editorId": "log2"
                          }
                        ],
                        "editorId": "column38"
                      }
                    ],
                    "editorId": "container57"
                  }
                ],
                "editorId": "column37"
              }
            ],
            "editorId": "container56"
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
            "editorId": "sizedbox4"
          }
        ],
        "editorId": "column32"
      }
    ],
    "editorId": "scaffold5"
  }
}
```